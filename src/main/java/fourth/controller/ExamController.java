package fourth.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import fourth.bean.ExamBean;
import fourth.bean.ExamEduBean;
import fourth.bean.ExamQuesBean;
import fourth.bean.ExamSubBean;
import fourth.bean.MemberBean;
import fourth.bean.OrderUser;
import fourth.dao.ExamDaoInterface;
import fourth.service.ExamService;
import fourth.service.ExamTestService;
import fourth.util.ExamUtil;


//	/ExamMainView
@Controller
@SessionAttributes(names = {"testMap","user"})
public class ExamController {
	
	@Autowired
	private ExamService examService;
	
	@Autowired
	private ExamTestService examTestService;
	
	@GetMapping("/firstExamController")
	public String entrance(Model m,HttpServletRequest request) {
		
		MemberBean user = (MemberBean)m.getAttribute("user");
//		String pageStatus = (String) m.getAttribute("pageStatus");
		String pageStatus = (String)request.getSession().getAttribute("pageStatus");
		String nextPage = "";
		
		if (user.getStatus()==3) {
			if (pageStatus.equals("3") ) {
				nextPage="Exam";
			}else {
				nextPage="ExamMember";
			}
		}else {
			nextPage="ExamMember";
		}
		return nextPage;
	}
	

	
	@PostMapping("/ExamController")
	public String processAction(@RequestParam("todo") String todo, Model m
			
			//考試相關(queryAll的參數)
			,@RequestParam(defaultValue = "") String quSubject,@RequestParam(defaultValue = "") String quEducation
			
			//考卷相關(個別query參數)
			,@RequestParam(defaultValue = "") String subject,@RequestParam(defaultValue = "") String education
			,@RequestParam(defaultValue = "") String examName,@RequestParam(defaultValue = "") String examDate
			,@RequestParam(defaultValue = "") String examID,@RequestParam(defaultValue = "") String examPic
			,@RequestParam(defaultValue = "") String difficulty
			
			//考試答題答案
			,@RequestParam(defaultValue = "") List<String> answerList, HttpServletRequest request
			
			//考試確認 收藏題目
			,@RequestParam(defaultValue = "") List<Integer> reserveQuIdx) {
		
		
		MemberBean user = (MemberBean)m.getAttribute("user");
		List<ExamBean> theExamTable= new ArrayList<ExamBean>();
		List<ExamQuesBean> theExamQuTable= new ArrayList<ExamQuesBean>();
		
		//處理分派頁面相關參數
		String nextPage="";
		String pageStatus = (String)request.getSession().getAttribute("pageStatus");
		
		//若nextPage中間沒設到值，則會給予預設頁面
		nextPage = nextPageFunction(pageStatus);
		
		if (todo.equals("upload")) {

			nextPage = "ExamInsert";
			
		}else if (todo.equals("update")) {
			
			Map<String, String> memAttribute = new HashMap<String, String>();
			m.addAttribute("memAttribute", memAttribute);
			
			String examPicName = examPic.replace("images/", "");
			
			memAttribute.put("examID", examID);
			memAttribute.put("subject", subject);
			memAttribute.put("education", education);
			memAttribute.put("examName", examName);
			memAttribute.put("examDate", examDate);	
			memAttribute.put("examPic", examPicName);	
			
			nextPage = "ExamUpdate";
			
		}else if(todo.equals("delete")) {
			
			examService.delete(examID);
			
			nextPage = "Exam";
			
		}else if (todo.equals("query")) {
			
			System.out.println(quSubject+quEducation);
			theExamTable = examService.select(quSubject,quEducation);
			m.addAttribute("examTable", theExamTable);
			
			nextPage = nextPageFunction(pageStatus);
			
		}else if (todo.equals("queryAll")) {
			
			theExamTable = examService.selectAll();
			System.err.println(theExamQuTable);
			m.addAttribute("examTable", theExamTable);
			
			nextPage = nextPageFunction(pageStatus);
			
		}else if (todo.equals("test")) {
			
			
//			theExamQuTable = examService.selectQu(subject,education,examID);
//			m.addAttribute("examQuTable", theExamQuTable);
			Map<String, Object> testMap = examTestService.EstaTest(examID);
			m.addAttribute("testMap",testMap);
			
			
			nextPage = "ExamPaper";
			
		}else if(todo.equals("testSubmit")) {
		
			
			Map<String, Object> testMap = (Map<String, Object>) m.getAttribute("testMap");
			List<ExamQuesBean> examQuList = (List<ExamQuesBean>)testMap.get("examQueList");
			List<String> chooseList = new ArrayList<String>();
		
			
			////接值: 題目map、chooseAns值
			//chooseAns		
			for (int i = 0; i < examQuList.size(); i++) {
//				chooseList.add(request.getParameter("answer"+i));
				examQuList.get(i).setChooseAns(request.getParameter("answer"+i));
//				System.err.println("controller選擇為"+request.getParameter("answer"+i));
//				System.err.println("controller答案為"+examQuList.get(i).getQuesAnswer());
			}
//			testMap.put("chooseList", chooseList);
			
			
			
			//紀錄會員考試資訊
			examTestService.EstaRecord(testMap, user.getuserId());

			
			nextPage = "ExamShowScore";
			
			
		}else if(todo.equals("testConfirm")) {
			
			//保存題目
			Map<String, Object> testMap = (Map<String, Object>) m.getAttribute("testMap");
//			List<ExamQuesBean> reserveList = (List<ExamQuesBean>)testMap.get("examWrongList");
			
			examTestService.reserveQu(testMap, reserveQuIdx,user.getuserId());
			System.err.println("保存Idx"+reserveQuIdx);
			
			nextPage = nextPageFunction(pageStatus);
		}

		
		return nextPage;
	}
	
	
	@PostMapping("/InsUpController")
	public String processAction2(@RequestParam("todo") String todo,Model m
			
			//Insert參數
			,@RequestParam(defaultValue = "") String subject,@RequestParam(defaultValue = "") String education
			,@RequestParam(defaultValue = "") String examName,@RequestParam(defaultValue = "") String examDate
			,@RequestParam(defaultValue = "") String examID,@RequestParam("myfile") MultipartFile myfile
			,@RequestParam(defaultValue = "") String difficulty
//			,ExamBean examBean,@RequestParam("myfile") MultipartFile myfile
			
			
			,HttpServletRequest request) throws IllegalStateException, IOException {
		
		
		List<ExamBean> theExamTable= new ArrayList<ExamBean>();
		
		//抓取會員ID
		MemberBean user = (MemberBean)m.getAttribute("user");
		
		//處理分派頁面的相關參數
		String nextPage="";
		String pageStatus = (String)request.getSession().getAttribute("pageStatus");
		
		//處理儲存路徑
		String saveFileSubPath = "static/images";
		String saveFileDir = request.getSession().getServletContext().getRealPath(saveFileSubPath).replaceFirst("webapp", "resources");
		String fileName = myfile.getOriginalFilename();
		
		//資料庫中的儲存路徑，給jsp直接呼叫用的
		String fileLocalPath = "images/"+fileName;
		File saveFilePath = new File(saveFileDir, fileName);
		myfile.transferTo(saveFilePath);
		
		if (todo.equals("insert")) {
			
//			if (!ExamUtil.datacheck(examDate)){
//				
//				String warn = "資料錯誤";
//				m.addAttribute("warn", warn);
//				nextPage = "ExamInsert";
//				
//			}else {
				
//				this.getClass().getClassLoader().

//				examService.insert(subject, education, examName, examDate, fileLocalPath,user.getuserId(),difficulty);
				
				
				nextPage = nextPageFunction(pageStatus);
				
//			}		
			
			
		}else if (todo.equals("update")) {
			
			System.err.println("InsUpController內examID="+examID);
			
//			if (!ExamUtil.datacheck(examDate)){
//				
//				String warn = "資料錯誤";
//				m.addAttribute("warn", warn);
//				nextPage = "ExamUpdate";
//				
//			}else {
				
				System.err.println(examID+subject+education+examName+examDate);
//				examService.update(examID, subject, education, examName, examDate,fileLocalPath);
				
				nextPage = nextPageFunction(pageStatus);
				
//			}	
			
		}
		
		return nextPage;
	}
	
	private String nextPageFunction(String pageStatus) {
		
		if (pageStatus.equals("3")) {
			
			pageStatus = "Exam";
			
		} else {
			
			pageStatus = "ExamMember";
			
		}
		
		return pageStatus;
	}
	
}

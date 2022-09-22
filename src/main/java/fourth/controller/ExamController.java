package fourth.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import fourth.bean.ExamBean;
import fourth.bean.ExamQuesBean;
import fourth.bean.MemberBean;
import fourth.dao.ExamDaoInterface;
import fourth.service.ExamService;
import fourth.util.ExamUtil;


//	/ExamMainView
@Controller
@SessionAttributes(names = {"examQuTable","user"})
public class ExamController {
	
	@Autowired
	private ExamService examService;
	
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
	public String processAction(@RequestParam("todo") String todo, Model m, Model examQuTable
			
			//考試相關
			,@RequestParam(defaultValue = "") String quSubject,@RequestParam(defaultValue = "") String quEducation
			
			//考卷相關
			,@RequestParam(defaultValue = "") String subject,@RequestParam(defaultValue = "") String education
			,@RequestParam(defaultValue = "") String examName,@RequestParam(defaultValue = "") String examDate
			,@RequestParam(defaultValue = "") String examID,@RequestParam(defaultValue = "") String examPic
			
			//考試答題答案
			,@RequestParam(defaultValue = "") List<String> answerList, HttpServletRequest request) {
		
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
			m.addAttribute("examTable", theExamTable);
			
			nextPage = nextPageFunction(pageStatus);
			
		}else if (todo.equals("test")) {
			
			
			theExamQuTable = examService.selectQu(subject,education,examID);
			m.addAttribute("examQuTable", theExamQuTable);
			
			nextPage = "ExamPaper";
			
		}else if(todo.equals("testSubmit")) {
		
			System.err.println(examQuTable);
			List<ExamQuesBean> examQuesList=(List<ExamQuesBean>) m.getAttribute("examQuTable");
			List<ExamQuesBean> examWrongList= new ArrayList<ExamQuesBean>();
			for(int i=0; i < examQuesList.size();i++) {
				System.err.println("答案為"+examQuesList.get(i).getQuesAnswer());
			}

			int ctCount =0;
//			//故意多宣告一個陣列長度，讓答案陣列的i與答案參數的i互相相等，後面getParameter比較方便
			String[] chooseAns = new String[8];
			
			//讀取答案
			for(int i=1;i<= examQuesList.size();i++) {
				chooseAns[i] = request.getParameter("answer"+i);
				System.err.println("第"+i+"題做答"+chooseAns[i]);
				if (chooseAns[i].equals(examQuesList.get(i-1).getQuesAnswer()) ) {
					
					ctCount++;
					
				}else {
					
					//把錯誤題目加入List
					examWrongList.add(examQuesList.get(i-1));
					
					System.err.println("答錯第"+i+"題"+examQuesList.get(i-1).getQuesContent());
					System.err.println("examId"+user.getuserId());
				}
			}	
			
			
			m.addAttribute("examWrongTable", examWrongList);
			
			System.out.println("答對"+ctCount+"題");
			m.addAttribute("examResult", ctCount);
			
			nextPage = "ExamShowScore";	
		}

		
		return nextPage;
	}
	
	
	@PostMapping("/InsUpController")
	public String processAction2(@RequestParam("todo") String todo,Model m
			,@RequestParam(defaultValue = "") String subject,@RequestParam(defaultValue = "") String education
			,@RequestParam(defaultValue = "") String examName,@RequestParam(defaultValue = "") String examDate
			,@RequestParam(defaultValue = "") String examID,@RequestParam("myfile") MultipartFile myfile
			,HttpServletRequest request) throws IllegalStateException, IOException {
		
		
		List<ExamBean> theExamTable= new ArrayList<ExamBean>();
		
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
			
			if (!ExamUtil.datacheck(examDate)){
				
				String warn = "資料錯誤";
				m.addAttribute("warn", warn);
				nextPage = "ExamInsert";
				
			}else {
				
//				this.getClass().getClassLoader().
				examService.insert(subject, education, examName, examDate, fileLocalPath);
				
				nextPage = nextPageFunction(pageStatus);
				
			}		
			
			
		}else if (todo.equals("update")) {
			
			System.err.println("InsUpController內examID="+examID);
			
			if (!ExamUtil.datacheck(examDate)){
				
				String warn = "資料錯誤";
				m.addAttribute("warn", warn);
				nextPage = "ExamUpdate";
				
			}else {
				
				System.err.println(examID+subject+education+examName+examDate);
				examService.update(examID, subject, education, examName, examDate,fileLocalPath);
				
				nextPage = nextPageFunction(pageStatus);
				
			}	
			
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

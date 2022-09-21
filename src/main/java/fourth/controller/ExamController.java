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
	public String entrance(Model m) {
		MemberBean user = (MemberBean)m.getAttribute("user");
		String nextPage = "";
		if (user.getStatus()==3) {
			
			nextPage="Exam";
			
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
		
		String nextPage="Exam";
		String pageStatus = (String) m.getAttribute("pageStatus");
		nextPage = pageStatus=="3" ? "Exam" : "ExamMember";
		
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
			
			nextPage = pageStatus=="3" ? "Exam" : "ExamMember";
			
		}else if (todo.equals("queryAll")) {
			
			theExamTable = examService.selectAll();
			m.addAttribute("examTable", theExamTable);
			
			nextPage = pageStatus=="3" ? "Exam" : "ExamMember";
			
		}else if (todo.equals("test")) {
			
			theExamQuTable = examService.selectQu(subject,education);
			m.addAttribute("examQuTable", theExamQuTable);
			nextPage = "ExamPaper";
			
		}else if(todo.equals("testSubmit")) {
		
			System.err.println(examQuTable);
			List<ExamQuesBean> m12=(List<ExamQuesBean>) m.getAttribute("examQuTable");
			
			for(int i=0; i < m12.size();i++) {
				System.err.println("答案為"+m12.get(i).getQuesAnswer());
			}

			int ctCount =0;
//			//故意多宣告一個陣列長度，讓答案陣列的i與答案參數的i互相相等，後面getParameter比較方便
			String[] guAnswer = new String[8];
			
			//讀取答案
			for(int i=1;i<= m12.size();i++) {
				guAnswer[i] = request.getParameter("answer"+i);
				System.err.println(i+"答案"+guAnswer[i]);
				if (guAnswer[i].equals(m12.get(i-1).getQuesAnswer()) ) {
					ctCount++;
				}
			}	
			
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
		
		String nextPage="";
		List<ExamBean> theExamTable= new ArrayList<ExamBean>();
		String pageStatus = (String) m.getAttribute("pageStatus");
		
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
				
				nextPage = pageStatus=="3" ? "Exam" : "ExamMember";
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
				
				nextPage = pageStatus=="3" ? "Exam" : "ExamMember";
				
			}	
			
		}
		
		return nextPage;
	}
	
}

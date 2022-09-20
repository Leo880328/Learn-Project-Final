package fourth.controller;

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
		user.getStatus();
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
			,@RequestParam(defaultValue = "") String quSubject,@RequestParam(defaultValue = "") String quEducation
			,@RequestParam(defaultValue = "") String subject,@RequestParam(defaultValue = "") String education
			,@RequestParam(defaultValue = "") String examName,@RequestParam(defaultValue = "") String examDate
			,@RequestParam(defaultValue = "") String examID,@RequestParam(defaultValue = "") List<String> answerList, HttpServletRequest request) {
		
		String nextPage="Exam";
		List<ExamBean> theExamTable= new ArrayList<ExamBean>();
		List<ExamQuesBean> theExamQuTable= new ArrayList<ExamQuesBean>();
		
		if (todo.equals("upload")) {

			nextPage = "ExamInsert";
			
		}else if (todo.equals("update")) {
			
			Map<String, String> memAttribute = new HashMap<String, String>();
			m.addAttribute("memAttribute", memAttribute);
			
			memAttribute.put("examID", examID);
			memAttribute.put("subject", subject);
			memAttribute.put("education", education);
			memAttribute.put("examName", examName);
			memAttribute.put("examDate", examDate);	
			
			nextPage = "ExamUpdate";
			
		}else if(todo.equals("delete")) {
			
//			System.out.println("examID"+examID);
			
			examService.delete(examID);
			
			nextPage = "Exam";
			
			
		}else if (todo.equals("query")) {
			
			System.out.println(quSubject+quEducation);
			
			theExamTable = examService.select(quSubject,quEducation);
			
			m.addAttribute("examTable", theExamTable);
			
			nextPage = "Exam";
			
		}else if (todo.equals("queryAll")) {
			
			theExamTable = examService.selectAll();
			
			m.addAttribute("examTable", theExamTable);
			
			nextPage = "Exam";
			
		}else if (todo.equals("test")) {
			
			
			
			theExamQuTable = examService.selectQu(subject,education);
			
//			System.err.println(theExamQuTable);
			
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
			
			System.out.println(nextPage);
		}

		
		return nextPage;
	}
	
	
	@PostMapping("/InsUpController")
	public String processAction2(@RequestParam("todo") String todo,Model m
			,@RequestParam(defaultValue = "") String subject,@RequestParam(defaultValue = "") String education
			,@RequestParam(defaultValue = "") String examName,@RequestParam(defaultValue = "") String examDate
			,@RequestParam(defaultValue = "") String examID) {
		
		String nextPage="";
		List<ExamBean> theExamTable= new ArrayList<ExamBean>();
		
		if (todo.equals("insert")) {
			
			if (!ExamUtil.datacheck(examDate)){
				
				String warn = "資料錯誤";
				
				m.addAttribute("warn", warn);
				
				nextPage = "ExamInsert";
				
			}else {
				
				examService.insert(subject, education, examName, examDate);
				System.err.println("回到controller");
				nextPage = "Exam";
			}		
			
			
		}else if (todo.equals("update")) {
			
			System.err.println("InsUpController內examID="+examID);
			
			if (!ExamUtil.datacheck(examDate)){
				
				String warn = "資料錯誤";
				m.addAttribute("warn", warn);
				
				nextPage = "ExamUpdate";
				
			}else {
				
				System.err.println(examID+subject+education+examName+examDate);
				
				examService.update(examID, subject, education, examName, examDate);
				
//				theExamTable = examService.selectAll();
				
//				m.addAttribute("examTable", theExamTable);
				
				nextPage = "Exam";
			}	
				
			
		}

		
		return nextPage;
	}
	
}

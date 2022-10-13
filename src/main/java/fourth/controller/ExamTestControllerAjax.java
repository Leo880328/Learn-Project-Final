package fourth.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import fourth.bean.ExamQuesBean;
import fourth.bean.MemberBean;
import fourth.service.ExamTestService;
import net.bytebuddy.asm.Advice.Return;


@Controller
@SessionAttributes(names = {"testMap","user","reTestMap"})
public class ExamTestControllerAjax {
	
	@Autowired
	private ExamTestService examTestService;
	
	
	@PostMapping(path = "/ExamEstaTest")
	public String processEstaTestAction(
		Model m	,@RequestParam(defaultValue = "") String examId	) {
		
		Map<String, Object> testMap = examTestService.EstaTest(examId);
		m.addAttribute("testMap",testMap);
		
		return "ExamPaper";
	}
	
	@PostMapping(path = "/ExamTestSubmit")
	public String processTestSubmitAction(
		Model m	,@RequestParam(defaultValue = "") String examId
		,HttpServletRequest request ) {
		
		MemberBean user = (MemberBean)m.getAttribute("user");
		Map<String, Object> testMap = (Map<String, Object>) m.getAttribute("testMap");
		List<ExamQuesBean> examQuList = (List<ExamQuesBean>)testMap.get("examQueList");
		
		////接值: 題目map、chooseAns值
		//chooseAns		
		for (int i = 0; i < examQuList.size(); i++) {
			examQuList.get(i).setChooseAns(request.getParameter("answer"+i));
		}
		
		examTestService.EstaRecord(testMap, user.getuserId());
		return "ExamShowScore";
	}
	
	@PostMapping(path="/ExamTestPreserve")
	public String processTestPreserveAction(Model m,HttpServletRequest request
	,@RequestParam(defaultValue = "") String examId,@RequestParam(defaultValue = "") List<Integer> reserveQuIdx) {
		
		
		MemberBean user = (MemberBean)m.getAttribute("user");
		//保存題目
		Map<String, Object> testMap = (Map<String, Object>) m.getAttribute("testMap");
		
		examTestService.reserveQu(testMap, reserveQuIdx,user.getuserId());
		System.err.println("保存Idx"+reserveQuIdx);
		
		
		String pageStatus = (String)request.getSession().getAttribute("pageStatus");
		String nextPage="ExamFront";
		
		if (pageStatus.equals("3") ) {nextPage="Exam";};
		
		return nextPage;
	}
	
	@PostMapping(path="/ExamTestStatistic")
	@ResponseBody
	public int[] processTestStatisticAction(Model m,HttpServletRequest request) {
		
		MemberBean user = (MemberBean)m.getAttribute("user");
		//保存題目
		
		return examTestService.getUserStatistic(user.getuserId());
	}
	
	
	
	@PostMapping(path="/ReExam")
	public String processreExamAction(Model m,@RequestParam(defaultValue = "") String examRecordId) {
		
		Map<String, Object> reTestMap = (Map<String, Object>) m.getAttribute("testMap");
		
		System.err.println("~~~~~~~~~~~~~~~~~~"+examRecordId);
		
		reTestMap = examTestService.reTest(examRecordId);
		
		m.addAttribute("reTestMap",reTestMap);
		
		return "ExamPaperReTest";
	}
	
	@PostMapping(path="/ExamReTestSubmit")
	public String processreExamReTestSubmitAction(Model m,@RequestParam(defaultValue = "") String examRecordId,HttpServletRequest request) {
		
//		Map<String, Object> reTestMap = (Map<String, Object>) m.getAttribute("reTestMap");
//		List<ExamQuesBean> examQuList = (List<ExamQuesBean>)reTestMap.get("examQueList");
//		
//		////接值: 題目map、chooseAns值
//		//chooseAns		
//		for (int i = 0; i < examQuList.size(); i++) {
//			examQuList.get(i).setChooseAns(request.getParameter("answer"+i));
//		}
//		
//		examTestService.reTestShowScore(reTestMap);
		
		return "ExamMyMem";
	}
	
}

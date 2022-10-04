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
@SessionAttributes(names = {"testMap","user"})
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
		
		
		
		return "Exam";
	}
	
}

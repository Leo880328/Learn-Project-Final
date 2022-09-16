package fourth.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import fourth.bean.MemberBean;
import fourth.service.MemberService;

@Controller
@SessionAttributes(names = {"user"})
public class CenterController {
	
	
	
	
	
	@GetMapping("/backendIndex")
	public String showBackendIndex(HttpServletRequest request,Model m) {
		request.getSession().setAttribute("pageStatus","3");
		System.out.println("後台");
		return "BackendIndex";
	}
	
	
	@GetMapping("/Index")
	public String Index(HttpServletRequest request,Model m) {
		request.getSession().setAttribute("pageStatus","1");
		System.out.println("前台");
		return "Index";
	}
	
	
}

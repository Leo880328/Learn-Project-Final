package fourth.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import fourth.bean.CourseBean;
import fourth.service.CourseService;

@Controller
public class CourseFrontController {
	
	
	@Autowired
	private CourseService cService;
	
	@GetMapping("/coursefront1.list")
	public String listCourse1(Model m) {
		List<CourseBean> list = cService.selectAll();
		m.addAttribute("list", list);
		return "CourseFrontList1";

	}
	
	@GetMapping("/coursefront2.list")
	public String listCourse2(Model m) {
		List<CourseBean> list = cService.selectAll();
		m.addAttribute("list", list);
		return "CourseFrontList2";

	}
	
	@GetMapping("/coursefront.details")
	public String showFrontDetails(int course_id,Model m) {
		CourseBean cbean = cService.findByCourseId(course_id);
		m.addAttribute("cbean", cbean); 
		return "Details";
	}

}

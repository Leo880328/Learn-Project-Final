package fourth.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		List<CourseBean> list1 = cService.findByLecturerName("%" + "敬評" + "%");
		m.addAttribute("queryResult5", list1);
		return "CourseFrontList2";

	}

	@PostMapping("/coursefront.insert")
	public String insertCourse(CourseBean courseBean, Integer subject_id, Integer education_id) {
		courseBean.setCourse_picture("images/" + courseBean.getCourse_picture());
		cService.insert(courseBean, subject_id, education_id);
		return "redirect:/coursefront2.list";

	}

	@GetMapping("/coursefront.details")
	public String showFrontDetails(int course_id, Model m) {
		CourseBean cbean = cService.findByCourseId(course_id);
		m.addAttribute("cbean", cbean);
		List<CourseBean> list = cService.selectAll();
		m.addAttribute("list", list);
		return "Details";
	}

	@PostMapping("/coursefront.qname")
	public String queryName(@RequestParam("keyword") String keyword, Model m) {
		HashMap<String, String> errorMsgMap = new HashMap<String, String>();
		m.addAttribute("errorMsgMap", errorMsgMap);
		List<CourseBean> list = cService.findByNameLike("%" + keyword + "%");
		if (keyword == "" || keyword.length() == 0) {
			return "redirect:/coursefront1.list";
		}
		if (list.isEmpty()) {
			errorMsgMap.put("QueryError", "<font color=red size=5>查無資料!!</font>");
		}
		if (errorMsgMap != null && !errorMsgMap.isEmpty()) {
			return listCourse1(m);
		}
		m.addAttribute("queryResult", list);
		return "CourseFrontList1";

	}

	@PostMapping("/coursefront.tqname")
	public String queryNameTeacher(@RequestParam("keyword") String keyword, Model m) {
		HashMap<String, String> errorMsgMap = new HashMap<String, String>();
		m.addAttribute("errorMsgMap", errorMsgMap);
		List<CourseBean> list = cService.findByNameLike("%" + keyword + "%");
		if (keyword == "" || keyword.length() == 0) {
			return "redirect:/coursefront2.list";
		}
		if (list.isEmpty()) {
			errorMsgMap.put("QueryError", "<font color=red size=5>查無資料!!</font>");
		}
		if (errorMsgMap != null && !errorMsgMap.isEmpty()) {
			return listCourse2(m);
		}
		m.addAttribute("queryResult", list);
		return "CourseFrontList2";

	}

	@GetMapping("/coursefront.qenglish")
	public String queryByEnglish(String subject_name, Model m) {
		List<CourseBean> list = cService.findBySubIdLike("%" + "2" + "%");
		m.addAttribute("queryResult1", list);
		return "CourseFrontSub";
	}

	@GetMapping("/coursefront.qmath")
	public String queryByMath(String subject_name, Model m) {
		List<CourseBean> list = cService.findBySubIdLike("%" + "1" + "%");
		m.addAttribute("queryResult2", list);
		return "CourseFrontSub";
	}

	@GetMapping("/coursefront.qtoeic")
	public String queryByToeic(String subject_name, Model m) {
		List<CourseBean> list = cService.findBySubIdLike("%" + "3" + "%");
		m.addAttribute("queryResult3", list);
		return "CourseFrontSub";
	}

	@GetMapping("/coursefront.qjunior")
	public String queryByJunior(String educationlevel, Model m) {
		List<CourseBean> list = cService.findByEduIdLike("%" + "1" + "%");
		m.addAttribute("queryResult4", list);
		return "CourseFrontSub";
	}

	@GetMapping("/coursefront.qsenior")
	public String queryBySenior(String educationlevel, Model m) {
		List<CourseBean> list = cService.findByEduIdLike("%" + "2" + "%");
		m.addAttribute("queryResult5", list);
		return "CourseFrontSub";
	}

	@GetMapping("/coursefront.qaldult")
	public String queryByAldult(String educationlevel, Model m) {
		List<CourseBean> list = cService.findByEduIdLike("%" + "3" + "%");
		m.addAttribute("queryResult4", list);
		return "CourseFrontSub";
	}

	@GetMapping("/coursefront.show")
	public String updateDetails(int course_id, Model m) {
		CourseBean bean = cService.findByCourseId(course_id);
		m.addAttribute("bean", bean);
		return "UpdateFront";
	}

	@PostMapping("/coursefront.update")
	public String updateCourse(CourseBean courseBean, Integer subject_id, Integer education_id) {
		cService.updateOne(courseBean, subject_id, education_id);
		System.out.println(courseBean.getCourse_id());
		return "redirect:/coursefront2.list";
	}
	
	@GetMapping("/coursefront.delete")
	public String delete(int course_id) {
		cService.deleteOne(course_id);
		return "redirect:/coursefront2.list";
	}
}

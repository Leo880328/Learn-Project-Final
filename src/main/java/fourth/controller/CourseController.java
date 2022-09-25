package fourth.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import fourth.bean.CourseBean;
import fourth.coursemail.JavaMail;
import fourth.service.CourseService;

@Controller
public class CourseController {

	@Autowired
	private CourseService cService;

	@GetMapping("/course.list")
	public String listCourse(Model m) {
		List<CourseBean> list = cService.selectAll();
		m.addAttribute("list", list);
		return "List";

	}

	@GetMapping("/course.add")
	public String addForm() {
		return "CourseForm";
	}

	@PostMapping("/course.insert")
	public String insertCourse(CourseBean courseBean, Integer subject_id, Integer education_id) {
		courseBean.setCourse_picture("images/" + courseBean.getCourse_picture());
		cService.insert(courseBean, subject_id, education_id);
		return "redirect:/course.list";

	}

	@GetMapping("/course.details")
	public String showDetails(int course_id, Model m) {
		CourseBean cbean = cService.findByCourseId(course_id);
		m.addAttribute("cbean", cbean);
		return "Details";
	}

	@GetMapping("/course.show")
	public String updateDetails(int course_id, Model m) {
		CourseBean bean = cService.findByCourseId(course_id);
		m.addAttribute("bean", bean);
		return "Update";
	}

	@PostMapping("/course.update")
	public String updateCourse(@RequestParam("course_status") Integer course_status, CourseBean courseBean, Integer subject_id, Integer education_id, int course_id)
			throws SQLException {
		CourseBean bean = cService.findByCourseId(course_id);
		
		if(course_status == bean.getCourse_status()) {
			cService.updateOne(courseBean, subject_id, education_id);
			return "redirect:/course.list";
		}
		if(course_status == 2) {
			cService.updateOne(courseBean, subject_id, education_id);
			String txt = "<h2>" + "偉大的 " + courseBean.getLecturer_name() + " 您好 :" + "<br>" + "課程編號: "
					+ courseBean.getCourse_id() + "<br>" + "課程名稱: " + courseBean.getCourse_name() + "<br>" + "購買人信箱: "
					+ courseBean.getLecturer_email() + "<br>" + "課程價格:" + courseBean.getCourse_price() + "<br>" + "<br>"
					+ "審核結果: 通過!!" + "<h2>";
			JavaMail javaMail = new JavaMail();
			javaMail.setCustomer("fock360man@gmail.com");
			javaMail.setSubject("好學生-EEIT49 課程審核通過!");
			javaMail.setTxt(txt);
			javaMail.sendMail();
			return "redirect:/course.list";
		}else if(course_status == 3) {
			cService.updateOne(courseBean, subject_id, education_id);
			String txt = "<h2>" + "偉大的 " + courseBean.getLecturer_name() + " 您好 :" + "<br>" + "課程編號: "
					+ courseBean.getCourse_id() + "<br>" + "課程名稱: " + courseBean.getCourse_name() + "<br>" + "購買人信箱: "
					+ courseBean.getLecturer_email() + "<br>" + "課程價格:" + courseBean.getCourse_price() + "<br>" + "<br>"
					+ "審核結果: 駁回!!" + "<br>" + "駁回原因: 課程名稱或圖片帶有敏感資訊" + "<h2>";
			JavaMail javaMail = new JavaMail();
			javaMail.setCustomer("fock360man@gmail.com");
			javaMail.setSubject("好學生-EEIT49 課程駁回通知");
			javaMail.setTxt(txt);
			javaMail.sendMail();
			return "redirect:/course.list";
		}
		
		return "redirect:/course.list";
	}

	@GetMapping(value = "coursemail.success")
	public String JavaMailSuccess(CourseBean courseBean, Integer subject_id, Integer education_id, int course_id) {
		
		CourseBean bean = cService.findByCourseId(course_id);
		cService.updateOne(courseBean, subject_id, education_id);
		String txt = "<h2>" + "偉大的 " + courseBean.getLecturer_name() + " 您好 :" + "<br>" + "課程編號: "
				+ courseBean.getCourse_id() + "<br>" + "課程名稱: " + courseBean.getCourse_name() + "<br>" + "購買人信箱: "
				+ courseBean.getLecturer_email() + "<br>" + "課程價格:" + courseBean.getCourse_price() + "<br>" + "<br>"
				+ "審核結果: 通過!!" + "<h2>";
		JavaMail javaMail = new JavaMail();
		javaMail.setCustomer("fock360man@gmail.com");
		javaMail.setSubject("好學生-EEIT49 課程審核通過!");
		javaMail.setTxt(txt);
		javaMail.sendMail();
		return "redirect:/course.list";
	}
	
	@GetMapping(value = "coursemail.failed")
	public String JavaMailFailed(int course_id) {
		CourseBean courseBean = cService.findByCourseId(course_id);
		String txt = "<h2>" + "偉大的 " + courseBean.getLecturer_name() + " 您好 :" + "<br>" + "課程編號: "
				+ courseBean.getCourse_id() + "<br>" + "課程名稱: " + courseBean.getCourse_name() + "<br>" + "購買人信箱: "
				+ courseBean.getLecturer_email() + "<br>" + "課程價格:" + courseBean.getCourse_price() + "<br>" + "<br>"
				+ "審核結果: 駁回!!" + "<br>" + "駁回原因: 課程名稱或圖片帶有敏感資訊" + "<h2>";
		JavaMail javaMail = new JavaMail();
		javaMail.setCustomer("fock360man@gmail.com");
		javaMail.setSubject("好學生-EEIT49 課程駁回通知");
		javaMail.setTxt(txt);
		javaMail.sendMail();
		return "redirect:/course.list";
	}

	@PostMapping("/course.qid")
	public String queryId(@RequestParam("keyword") String keyword, Model m) {
		HashMap<String, String> errorMsgMap = new HashMap<String, String>();
		m.addAttribute("errorMsgMap", errorMsgMap);
		if (keyword == "") {
			keyword = "0";
		}
		;
		CourseBean cb = cService.findByCourseId(Integer.parseInt(keyword));
		if (keyword == "0" || cb == null) {
			errorMsgMap.put("QueryError", "<font color=red size=5>查無資料!!</font>");
		}

		if (errorMsgMap != null && !errorMsgMap.isEmpty()) {
			return listCourse(m);
		}

		m.addAttribute("queryId", cb);
		return "QueryId";
	}

	@PostMapping("/course.qname")
	public String queryName(@RequestParam("keyword") String keyword, Model m) {
		HashMap<String, String> errorMsgMap = new HashMap<String, String>();
		m.addAttribute("errorMsgMap", errorMsgMap);
		List<CourseBean> list = cService.findByNameLike("%" + keyword + "%");
		if (keyword == "" || keyword.length() == 0) {
			return "redirect:/course.list";
		}
		if (list.isEmpty()) {
			errorMsgMap.put("QueryError", "<font color=red size=5>查無資料!!</font>");
		}

		if (errorMsgMap != null && !errorMsgMap.isEmpty()) {
			return listCourse(m);
		}

		m.addAttribute("queryResult", list);
		return "Query";

	}

	@GetMapping("/course.delete")
	public String delete(int course_id) {
		cService.deleteOne(course_id);
		return "redirect:/course.list";
	}

//	@GetMapping("/delete/{id}")    
//    public String delete(@PathVariable(value = "id") int course_id){    
//		cService.deleteOne(course_id);    
//        return "redirect:/courseList";    
//    }

}

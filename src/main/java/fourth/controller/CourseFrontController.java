package fourth.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import fourth.bean.CartItem;
import fourth.bean.CourseBean;
import fourth.bean.CourseCollect;
import fourth.bean.CourseComments;
import fourth.bean.MemberBean;
import fourth.service.CourseService;

@Controller
@SessionAttributes(names = {"user"})
public class CourseFrontController {

	@Autowired
	private CourseService cService;
	

	@GetMapping("/coursefront1.list")
	public String listCourse1(Model m) {
		List<CourseBean> list = cService.selectAll();
		m.addAttribute("list", list);
		List<CourseBean> top = cService.orderByEnrollment();
		m.addAttribute("top", top);
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
	public String showFrontDetails(int courseId, Model m) {
		CourseBean cbean = cService.findByCourseId(courseId);
		m.addAttribute("cbean", cbean);
		cbean.getcourseId();
		List<CourseBean> list = cService.selectAll();
		m.addAttribute("list", list);
		List<CourseComments> comments = cService.findCourseCommentsByCourseBean_CourseId(courseId);
		m.addAttribute("comments", comments);
		return "Details";
	}
	
	@PostMapping("/haveCollect")
	@ResponseBody
	public boolean haveCollect(@RequestBody Map<String, String> map,Model m) {
		MemberBean user = (MemberBean)m.getAttribute("user");
		Integer courseId = Integer.valueOf(map.get("courseId")) ;
		return cService.haveCollect(user.getuserId(), courseId);
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
	public String updateDetails(int courseId, Model m) {
		CourseBean bean = cService.findByCourseId(courseId);
		m.addAttribute("bean", bean);
		return "UpdateFront";
	}

	@PostMapping("/coursefront.update")
	public String updateCourse(CourseBean courseBean, Integer subject_id, Integer education_id) {
		cService.updateOne(courseBean, subject_id, education_id);
		System.out.println(courseBean.getcourseId());
		return "redirect:/coursefront2.list";
	}
	
	@GetMapping("/coursefront.delete")
	public String delete(int courseId) {
		cService.deleteOne(courseId);
		return "redirect:/coursefront2.list";
	}
	
	
	@ResponseBody
	@PostMapping(path = "/coursefront.cadd/{id}")
	public String addCollect(Model m,@PathVariable("id") String courseID) throws SQLException {
		MemberBean user = (MemberBean)m.getAttribute("user");
		CourseBean bean = cService.findByCourseId(Integer.parseInt(courseID));
		String courseName = bean.getCourse_name();
		cService.collectAdd(courseID, user.getuserId(), courseName);
		return "add Ok";

	}
	
	@GetMapping(path = "/coursefront.collectAll")
	public String collectList(Model m) {
		MemberBean user = (MemberBean)m.getAttribute("user");
		List<CourseCollect> collectList = cService.collectList(user.getuserId());
		m.addAttribute("cList", collectList);
		return "CourseCollect";
	}
	
	@ResponseBody
	@DeleteMapping(path = "/coursefront.cdelete/{id}")
	public String deleteCollect(@PathVariable("id") Integer courseId, Model m) {
		MemberBean user = (MemberBean)m.getAttribute("user");
		cService.deleteByUserIdAndCourseId(user.getuserId(), courseId);
		return "deleteOK";
	}
	
	@ResponseBody
	@DeleteMapping(path = "/coursefront.ciddelete/{id}")
	public String deleteCollectById(@PathVariable("id") String collectId) {
		cService.collectDelete(collectId);
		return "deleteOK";
	}
	
	@PostMapping(path = "/coursecomments.add")
	public String addComments(Model m,Integer courseId,@RequestParam("comments") String comments) throws SQLException {
		MemberBean user = (MemberBean)m.getAttribute("user");
//		CourseBean bean = cService.findByCourseId(courseID);
		cService.commentsAdd(user.getuserId(), courseId, comments);
		return showFrontDetails(courseId,m);
	}
	
	@ResponseBody
	@DeleteMapping("/coursecomments.del/{id}")
	public String delComments(@PathVariable("id")int commentsId) {
		cService.deleteComments(commentsId);
		return "deleteOK";
	}
	
	
}

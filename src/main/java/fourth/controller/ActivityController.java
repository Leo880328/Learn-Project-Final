package fourth.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import fourth.bean.ActivityBean;
import fourth.service.ActivityService;

@Controller
public class ActivityController {

	@Autowired
	private ActivityService activityService;

	// Activity get
	@GetMapping("/Activity")
	public String uerSelect() {
		return "Activity_User";
	}

	// Activity_OP_test get
	@GetMapping("/Activity_OP")
	public String test(Model m) {
		return "Activity_OP";
	}

// /Activity_OP/insert post
	@PostMapping("/Activity_OP_insert")
	public String insertActivities() {
		return "ActivityInster";
	}
	
	@PostMapping("/Activity_OP_Update/{id}")
	public String updateActivities() {
		return "ActivityUpdate";
	}
//	======================================================================================================================================================
//	====================================================API區=============================================================================================
//	======================================================================================================================================================
	// 查詢所有API
	@GetMapping("/Activity.getAll")
	@ResponseBody
	public List<ActivityBean> selectAll() {
		List<ActivityBean> selectActivityBeans = activityService.selectAllActivity();
		return selectActivityBeans;
	}
	//新增
	@PostMapping("/Activity_OP")
	@ResponseBody
	public ActivityBean insertActivities(@RequestAttribute ActivityBean activityBean, Model m) {
		return activityService.insertActivities(activityBean);
	}

	// 修改
	@PutMapping("/Activity_OP")
	@ResponseBody
	public ActivityBean updateActivities(@ModelAttribute ActivityBean activityBean, Model m) {
		return activityService.updateActivities(activityBean);
	}
	
	//刪除
	@DeleteMapping("/Activity_OP")
	@ResponseBody
	public boolean deleteActivities(@ModelAttribute ActivityBean activityBean, Model m) {
		activityService.deleteActivities(activityBean);
		return true;
	}


	
}

package fourth.controller;


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
import org.springframework.web.bind.annotation.ResponseBody;

import fourth.bean.ActivityBean;
import fourth.bean.Base64FileBean;
import fourth.service.ActivityImageService;
import fourth.service.ActivityService;

@Controller
public class ActivityController {

	@Autowired
	private ActivityService activityService;

	@Autowired
	private ActivityImageService activityImageService;

	// Activity get
	@GetMapping("/Activity")
	public String uerSelect() {
		return "Activity_User";
	}

	// Activity_OP_test get
	@GetMapping("/Activity_OP")
	public String test() {
		return "Activity_OP";
	}

// /Activity_OP/insert post
	@PostMapping("/Activity_OP_insert")
	public String insertActivities() {
		return "ActivityInster";
	}

	@PostMapping("/Activity_OP_Update/{id}")
	public String updateActivities() {

		// 應插入權限判斷
		return "ActivityUpdate";
	}

//	======================================================================================================================================================
//	====================================================API區=============================================================================================
//	======================================================================================================================================================
	// 查詢所有API
	@GetMapping("/Activity.getAll")
	@ResponseBody
	public List<ActivityBean> selectActivityAll() {
		List<ActivityBean> selectActivityBeans = activityService.selectAllActivity();
		return selectActivityBeans;
	}
	@GetMapping("/Activity/{id}")
	@ResponseBody
	public ActivityBean selectActivity(@) {
		activityService.selectActivityById(null)
	}

	// 新增
//	@GetMapping("/Activity_OP_path")
	@PostMapping("/Activity_OP")
	@ResponseBody
	public ActivityBean insertActivities(@ModelAttribute ActivityBean activityBean,
			@ModelAttribute Base64FileBean base64Img, Model m) {

		ActivityBean insertActivities = activityService.insertActivities(activityBean);
		base64Img.setFileName(insertActivities.getId().toString());
		String imgPath = activityImageService.saveBase64Img(base64Img);
		if(imgPath != null) {
			insertActivities.setImgPath(imgPath);
			return activityService.updateActivities(insertActivities);
		}
		return insertActivities;
	}

	// 修改
	@PutMapping("/Activity_OP")
	@ResponseBody
	public ActivityBean updateActivities(@ModelAttribute ActivityBean activityBean,@ModelAttribute Base64FileBean base64Img, Model m) {
		base64Img.setFileName(activityBean.getId().toString());
		activityImageService.saveBase64Img(base64Img);
		return activityService.updateActivities(activityBean);
	}

	@DeleteMapping("/Activity_OP")
	@ResponseBody
	public boolean deleteActivities(@ModelAttribute ActivityBean activityBean, HttpServletRequest request, Model m) {
		if (activityBean.getImgPath() != null) {
		} else {
			activityService.deleteActivities(activityBean);
			activityImageService.deleteImg(activityBean.getImgPath());
			return true;
		}
		return false;
	}

}

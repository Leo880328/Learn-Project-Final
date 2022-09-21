package fourth.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import fourth.bean.ActivityBean;
import fourth.bean.ActivityJsonBean;
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
	public ActivityBean selectActivity(@PathVariable Integer id) {
		 return activityService.selectActivityById(id);	
	}

	// 新增
//	@GetMapping("/Activity_OP_path")
	@PostMapping("/Activity_OP")
	@ResponseBody
	public ActivityBean insertActivities(@RequestBody() ActivityJsonBean activityJsonBean) {
		activityJsonBean.setActivityBean(activityService.insertActivities(activityJsonBean.getActivityBean())) ;
		return updateActivities(activityJsonBean);
	}

	// 修改
	@PutMapping("/Activity_OP")
	@ResponseBody
	public ActivityBean updateActivities(@RequestBody() ActivityJsonBean activityJsonBean) {
		activityJsonBean.getBase64FileBean().setFileName(activityJsonBean.getActivityBean().getId().toString());
		String imgPath = activityImageService.saveBase64Img(activityJsonBean.getBase64FileBean());
		if(imgPath != null) {
			activityJsonBean.getActivityBean().setImgPath(imgPath);
		}
		return activityService.updateActivities(activityJsonBean.getActivityBean());
	}

	@DeleteMapping("/Activity_OP")
	@ResponseBody
	public void deleteActivities(@RequestBody ActivityBean activityBean) {
		activityService.deleteActivities(activityBean);
		if (activityBean.getImgPath() != null) {
			activityImageService.deleteImg(activityBean.getImgPath());
		} 
	}

}

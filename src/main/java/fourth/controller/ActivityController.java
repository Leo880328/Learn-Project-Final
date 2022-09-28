package fourth.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import fourth.bean.ActivityAttendeesBean;
import fourth.bean.ActivityBean;
import fourth.service.ActivityImageService;
import fourth.service.ActivityService;

@Controller
public class ActivityController {

	private final String MapKey_pageSize = "pageSize";
	private final String MapKey_pageNo = "pageNo";
	private final String MapKey_keyWord = "keyWord";
	
	
	
	
	@Autowired
	private ActivityService activityService;

	// Activity get
	@GetMapping("/Activities")
	public String ActivityPreviewUser() {
		return "ActivityPreviewUser";
	}

//	@GetMapping("Activitye-{id}")
//	public String ActivitySelectById() {
//		return "ActivitySelectByID";
//	}

	// Activity_OP_test get
	@GetMapping("/ActivitiesOP")
	public String ActivityPreviewOP() {
		return "ActivityPreviewOP";
	}

	// Activity_OP/insert post
	@PostMapping("/ActivityOPInsert")
	public String insertActivities() {
		return "ActivityUpdate";
	}

	@PostMapping("/ActivityOPUpdate-{id}")
	public String updateActivities() {
		// 應插入權限判斷
		return "ActivityUpdate";
	}

//	======================================================================================================================================================
//	====================================================API區=============================================================================================
//	======================================================================================================================================================
	// 查詢所有API

	@PostMapping("/ActivitySelect")
	@ResponseBody
	public Page<ActivityBean> selectActivityAllByTitleLike(@RequestBody() Map<String, String> map) {
		Integer pageNo = Integer.valueOf(map.get(MapKey_pageNo));
		Integer pageSize = Integer.valueOf(map.get(MapKey_pageSize));
		String keyWord = map.get(MapKey_keyWord);

		PageRequest pageable = PageRequest.of(pageNo - 1, pageSize);

		if (keyWord != null) {
			Page<ActivityBean> selectAllByTitleLike = activityService.selectAllByTitleLike(pageable, keyWord);
			return selectAllByTitleLike;
		}
		Page<ActivityBean> selectAllActivity = activityService.selectAllActivity(pageable);
		return selectAllActivity;

	}

	@GetMapping("/ActivitySelect-{id}")
	@ResponseBody
	public ActivityBean selectActivity(@PathVariable Integer id) {
		return activityService.selectActivityById(id);
	}

	//
	// ========================================活動創辦者========================================================================================

	// 新增
//	@GetMapping("/Activity_OP_path")
	@PostMapping("/Activity_OP")
	@ResponseBody
	public ActivityBean insertActivities(@RequestBody() ActivityBean activityBean) {
		ActivityBean insertActivities = activityService.insertActivities(activityBean);
		return insertActivities;
	}

	// 修改
	@PutMapping("/Activity_OP")
	@ResponseBody
	public ActivityBean updateActivities(@RequestBody() ActivityBean activityBean) {
		ActivityBean updateActivities = activityService.updateActivities(activityBean);
		return updateActivities;

	}

	// 送審
	@PutMapping("/Activity_OP")
	@ResponseBody
	public ActivityBean activitiesSubmitForReview(@RequestBody() ActivityBean activityBean) {
		ActivityBean updateActivities = activityService.updateActivities(activityBean);
		return updateActivities;

	}

	// 刪除
	@DeleteMapping("/Activity_OP")
	@ResponseBody
	public boolean deleteActivities(@RequestBody ActivityBean activityBean) {
		activityService.deleteActivities(activityBean);
		return true;
	}

	// 參加活動=失敗
	@PutMapping("/Activity_Participatefalse ")
	public ActivityAttendeesBean ActivityParticipateIsFalse(@RequestBody() ActivityAttendeesBean activityAttendeesBean) {
		activityAttendeesBean.setStatusCode(ActivityAttendeesBean.statusCode_False);
		
		return null;
	}

	// 參加活動=成功
	@PutMapping("/Activity_ParticipateTrue ")
	public ActivityAttendeesBean activityParticipateIsTrue(@RequestBody() ActivityAttendeesBean activityAttendeesBean) {
		activityAttendeesBean.setStatusCode(ActivityAttendeesBean.statusCode_True);
		
		return null;
	}

	// ========================================活動參加者========================================================================================

	// 參加活動
	@PutMapping("/Activity_Participate ")
	public ActivityBean participateActivity(@RequestBody() ActivityBean activityBean) {

		ActivityBean updateActivities = activityService.updateActivities(activityBean);
		return updateActivities;
	}

	// ========================================管理者========================================================================================

	// 審核成功
	@PutMapping("/Activity_ReviewSucceeded")
	@ResponseBody
	public ActivityBean activityReviewSucceeded(@RequestBody() ActivityBean activityBean) {
		ActivityBean updateActivities = activityService.updateActivities(activityBean);
		return updateActivities;
	}

	// 審核失敗
	@PutMapping("/Activity_AuditFailure")
	@ResponseBody
	public ActivityBean activityAuditFailure(@RequestBody() ActivityBean activityBean) {
		ActivityBean updateActivities = activityService.updateActivities(activityBean);
		return updateActivities;
	}

}

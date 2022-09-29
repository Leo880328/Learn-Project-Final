package fourth.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
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

import com.fasterxml.jackson.databind.ObjectMapper;

import fourth.bean.ActivityBean;
import fourth.bean.MemberBean;
import fourth.service.ActivityService;
import fourth.service.MemberService;

@Controller
public class ActivityController {

	private final String MapKey_pageSize = "pageSize";
	private final String MapKey_pageNo = "pageNo";
	private final String MapKey_keyWord = "keyWord";
	private final String MAPKEY_ACTIVITY_ID = "activityID";
	private final String MAPKEY_ACTIVITY_REVIEW_MESSAGE = "ActivityReviewBeanMessage";

	@GetMapping("ActivityeTest")
	@ResponseBody
	public String ActivitySelectTest() {
		Map<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put(MapKey_keyWord, hashMap);
		return "";
	}

	@Autowired
	private ActivityService activityService;

	@Autowired
	private MemberService memberService;

	// Activity get
	@GetMapping("/Activities")
	public String ActivityPreviewUser() {
		return "ActivityPreviewUser";
	}

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
	// 請給
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

	// 新增
	@PostMapping("/Activity_OP")
	@ResponseBody
	public ActivityBean insertActivities(@RequestBody() ActivityBean activityBean) {

		activityBean.setUserId(2);

		ActivityBean insertActivities = activityService.insertActivities(activityBean);
		return insertActivities;
	}

	// 修改
	@PutMapping("/Activity_OP")
	@ResponseBody
	public ActivityBean updateActivities(@RequestBody() ActivityBean activityBean) {
		activityBean.setUserId(2);

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

	// =====================================================================================================
	//請求審核
	@PostMapping("/Activity-Reviewing")
	@ResponseBody
	public boolean activityReviewing(@RequestBody Map<String, String> map) {
		String message = map.get(MAPKEY_ACTIVITY_REVIEW_MESSAGE);
		int activityById = Integer.valueOf(map.get(MAPKEY_ACTIVITY_ID));
		activityService.activityReviewing(activityById, message);
		return true;
	}
	//失敗
	@PostMapping("/Activity-ReviewFail")
	@ResponseBody
	public boolean activityReviewFail(@RequestBody Map<String, String> map) {
		String message = map.get(MAPKEY_ACTIVITY_REVIEW_MESSAGE);
		int activityById = Integer.valueOf(map.get(MAPKEY_ACTIVITY_ID));
		activityService.activityReviewFail(activityById, message);
		return true;
	}
//	審核成功
	@PostMapping("/Activity-RviewSuccessful")
	@ResponseBody
	public boolean activityRviewSuccessful(@RequestBody Map<String, String> map) {
		String message = map.get(MAPKEY_ACTIVITY_REVIEW_MESSAGE);
		int activityById = Integer.valueOf(map.get(MAPKEY_ACTIVITY_ID));
		activityService.activityRviewSuccessful(activityById, message);
		return true;
	}


	// ========================================審核========================================================================================

	
	
}

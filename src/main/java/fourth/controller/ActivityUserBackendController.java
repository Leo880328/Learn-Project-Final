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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import fourth.bean.ActivityBean;
import fourth.service.ActivityService;

@Controller
@RequestMapping("/ManageActivities")
public class ActivityUserBackendController {
	private final String MapKey_pageSize = "pageSize";
	private final String MapKey_pageNo = "pageNo";
	private final String MapKey_keyWord = "keyWord";
	private final String MAPKEY_ACTIVITY_ID = "activityID";
	private final String MAPKEY_ACTIVITY_REVIEW_MESSAGE = "ActivityReviewBeanMessage";

	@Autowired
	private ActivityService activityService;

	@GetMapping("/vities")
	@ResponseBody
	public String test() {
		
		return "0";
	}
	
	@PostMapping("/Public")
	@ResponseBody
	public Page<ActivityBean> responsePublicActivityByUser(@RequestBody() Map<String, String> map) {
		int userId = 2;

		Integer pageNo = Integer.valueOf(map.get(MapKey_pageNo));
		Integer pageSize = Integer.valueOf(map.get(MapKey_pageSize));
		PageRequest pageable = PageRequest.of(pageNo - 1, pageSize);

		return activityService.selectPublicActivityByUserId(pageable, userId);
	}

	@PostMapping("/All")
	@ResponseBody
	public Page<ActivityBean> responseAllActivityByUser(@RequestBody() Map<String, String> map) {
		int userId = 2;

		Integer pageNo = Integer.valueOf(map.get(MapKey_pageNo));
		Integer pageSize = Integer.valueOf(map.get(MapKey_pageSize));
		PageRequest pageable = PageRequest.of(pageNo - 1, pageSize);

		return activityService.selectAllActivityByUserId(pageable, userId);
	}
	
	@GetMapping("/{id}")
	@ResponseBody
	public ActivityBean selectActivity(@PathVariable Integer id) {
		return activityService.selectActivityById(id);
	}

	// 新增
	@PostMapping("/Activity_OP")
	@ResponseBody
	public ActivityBean insertActivities(@RequestBody() ActivityBean activityBean) {

		activityBean.setUserId(2);

		ActivityBean insertActivities = activityService.insertActivity(activityBean);
		return insertActivities;
	}

	// 修改
	@PutMapping("/Activity_OP")
	@ResponseBody
	public ActivityBean updateActivities(@RequestBody() ActivityBean activityBean) {
		activityBean.setUserId(2);
		ActivityBean updateActivities = activityService.updateActivity(activityBean);
		return updateActivities;

	}

	// 刪除
	@DeleteMapping("/Activity_OP")
	@ResponseBody
	public boolean deleteActivities(@RequestBody ActivityBean activityBean) {
		activityService.deleteActivity(activityBean.getId());
		return true;
	}

}

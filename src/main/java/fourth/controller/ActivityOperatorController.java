package fourth.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import fourth.bean.ActivityBean;
import fourth.service.ActivityService;


@Controller
@RequestMapping("/ActivityOperator")
public class ActivityOperatorController {

	private final String MapKey_pageSize = "pageSize";
	private final String MapKey_pageNo = "pageNo";
	private final String MapKey_keyWord = "keyWord";
	private final String MAPKEY_ACTIVITY_ID = "activityID";
	private final String MAPKEY_ACTIVITY_REVIEW_MESSAGE = "ActivityReviewBeanMessage";

	@Autowired
	private ActivityService activityService;

	public Page<ActivityBean> requestReviewingActivity(@RequestBody() Map<String, String> map) {
		Integer pageNo = Integer.valueOf(map.get(MapKey_pageNo));
		Integer pageSize = Integer.valueOf(map.get(MapKey_pageSize));
		PageRequest pageable = PageRequest.of(pageNo - 1, pageSize);

		return activityService.selectReviewingActivity(pageable);
	}

//審核失敗
	@PostMapping("/ReviewFail")
	@ResponseBody
	public boolean activityReviewFail(@RequestBody Map<String, String> map) {
		String message = map.get(MAPKEY_ACTIVITY_REVIEW_MESSAGE);
		int activityById = Integer.valueOf(map.get(MAPKEY_ACTIVITY_ID));
		activityService.activityReviewFalse(activityById, message);
		return true;
	}

//	審核成功
	@PostMapping("/RviewSuccessful")
	@ResponseBody
	public boolean activityRviewSuccessful(@RequestBody Map<String, String> map) {
		int activityById = Integer.valueOf(map.get(MAPKEY_ACTIVITY_ID));
		activityService.activityRviewTrue(activityById);
		return true;
	}
}

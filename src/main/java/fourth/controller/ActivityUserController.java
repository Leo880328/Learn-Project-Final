package fourth.controller;

import java.util.List;
import java.util.Map;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import fourth.bean.ActivityAttendeesBean;
import fourth.bean.ActivityBean;
import fourth.service.ActivityService;

@Controller
@RequestMapping("/myActivities")
public class ActivityUserController {
	
	private final String MapKey_pageSize = "pageSize";
	private final String MapKey_pageNo = "pageNo";
	private final String MapKey_keyWord = "keyWord";
	private final String MAPKEY_ACTIVITY_ID = "activityID";
	private final String MAPKEY_ACTIVITY_REVIEW_MESSAGE = "ActivityReviewBeanMessage";
	
	@Autowired
	private ActivityService activityService;
	
	@GetMapping()
	public String MyActivity() {
		return "Activity-MyActivity";
	}
	
	
	
	@PostMapping("/join{id}")
	@ResponseBody
	public String responseJoinAttendees(@PathParam("id")int activityId) {
		int userId = 1;
		ActivityBean selectActivityById = activityService.selectActivityById(activityId);
		new ActivityAttendeesBean(selectActivityById, userId);
		
		return activityService.insertActivityAttendees(selectActivityById,userId);
	}
	
	@PostMapping("/all")
	@ResponseBody
	public Page<ActivityAttendeesBean> responseAttendeesByUserId(@RequestBody() Map<String, String> map) {
		int userId = 1;
		
		Integer pageNo = Integer.valueOf(map.get(MapKey_pageNo));
		Integer pageSize = Integer.valueOf(map.get(MapKey_pageSize));

		PageRequest pageable = PageRequest.of(pageNo - 1, pageSize);
		return activityService.selectAttendeesByUserId(pageable,userId);
	}
	
	@PostMapping("/effective")
	@ResponseBody
	public Page<ActivityAttendeesBean> responseEffectiveAttendeesByUserId(@RequestBody() Map<String, String> map) {
		int userId = 1;
		
		Integer pageNo = Integer.valueOf(map.get(MapKey_pageNo));
		Integer pageSize = Integer.valueOf(map.get(MapKey_pageSize));

		PageRequest pageable = PageRequest.of(pageNo - 1, pageSize);
		
		return activityService.selectEffectiveAttendeesByActivityId(pageable,userId);
	}
	
	
}

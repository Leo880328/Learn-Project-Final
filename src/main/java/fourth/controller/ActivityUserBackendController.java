package fourth.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import fourth.bean.ActivityAttendeesBean;
import fourth.bean.ActivityBean;
import fourth.bean.ActivityReviewBean;
import fourth.bean.MemberBean;
import fourth.service.ActivityService;

@Controller
@RequestMapping("/ManageActivities")
public class ActivityUserBackendController {
	private final String MapKey_pageSize = "pageSize";
	private final String MapKey_pageNo = "pageNo";

	@Autowired
	private ActivityService activityService;

	@GetMapping()
	public String Backend() {
		return "ActivitiesManage";
	}

	@GetMapping("/createActivity")
	public String createActivity() {
		return "ActivitiesEdit";
	}

	@GetMapping("/update/{id}")
	public String updateActivity() {
		return "ActivitiesEdit";
	}

	@PostMapping("/Public")
	@ResponseBody
	public Page<ActivityBean> responsePublicActivityByUser(@RequestBody() Map<String, String> map,HttpSession session) {
		MemberBean user = (MemberBean)session.getAttribute("user");
		if(user!=null) {
			int userId = user.getuserId();
			Integer pageNo = Integer.valueOf(map.get(MapKey_pageNo));
			Integer pageSize = Integer.valueOf(map.get(MapKey_pageSize));
			PageRequest pageable = PageRequest.of(pageNo - 1, pageSize);

			return activityService.selectPublicActivityByUserId(pageable, userId);
		}
		return null;
		
	}

	@PostMapping("/All")
	@ResponseBody
	public Page<ActivityBean> responseAllActivityByUser(@RequestBody() Map<String, String> map,HttpSession session) {
		MemberBean user = (MemberBean)session.getAttribute("user");
		if(user!=null) {
			int userId = user.getuserId();
			Integer pageNo = Integer.valueOf(map.get(MapKey_pageNo));
			Integer pageSize = Integer.valueOf(map.get(MapKey_pageSize));
			PageRequest pageable = PageRequest.of(pageNo - 1, pageSize);

			return activityService.selectAllActivityByUserId(pageable, userId);
		}
		return null;
		
	}

	@GetMapping("/Activity/{id}")
	@ResponseBody
	public ActivityBean selectActivity(@PathVariable Integer id) {
		return activityService.selectActivityById(id);
	}

	@PostMapping("/Review/{id}")
	@ResponseBody
	public Page<ActivityReviewBean> responseActivityReviewBean(@PathVariable Integer id) {
		PageRequest pageable = PageRequest.of(0, 10);
		return activityService.selectReviewByActivityId(pageable, id);
	}

	@PostMapping("/Attendees/Activity{id}")
	@ResponseBody
	public Page<ActivityAttendeesBean> responseAttendeesByActivityId(@PathVariable Integer id) {
		PageRequest pageable = PageRequest.of(0, 10);
		return activityService.selectAttendeesByActivityId(pageable, id);
	}

	// 新增
	@PostMapping("/insertActivityBean")
	@ResponseBody
	public ActivityBean insertActivities(@RequestBody() ActivityBean activityBean,HttpSession session) {
		MemberBean user = (MemberBean)session.getAttribute("user");
		if(user!=null) {
			int userid = user.getuserId();
			activityBean.setUserId(userid);
			activityBean.setStatusCode(0);
			ActivityBean insertActivities = activityService.insertActivity(activityBean);
			// log
			activityService.insertActivityAttendees(insertActivities, userid);
			activityService.insertActivityReviewBean(new ActivityReviewBean(insertActivities.getId(), "使用者新增", 0));
			return insertActivities;
		}
		return null;
	}

	// 修改
	@PostMapping("/updateActivityBean")
	@ResponseBody
	public ActivityBean updateActivities(@RequestBody() ActivityBean activityBean,HttpSession session) {
		MemberBean user = (MemberBean)session.getAttribute("user");
		if(user!=null) {
			int userid = user.getuserId();
			activityBean.setUserId(userid);
			activityBean.setStatusCode(0);
			ActivityBean updateActivities = activityService.updateActivity(activityBean);
			activityService.insertActivityReviewBean(new ActivityReviewBean(updateActivities.getId(), "使用者修改", 0));
			return updateActivities;
		}
		return null;
	}

	// 刪除
	@DeleteMapping("/deleteActivityBean")
	@ResponseBody
	public boolean deleteActivities(@RequestBody ActivityBean activityBean) {
		activityService.deleteActivity(activityBean.getId());
		return true;
	}

}

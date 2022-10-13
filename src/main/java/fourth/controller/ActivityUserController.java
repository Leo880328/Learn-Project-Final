package fourth.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import fourth.bean.ActivityAttendeesBean;
import fourth.bean.ActivityBean;
import fourth.bean.MemberBean;
import fourth.service.ActivityService;

@Controller
@RequestMapping("/myActivities")
public class ActivityUserController {

	private final String MapKey_pageSize = "pageSize";
	private final String MapKey_pageNo = "pageNo";

	@Autowired
	private ActivityService activityService;

	@GetMapping()
	public String MyActivity() {
		return "Activity-MyActivity";
	}

	@PostMapping("/join{id}")
	@ResponseBody
	public Map<String, String> responseJoinAttendees(@PathVariable("id") int activityId,
			HttpSession session) {

		HashMap<String, String> response = new HashMap<String, String>();
		
		MemberBean user = (MemberBean) session.getAttribute("user");
		if (user != null) {
			int userId = user.getuserId();
			ActivityBean selectActivityById = activityService.selectActivityById(activityId);
			if (userId == selectActivityById.getUserId()) {
				response.put("error", "不可以加入自己的活動");
				return response;
			}
			ActivityAttendeesBean insertActivityAttendees = activityService.insertActivityAttendees(selectActivityById,
					userId);
			if (insertActivityAttendees == null) {
				response.put("error", "人數已滿");
			}
		}
		return response;
	}

	@PostMapping("/all")
	@ResponseBody
	public Page<ActivityAttendeesBean> responseAttendeesByUserId(@RequestBody() Map<String, String> map,
			HttpSession session) {
		MemberBean user = (MemberBean) session.getAttribute("user");
		if (user != null) {
			int userId = user.getuserId();
			Integer pageNo = Integer.valueOf(map.get(MapKey_pageNo));
			Integer pageSize = Integer.valueOf(map.get(MapKey_pageSize));
			PageRequest pageable = PageRequest.of(pageNo - 1, pageSize);
			return activityService.selectAttendeesByUserId(pageable, userId);
			
		}
		return null;
		
	}

	@PostMapping("/effective")
	@ResponseBody
	public Page<ActivityAttendeesBean> responseEffectiveAttendeesByUserId(@RequestBody() Map<String, String> map,
			HttpSession session) {
		MemberBean user = (MemberBean) session.getAttribute("user");
		if (user != null) {
			int userId = user.getuserId();
			Integer pageNo = Integer.valueOf(map.get(MapKey_pageNo));
			Integer pageSize = Integer.valueOf(map.get(MapKey_pageSize));
			PageRequest pageable = PageRequest.of(pageNo - 1, pageSize);

			return activityService.selectEffectiveAttendeesByActivityId(pageable, userId);

		}
		return null;
	}

}

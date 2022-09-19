package fourth.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fourth.bean.ActivityBean;
import fourth.dao.ActivityRepository;



@Service
@Transactional
public class ActivityService {
	
	@Autowired
	private ActivityRepository activityRepository;

	
	//顯示所有活動
	public List<ActivityBean> selectAllActivity() {
		List<ActivityBean> activityBeans = activityRepository.findAll();
		return activityBeans;
	}
	//顯示有條件之活動
	public List<ActivityBean> selectActivity(String SQLwhere) {
		List<ActivityBean> activityBeans = activityRepository.findAll();
		return activityBeans;
	}
	//新增活動資料
	public ActivityBean insertActivities(ActivityBean activity) {
			if(activity!=null) {
				return activityRepository.save(activity);	
			}
			return null;
	}

	// 調用資料庫刪除活動
	public boolean deleteActivities(ActivityBean activity) {
		Integer id = activity.getId();
		if(id!=null) {
			activityRepository.delete(activity);
			return true;
		}
		return false;
	}

	// 調用資料庫更新活動
	public ActivityBean updateActivities(ActivityBean activity) {
		if(activity!=null) {
			return activityRepository.save(activity);
		}
		return null;
	}



}

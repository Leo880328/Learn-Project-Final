package fourth.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fourth.bean.ActivityAttendeesBean;
import fourth.dao.ActivityAttendeesRepository;

@Service
@Transactional
public class ActivityAttendeesService {
	
	@Autowired
	private ActivityAttendeesRepository activityAttendeesRepository;
	
	
		
	public List<ActivityAttendeesBean> selectAllByActivityID(int activityId) {
		List<ActivityAttendeesBean> findAllByActivityID = activityAttendeesRepository.findAllByActivityID(activityId);
		return findAllByActivityID;
	}
	
	public List<ActivityAttendeesBean> selectAllByUserID(int userId) {
		List<ActivityAttendeesBean> findAllByActivityID = activityAttendeesRepository.findAllByUserID(userId);
		return findAllByActivityID;
	}
	

}

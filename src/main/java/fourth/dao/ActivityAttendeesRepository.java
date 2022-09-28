package fourth.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import fourth.bean.ActivityAttendeesBean;

public interface ActivityAttendeesRepository extends JpaRepository<ActivityAttendeesBean, ActivityAttendeesBean> {
	
	@Query(value = "select * from [activity_notification] where [activity_attendees] = [:acticities_id]",nativeQuery = true)
	public List<ActivityAttendeesBean> findActivityNotificationBeansByActivityID(@Param("acticities_id") Integer acticitiesId);
}

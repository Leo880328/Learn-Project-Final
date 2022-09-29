package fourth.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import fourth.bean.ActivityAttendeesBean;
import fourth.bean.ActivityAttendeesId;

public interface ActivityAttendeesRepository extends JpaRepository<ActivityAttendeesBean, ActivityAttendeesId> {
	
	@Query(value = "select * from [activity_notification] where [activity_id] = [:activity_id]",nativeQuery = true)
	public List<ActivityAttendeesBean> findAllByActivityID(@Param("activity_id") Integer acticitiesId);
	
	@Query(value = "select * from [activity_notification] where [user_id] = [:user_id]",nativeQuery = true)
	public List<ActivityAttendeesBean> findAllByUserID(@Param("user_id") Integer userId);
}

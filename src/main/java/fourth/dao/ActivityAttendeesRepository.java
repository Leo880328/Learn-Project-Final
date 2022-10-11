package fourth.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import fourth.bean.ActivityAttendeesBean;
import fourth.bean.ActivityAttendeesId;

public interface ActivityAttendeesRepository extends JpaRepository<ActivityAttendeesBean, ActivityAttendeesId> {
	
	@Query(value = "select * from activity_attendees where activity_id = :activity_id",nativeQuery = true)
	public Page<ActivityAttendeesBean> findAllByActivityID(Pageable pageable,@Param("activity_id") Integer acticitiesId);
	
	@Query(value = "select COUNT(*) as effective_number from activity_attendees where activity_id = :activity_id",nativeQuery = true)
	public int findEffectiveNumberByActivityID(@Param("activity_id") Integer acticityId);
	
	@Query(value = "select * from activity_attendees where user_id = :user_id order by request_time desc",nativeQuery = true)
	public Page<ActivityAttendeesBean> findAllByUserID(Pageable pageable,@Param("user_id") Integer userId);
	
	@Query(value = "select * from activity_attendees where user_id = :user_id and activity_id in (select id from acticities where [start_time] > GETDATE() ) order by request_time desc",nativeQuery = true)
	public Page<ActivityAttendeesBean> findRegisterEffectiveByUserID(Pageable pageable,@Param("user_id") Integer userId);
}

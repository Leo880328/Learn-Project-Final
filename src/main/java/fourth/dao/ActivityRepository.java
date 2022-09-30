package fourth.dao;

import java.util.Date;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import fourth.bean.ActivityBean;

public interface ActivityRepository extends JpaRepository<ActivityBean, Integer> {
	
//	@Query(value = "select * from acticities where start_time <= :today and :today <= end_time and status_code ="+ActivityBean.STATUS_PUBLIC+";"  ,nativeQuery = true)
//	public Page<ActivityBean> findAllByBetweenActivityTime(Pageable pageable,@Param("today") Date date);
	
	@Query(value = "select * from acticities where start_time >:today  status_code ="+ActivityBean.STATUS_PUBLIC+";"  ,nativeQuery = true)
	public Page<ActivityBean> findAllByBetweenActivityTime(Pageable pageable,@Param("today") Date date);
	
	public Page<ActivityBean> findAllByStatusCode(Pageable pageable,int activityStatus);
	
	public Page<ActivityBean> findAllByTitleLike(Pageable pageable,String keyWord);
	
	
	
}

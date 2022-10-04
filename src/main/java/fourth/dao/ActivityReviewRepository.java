package fourth.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import fourth.bean.ActivityReviewBean;



public interface ActivityReviewRepository extends JpaRepository<ActivityReviewBean, Integer> {
	
	public Page<ActivityReviewBean> findAllByActivityId(Pageable pageable,int activityId);
	
	public Page<ActivityReviewBean> findAllByStatusCode(Pageable pageable,int StatusCode);
	
	@Query(value = 
			"select * from activity_review where [id] in "
			+ "(select  max(id) as id from [activity_review] as a group by [activity_id])"
			+ " and [status_code]= :activityStatus ", nativeQuery = true)
	public Page<ActivityReviewBean> findNewestByStatusCode(Pageable pageable, @Param("activityStatus") int activityStatus);
}

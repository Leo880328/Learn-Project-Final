package fourth.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import fourth.bean.ActivityBean;
import fourth.bean.ActivityReviewBean;



public interface ActivityReviewRepository extends JpaRepository<ActivityReviewBean, Integer> {
	
	public Page<ActivityReviewBean> findAllByActivityId(Pageable pageable,int activityId);
	
	public Page<ActivityReviewBean> findAllByStatusCode(Pageable pageable,int StatusCode);
	
	
}

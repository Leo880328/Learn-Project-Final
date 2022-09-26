package fourth.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;



import fourth.bean.ActivityBean;

public interface ActivityRepository extends JpaRepository<ActivityBean, Integer> {
	
	
	
	public List<ActivityBean> findAllByEndTimeAfter(Date today);
	
	public List<ActivityBean> findAllByEndTimeBetween(Date date ,Date  date2);
	
	public Page<ActivityBean> findAllByTitleLike(Pageable pageable,String keyWord);
	
}

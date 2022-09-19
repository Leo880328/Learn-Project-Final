package fourth.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import fourth.bean.ActivityBean;

public interface ActivityRepository extends JpaRepository<ActivityBean, Integer> {

}

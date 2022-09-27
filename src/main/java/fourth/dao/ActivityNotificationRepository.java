package fourth.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import fourth.bean.ActivityNotificationBean;

public interface ActivityNotificationRepository extends JpaRepository<ActivityNotificationBean, Integer> {

}

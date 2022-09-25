package fourth.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import fourth.bean.OrderStatus;

public interface OrderStatusRepository extends JpaRepository<OrderStatus, Integer> {

}

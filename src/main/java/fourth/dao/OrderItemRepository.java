package fourth.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import fourth.bean.OrderItem;
import fourth.bean.OrderUser;

public interface OrderItemRepository extends JpaRepository<OrderItem, Integer> {
	
	public List<OrderItem> findByOrderUser_OrderId(String orderId);
	
	@Query(value = "select item_id from OrderItem where order_id = ?1")
	public List<Integer> findItemIdByOrderUser_OrderId(String orderId);
}

package fourth.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import fourth.bean.OrderUser;

public interface OrderRepository  extends JpaRepository<OrderUser, String>{
	
	public List<OrderUser> findByMemberBean_userId(int id);
	
	@Query(value = "select * from OrderUser o where o.memberBean.account like %?1% or o.memberBean.name like %?2% or o.order_id like %?3%",nativeQuery = true )
	public List<OrderUser> searchOrder(String a,String n, String o);
	
	
	@Query(value = "select orderId from OrderUser where memberBean.userId = ?1 and status = 4" )
	public List<String> searchLearn(int userId);
	
	@Query(value ="select * from order_user where date >= ?1 and date <= ?2 and status = 4 ",nativeQuery = true)
	public List<OrderUser> findByStatus_IdOrderByDateAsc(String start,String end);
	
	public List<OrderUser> findAllByOrderByDateAsc();

	public List<OrderUser> findAllByStatus_Id(Integer status);
}

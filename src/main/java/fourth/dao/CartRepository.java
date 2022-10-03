package fourth.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import fourth.bean.CartItem;

public interface CartRepository extends JpaRepository<CartItem, Integer> {
	
	
		public void deleteByMemberBean_UserId(Integer userId);
		
		
		public List<CartItem> findByMemberBean_UserId(Integer userId);
		
		public CartItem findByCourseBean_CourseIdAndMemberBean_UserId(Integer itemId,Integer userId);
}

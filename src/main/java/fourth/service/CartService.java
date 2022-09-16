package fourth.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import fourth.bean.CartItem;
import fourth.bean.CourseBean;
import fourth.dao.CartDaoImpt;
import fourth.dao.CartRepository;
import fourth.dao.CourseDao;
import fourth.util.WebUtils;

@Service
@Transactional
public class CartService {
	
	@Autowired
	CartDaoImpt cartDaoImpt ;
	
	@Autowired
	CourseDao courseDao ;
	
	@Autowired
	private CartRepository cartRepository;	
	

	//@Override
	public void cartClear(int userId) {
		cartRepository.deleteByMemberBean_UserId(userId);
	}

	//@Override
	public void cartAdd(String cartId,int id) throws SQLException{
		CourseBean course = courseDao.select(WebUtils.paseInt(cartId));
		CartItem cart = new CartItem(0, id, course.getCourse_id(), course.getCourse_name(), 1,
				course.getCourse_price());
		cart.setCourseBean(course);
		
		cartDaoImpt.addCart(cart);
	}

	//@Override
	public void cartDelete(String id){
		cartRepository.deleteById(WebUtils.paseInt(id));

	}

	//@Override
	public List<CartItem> cartList(int id){
		List<CartItem> cartList = cartRepository.findByMemberBean_UserId(id);
		return cartList;
	}
	
	
	public CartItem getCountPriceTotal(List<CartItem> cart) {
		CartItem cartItem = new CartItem();
		int count = 0;
		double price = 0;
		if(cart.size()==0) {
			cartItem.setTotalCount(0);
		}else {
			for(CartItem item : cart) {
				count += item.getCount();
				price += item.getCourseBean().getCourse_price();
			}
			cartItem = cart.get(0);
			cartItem.setTotalCount(count);
			cartItem.setTotalPrice(price);
			return cartItem;
		}
		return cartItem;
	}
}

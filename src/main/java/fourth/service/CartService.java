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
import fourth.bean.MemberBean;
import fourth.dao.CartRepository;
import fourth.dao.CourseRepository;
import fourth.dao.MemberRepository;
import fourth.util.WebUtils;

@Service
@Transactional
public class CartService {
	
	
	
	@Autowired
	private CartRepository cartRepository;	
	
	@Autowired
	private CourseRepository courseRepository;
	
	@Autowired
	private MemberRepository memberRepository;

	//@Override
	public void cartClear(int userId) {
		cartRepository.deleteByMemberBean_UserId(userId);
	}

	//@Override
	public void cartAdd(String cartId,int id) throws SQLException{
		System.out.println(cartId);
		CourseBean course = courseRepository.findById(WebUtils.paseInt(cartId)).get();
		CartItem cart = new CartItem(0, id, course.getcourseId(), course.getCourse_name(), 1,
				course.getCourse_price());
		MemberBean memberBean = memberRepository.findById(id).get();
		cart.setCourseBean(course);
		cart.setMemberBean(memberBean);
		cartRepository.save(cart);
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

	public CartItem findsameCourse(String courseID,Integer userId) {
			CartItem cartItem = cartRepository.findByCourseBean_CourseIdAndMemberBean_UserId(WebUtils.paseInt(courseID),userId);
			return cartItem;
	}
}

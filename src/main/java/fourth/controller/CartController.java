package fourth.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import fourth.bean.CartItem;
import fourth.bean.CourseBean;
import fourth.bean.MemberBean;
import fourth.service.CartService;
import fourth.service.CourseService;
import fourth.util.WebUtils;

@Controller
@SessionAttributes(names = {"user"})
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private CourseService cService;
	
	
	
	@GetMapping(path = "/cart")
	public String cartList(Model m,HttpServletRequest request) {
		MemberBean user = (MemberBean)m.getAttribute("user");
		List<CartItem> cartList = cartService.cartList(user.getuserId());
		m.addAttribute("cartList", cartList);
		CartItem countPriceTotal = cartService.getCountPriceTotal(cartList);
		m.addAttribute("countPriceTotal",countPriceTotal);
		return "Cart";
	}

	
	@PostMapping(path = "/cartadd")
	public String addCart(Model m, String courseID) throws SQLException {
		MemberBean user = (MemberBean)m.getAttribute("user");
		cartService.cartAdd(courseID,user.getuserId());
		CourseBean cbean = cService.findByCourseId(WebUtils.paseInt(courseID));
		m.addAttribute("cbean", cbean); 
		return "Details";
	}
	
	
	@DeleteMapping(path = "/cart/{cartID}")
	public String deleteCart(@PathVariable("cartID") String cartID) {
		cartService.cartDelete(cartID);
		return "redirect:/cart";
	}
	
	@PostMapping(path = "/cart/clearCart")
	public String clearCart(Model m) {
		MemberBean user = (MemberBean)m.getAttribute("user");
		cartService.cartClear(user.getuserId());
		return "redirect:/cart";
	}
	
	@GetMapping(path = "/cart/cartCount")
	@ResponseBody
	public String cartTotalCountPrice(Model m) throws IOException {
		CartItem countPriceTotal = new CartItem();
		MemberBean user = (MemberBean)m.getAttribute("user");
		if(user != null) {
			List<CartItem> cartList = cartService.cartList(user.getuserId());
			countPriceTotal = cartService.getCountPriceTotal(cartList);
		}else {
			countPriceTotal.setTotalCount(0);
			return String.valueOf(countPriceTotal.getTotalCount());
		}
		return String.valueOf(countPriceTotal.getTotalCount());
	}
}

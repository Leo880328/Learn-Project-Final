package fourth.controller;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

import ch.qos.logback.core.net.SyslogOutputStream;
import fourth.bean.CartItem;
import fourth.bean.CourseBean;
import fourth.bean.MemberBean;
import fourth.service.CartService;
import fourth.service.CourseService;
import fourth.util.SystemControllerLog;
import fourth.util.WebUtils;

@Controller
@SessionAttributes(names = {"user"})
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@ResponseBody
	@GetMapping(path = "/cartAll")
	public List<CartItem>  cartListRes(Model m,HttpServletRequest request) {
		MemberBean user = (MemberBean)m.getAttribute("user");
		List<CartItem> cartList = cartService.cartList(user.getuserId());
		return cartList;
	}
	
	@GetMapping(path = "/cart")
	public String cartList(Model m,HttpServletRequest request) {
		return "Cart";
	}

	@SystemControllerLog(description = "添加商品到購物車")
	@ResponseBody
	@PostMapping(path = "/cartadd/{id}")
	public String addCart(Model m,@PathVariable("id") String courseID) throws SQLException {
		MemberBean user = (MemberBean)m.getAttribute("user");
		CartItem cartItem = cartService.findsameCourse(courseID,user.getuserId());
		if(cartItem != null) {
			return "exist";
		}else {
			cartService.cartAdd(courseID,user.getuserId());
		}
		return "add Ok";
	}
	
	@SystemControllerLog(description = "刪除購物車品項")
	@ResponseBody
	@DeleteMapping(path = "/cart/{cartID}")
	public String deleteCart(@PathVariable("cartID") String cartID) {
		cartService.cartDelete(cartID);
		return "deleteOK";
	}

	@SystemControllerLog(description = "清空購物車")
	@ResponseBody
	@PostMapping(path = "/cart/clearCart")
	public String clearCart(Model m) {
		MemberBean user = (MemberBean)m.getAttribute("user");
		cartService.cartClear(user.getuserId());
		return "clear Ok";
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

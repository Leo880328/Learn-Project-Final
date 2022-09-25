package fourth.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import fourth.bean.CourseBean;
import fourth.bean.MemberBean;
import fourth.bean.OrderItem;
import fourth.bean.OrderUser;
import fourth.ecpay.payment.integration.domain.AioCheckOutALL;
import fourth.service.OrderService;

@Controller
@SessionAttributes(names = {"user"})
public class OrderController {
	
	@Autowired
	private OrderService orderService;

	
	@ResponseBody
	@GetMapping(path = "/orderListAll")
	public List<OrderUser> orderListAll(HttpServletRequest request,Model m) {
		String pageStatus = (String)request.getSession().getAttribute("pageStatus");
		MemberBean user = (MemberBean)m.getAttribute("user");
		List<OrderUser> orderList = orderService.orderList(user.getuserId(),user.getStatus(),pageStatus);
		return orderList;
	}
	@GetMapping(path = "/orderList")
	public String orderList(HttpServletRequest request,Model m) {
		return "order";
	}
	
	@ResponseBody
	@GetMapping(path = "/orderList/total")
	public List<OrderUser> orderListTotal(HttpServletRequest request,Model m) {
		List<OrderUser> orderList = orderService.total();
		return orderList;
	}
	
	@PostMapping(path = "/orderAdd")
	public String addOrder(Model m) {
		MemberBean user = (MemberBean)m.getAttribute("user");
		orderService.addOrder(user.getuserId());
		return "redirect:/orderList";
	}
	
	@ResponseBody
	@DeleteMapping(path = "order/{id}")
	public String deleteOrder(@PathVariable("id") String cartID) {
		orderService.deleteOrder(cartID);
		return "delete Ok";
	}
	
	@ResponseBody
	@GetMapping(path = "order/{id}")
	public OrderUser OrderById(@PathVariable("id") String cartID) {
		OrderUser orderItemUser = orderService.orderItemUser(cartID);
		return orderItemUser;
	}
	
//	@PostMapping(path = "/deleteOrder")
//	public String deleteOrder(String cartID) {
//		orderService.deleteOrder(cartID);
//		return "redirect:/orderList";
//	}
	@PostMapping(path = "/orderDetail")
	public String orderDetail(String cartID,Model m) {
		List<OrderItem> orderItemList = orderService.orderItemList(cartID);
		OrderUser orderItemUser = orderService.orderItemUser(cartID);
		m.addAttribute("itemList",orderItemList);
		m.addAttribute("order",orderItemUser);
		String[] status = {" ","未付款","已付款","待審核","完成訂單"};
		m.addAttribute("statusArr",status);
		return "orderUpdate";
	}
	@PostMapping(path = "/goEcpay")
	public String goEcpay(HttpServletRequest request, String orderID,Model m) {
		String url =request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
		AioCheckOutALL obj = new AioCheckOutALL();
		String ecPay = orderService.ecPay(orderID, url, obj);
		m.addAttribute("ecpay",ecPay);
		return "ecpay";
	}

	
	
	@GetMapping(path = "/updateOrder/{status}/{orderId}")
	public String updateOrder(
			@PathVariable(required = false , value = "status")	int status,
			@PathVariable(required = false, value="orderId") String orderId,
			Model m,HttpServletRequest request) throws SQLException  {
		String url =request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
		MemberBean user = (MemberBean)m.getAttribute("user");
		orderService.updateOrder(user.getStatus(), status, orderId,url);
		return "redirect:/orderList";
	}
	
	@PostMapping(path = "/searchOder")
	public String searchOrder(@RequestParam(required = false) String search,Model m)  {
		System.out.println(search);
		List<OrderUser> orderSearch = orderService.orderSearch(search);
		if(orderSearch == null) {
			m.addAttribute("search","無");
		}
		m.addAttribute("order",orderSearch);
		return "order";
	}
	
	@GetMapping(path = "/searchLearn")
	public String searchLearn(Model m) throws SQLException  {
		MemberBean user = (MemberBean)m.getAttribute("user");
		List<CourseBean> searchLearn = orderService.searchLearn(user.getuserId());
		System.out.println(searchLearn);
		int ran = (int)(Math.random()* 5 + 1);
		m.addAttribute("ran",ran);
		m.addAttribute("myItem",searchLearn);
		return "myLearn";
	}
	
	@GetMapping(path = "/chart/{start}/{end}/{day}")
	@ResponseBody
	public Map<String, List<OrderUser>> chart(Model m,@PathVariable("start") String start,@PathVariable("end") String end,@PathVariable("day") Integer day) throws Exception{
		MemberBean user = (MemberBean)m.getAttribute("user");
		Map<String, List<OrderUser>> chart = orderService.chart(start,end,day);
		System.out.println(chart);
		return chart;
	}
	
	@GetMapping(path = "/statuschart")
	@ResponseBody
	public Map<Integer, List<String>> statusChart(Model m) throws Exception{
		MemberBean user = (MemberBean)m.getAttribute("user");
		Map<Integer, List<String>> statusChart = orderService.statusChart();
		return statusChart;
	}

	@ResponseBody
	@GetMapping(path = "/searchStatus/{status}")
	public List<OrderUser>  searchStatus(Model m,@PathVariable("status") Integer status) throws Exception{
		MemberBean user = (MemberBean)m.getAttribute("user");
		List<OrderUser> searchStatust = orderService.searchStatust(user.getuserId(), status);
		return searchStatust;
	}
}

package fourth.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.resource.transaction.internal.SynchronizationRegistryStandardImpl;
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
import fourth.bean.Log;
import fourth.bean.MemberBean;
import fourth.bean.OrderItem;
import fourth.bean.OrderUser;
import fourth.bean.Voucher;
import fourth.ecpay.payment.integration.domain.AioCheckOutALL;
import fourth.service.LogService;
import fourth.service.OrderService;
import fourth.service.VoucherService;
import fourth.util.SystemControllerLog;

@Controller
@SessionAttributes(names = {"user"})
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private VoucherService voucherService;
	
	@Autowired
	private LogService logService;
	
	@ResponseBody
	@GetMapping(path = "/orderListAll")
	public List<OrderUser> orderListAll(HttpServletRequest request,Model m) {
		String pageStatus = (String)request.getSession().getAttribute("pageStatus");
		MemberBean user = (MemberBean)m.getAttribute("user");
		List<OrderUser> orderList = orderService.orderList(user.getuserId(),user.getStatus(),pageStatus);
		System.out.println(orderList);
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
	
	@SystemControllerLog(description = "生成訂單")
	@PostMapping(path = "/orderAdd")
	public String addOrder(Model m) {
		MemberBean user = (MemberBean)m.getAttribute("user");
		orderService.addOrder(user.getuserId());
		return "redirect:/orderList";
	}
	
	@SystemControllerLog(description = "刪除訂單")
	@ResponseBody
	@DeleteMapping(path = "order/{id}")
	public List<OrderUser> deleteOrder(@PathVariable("id") String cartID,Model m) {
		MemberBean user = (MemberBean)m.getAttribute("user");
		orderService.deleteOrder(cartID);
		List<OrderUser> orderUserList = orderService.orderUserList(user.getuserId());
		return orderUserList;
	}
	
<<<<<<< HEAD
	
=======
>>>>>>> a6386826bc6e5337e61e829c67c65829d8fb589a
	@ResponseBody
	@GetMapping(path = "order/{id}")
	public OrderUser OrderById(@PathVariable("id") String cartID) {
		OrderUser orderItemUser = orderService.orderItemUser(cartID);
		return orderItemUser;
	}
	

	@PostMapping(path = "/orderDetail")
	public String orderDetail(String cartID,Model m) {
		List<OrderItem> orderItemList = orderService.orderItemList(cartID);
		OrderUser orderItemUser = orderService.orderItemUser(cartID);
		m.addAttribute("itemList",orderItemList);
		m.addAttribute("order",orderItemUser);
		System.out.println(orderItemUser);
		return "orderUpdate";
	}
	
	@SystemControllerLog(description = "會員進行付款操作")
	@PostMapping(path = "/goEcpay")
	public String goEcpay(HttpServletRequest request, String orderID,Model m,@RequestParam(value = "number",required = false) String number) {
		String url =request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
		AioCheckOutALL obj = new AioCheckOutALL();
		String ecPay = orderService.ecPay(orderID, url, obj,number);
		m.addAttribute("ecpay",ecPay);
		return "ecpay";
	}
	
//	@PostMapping(path = "/goEcpay")
//	public String goEcpay(HttpServletRequest request, String orderID,Model m,@RequestParam(value = "number",required = false) String number) {
//		String url =request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
//		+ request.getContextPath();
//		AioCheckOutALL obj = new AioCheckOutALL();
//		
//		System.out.println(number.toString() +"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1");
//		String ecPay = orderService.ecPay(orderID, url, obj,number);
//		m.addAttribute("ecpay",ecPay);
//		return "forward:/updateOrder/2/"+orderID+"/"+number;
//	}

	
	@SystemControllerLog(description = "更改訂單狀態")
	@GetMapping(path = {"/updateOrder/{status}/{orderId}/{number}","/updateOrder/{status}/{orderId}"})
	public String updateOrder(
			@PathVariable(required = false , value = "status")	int status,
			@PathVariable(required = false, value="orderId") String orderId,
<<<<<<< HEAD
			@PathVariable(value = "number",required = false) String number,
=======
>>>>>>> a6386826bc6e5337e61e829c67c65829d8fb589a
			Model m,HttpServletRequest request) throws SQLException  {
		String url =request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
		MemberBean user = (MemberBean)m.getAttribute("user");
<<<<<<< HEAD
		orderService.updateOrder(user.getStatus(), status, orderId,url,number);
=======
		orderService.updateOrder(user.getStatus(), status, orderId,url);
>>>>>>> a6386826bc6e5337e61e829c67c65829d8fb589a
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
<<<<<<< HEAD
	
	

	@ResponseBody
	@GetMapping(path = "/order/voucher/{number}")
	public Voucher checkVoucher(@PathVariable(required = false,value = "number") String number) {
		
		Voucher voucher = voucherService.findByNumber(number);
		return voucher;
	}
	
	@ResponseBody
	@GetMapping(path = "/order/voucher")
	public Voucher oneKey() {
		Voucher randomVoucher = voucherService.randomVoucher();
		return randomVoucher;
	}
	
	@ResponseBody
	@GetMapping(path = "/order/voucher/use")
	public Voucher use() {
		Voucher randomVoucher = voucherService.randomVoucherUse();
		return randomVoucher;
	}
	
	@GetMapping(path = "/backDairy")
	public String log(Model m) {
		List<Log> logs = logService.findAll();
		System.out.println(logs);
		m.addAttribute("logs",logs);
		return "log";
	}
=======
>>>>>>> a6386826bc6e5337e61e829c67c65829d8fb589a
}

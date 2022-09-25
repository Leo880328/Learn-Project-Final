package fourth.service;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fourth.bean.CartItem;
import fourth.bean.CourseBean;
import fourth.bean.MemberBean;
import fourth.bean.OrderItem;
import fourth.bean.OrderStatus;
import fourth.bean.OrderUser;
import fourth.dao.CartRepository;
import fourth.dao.CourseRepository;
import fourth.dao.MemberRepository;
import fourth.dao.OrderItemRepository;
import fourth.dao.OrderRepository;
import fourth.dao.OrderStatusRepository;
import fourth.ecpay.payment.integration.AllInOne;
import fourth.ecpay.payment.integration.domain.AioCheckOutALL;
import fourth.mail.JavaMail;
import fourth.util.DateUtil;
import fourth.util.WebUtils;

@Service
@Transactional
public class OrderService {

	@Autowired
	private CourseRepository courseRepository;
	
	@Autowired
	private CartRepository cartRepository;
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private OrderStatusRepository orderStatusRepository;
	
	@Autowired
	private OrderRepository orderRepository;
	
	@Autowired
	private OrderItemRepository itemRepository;
	
	
	static AllInOne allInOne = new AllInOne("");

	// @Override
	public String ecPay(String orderId, String url, AioCheckOutALL obj) {
		OrderUser orderUser = orderRepository.findById(orderId).get();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String dateToStr = dateFormat.format(orderUser.getDate());
		List<OrderItem> orderItemList = itemRepository.findByOrderUser_OrderId(orderId);
		String itemName = "";
		int i = 0;
		for (OrderItem item : orderItemList) {
			if (i == orderItemList.size() - 1) {
				itemName += item.getName();
			} else {
				itemName += item.getName() + "#";
				i++;
			}
		}

		obj.setMerchantTradeNo(orderId + String.valueOf((int) (Math.random() * 10000)));
		obj.setMerchantTradeDate(dateToStr);
		obj.setTotalAmount(String.valueOf((int) orderUser.getTotoalprice()));
		obj.setTradeDesc("test Description");
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setNeedExtraPaidInfo("N");
		obj.setItemName(itemName);
		//obj.setReturnURL("https://53b0-61-58-161-201.jp.ngrok.io/SpringMvcHomework/updateOrder/2/"+orderId);
		obj.setClientBackURL(url + "/updateOrder/2/" + orderId);
		//obj.setClientBackURL(url+"/orderList");
		String form = allInOne.aioCheckOut(obj, null);
		return form;
	}

	public static boolean cmprChkMacValue() {
		Hashtable<String, String> dict = new Hashtable<String, String>();
		dict.put("MerchantID", "2000132");
		dict.put("CheckMacValue", "50BE3989953C1734E32DD18EB23698241E035F9CBCAC74371CCCF09E0E15BD61");
		return allInOne.compareCheckMacValue(dict);
	}

	// @Override
	public List<CourseBean> searchLearn(int id) throws SQLException {
			List<String> resultList = orderRepository.searchLearn(id);
			List<CourseBean> courses = new ArrayList<>();
			for (String o : resultList) {
				List<Integer> orderItemIDList = itemRepository.findItemIdByOrderUser_OrderId(o);
				for (Integer item : orderItemIDList) {
					CourseBean course = courseRepository.findById(item).get();
					courses.add(course);
				}
			}
		return courses;
	}

	// @Override
	public List<OrderUser> orderSearch(String search) {
		search = search.trim();
		List<OrderUser> orderSearch = orderRepository.searchOrder(search, search, search);
		if (orderSearch.size() == 0) {
			return null;
		}
		return orderSearch;
	}

	// @Override
	public List<OrderItem> orderItemList(String cartId) {
		List<OrderItem> orderItemList = itemRepository.findByOrderUser_OrderId(cartId);
		return orderItemList;
	}

	// @Override
	public OrderUser orderItemUser(String id) {
		OrderUser orderUser = orderRepository.findById(id).get();
		return orderUser;
	}

	// @Override
	public void deleteOrder(String id) {
		orderRepository.deleteById(id);
	}

	// @Override
	public void updateOrder(int userStatus, int status, String orderId ,String url) throws SQLException {
		OrderUser orderUser = orderRepository.findById(orderId).get();
		OrderStatus orderStatus = orderStatusRepository.findById(status).get();
		orderUser.setStatus(orderStatus);
		
		//新增課程觀看人數
		if (userStatus == 3 && status == 4) {
			List<Integer> orderItemIDList = itemRepository.findItemIdByOrderUser_OrderId(orderId);
			for (Integer item : orderItemIDList) {
				CourseBean courseBean = courseRepository.findById(item).get();
				courseBean.setEnrollment(courseBean.getEnrollment() + 1);
			}
		//已付款寄送信件
		} else if (status == 2) {
			sendbuyMail(orderUser,url);
		}else if(status == 5) {
			sendbackMail(orderUser,url);
		}else if(status == 6) {
			sendTurnMail(orderUser, url);
		}

	}

	// @Override
	public void addOrder(int id) {
		List<CartItem> carList = cartRepository.findByMemberBean_UserId(id);
		//加入訂單和丁單明細
		int count = 0;
		double price = 0;
		for (CartItem item : carList) {
			count += item.getCount();
			price += item.getCourseBean().getCourse_price();
		}
		MemberBean memberBean = memberRepository.findById(carList.get(0).getMemberBean().getuserId()).get();
		OrderStatus orderStatus = orderStatusRepository.findById(1).get();
		OrderUser order = new OrderUser();
		Date date = new Date();
		String orderID = String.valueOf(date.getTime() + String.valueOf(carList.get(0).getUser_id()));
		order.setOrderId(orderID);
		order.setDate(date);
		order.setStatus(orderStatus);
		order.setTotoalcount(count);
		order.setTotoalprice(price);
		order.setMemberBean(memberBean);
		orderRepository.save(order);
		//加入訂單明細
		for(CartItem item : carList) {
			OrderItem orderItem = new OrderItem();
			orderItem.setOrder_id(orderID);
			orderItem.setItem_id(item.getCourseBean().getCourse_id());
			orderItem.setName(item.getItemName());
			orderItem.setCount(item.getCount());
			orderItem.setPrice(item.getCourseBean().getCourse_price());
			orderItem.setOrderUser(order);
			itemRepository.save(orderItem);
			order.addorderItems(orderItem);
		}
		cartRepository.deleteByMemberBean_UserId(id);
	}
	
	// @Override
	public List<OrderUser> orderList(int id, int status,String pageStatus) {
		List<OrderUser> orderList = null;
		if (status != 3 || "1".equalsIgnoreCase(pageStatus)) {
			orderList = orderRepository.findByMemberBean_userId(id);
			return orderList;
		} else {
			orderList = orderRepository.findAll();
			return orderList;
		}
	}

	public void sendbuyMail(OrderUser orderUser,String url) {
		String txt = "<h2>" + "訂單編號: " + orderUser.getOrderId() + "<br>" + "訂單生成日期: " + orderUser.getDate() + "<br>"
				+ "購買人姓名: " + orderUser.getMemberBean().getName() + "<br>" + "購買人信箱: "
				+ orderUser.getMemberBean().getEmail() + "<br>" + "總金額: " + orderUser.getTotoalprice() + "<br>"
				+ "審核結果: 付款完成"+"<br>"
				+"網站連結: <a href="+url +">EEIT49 好學生</a>"+"<h2>";
		JavaMail javaMail = new JavaMail();
		javaMail.setCustomer("ggyy45529441@gmail.com");
		javaMail.setSubject("好學生-EEIT49 線上付款成功!");
		javaMail.setTxt(txt);
		javaMail.sendMail();
	}
	public void sendbackMail(OrderUser orderUser,String url) {
		String txt = "<h2>" + "訂單編號: " + orderUser.getOrderId() + "<br>" + "訂單生成日期: " + orderUser.getDate() + "<br>"
				+ "購買人姓名: " + orderUser.getMemberBean().getName() + "<br>" + "購買人信箱: "
				+ orderUser.getMemberBean().getEmail() + "<br>" + "總金額: " + orderUser.getTotoalprice()+"<br>"
				+ "審核結果: 已退款"+"<br>"
				+"網站連結: <a href="+url +">EEIT49 好學生</a>"+"<h2>";
		JavaMail javaMail = new JavaMail();
		javaMail.setCustomer("ggyy45529441@gmail.com");
		javaMail.setSubject("好學生-EEIT49 申請退款已成功!");
		javaMail.setTxt(txt);
		javaMail.sendMail();
	}
	public void sendTurnMail(OrderUser orderUser,String url) {
		String txt = "<h2>" + "訂單編號: " + orderUser.getOrderId() + "<br>" + "訂單生成日期: " + orderUser.getDate() + "<br>"
				+ "購買人姓名: " + orderUser.getMemberBean().getName() + "<br>" + "購買人信箱: "
				+ orderUser.getMemberBean().getEmail() + "<br>" + "總金額: " + orderUser.getTotoalprice() + "<br>"
				+"審核結果: 已駁回" +"<br>"
				+"網站連結: <a href="+url +">EEIT49 好學生</a>"+"<h2>";
		JavaMail javaMail = new JavaMail();
		javaMail.setCustomer("ggyy45529441@gmail.com");
		javaMail.setSubject("好學生-EEIT49 申請退款已駁回!");
		javaMail.setTxt(txt);
		javaMail.sendMail();
	}

	public Map<String,List<OrderUser>> chart(String start,String end,Integer day) throws Exception {
		String endDay = DateUtil.dateMinusAndAddDayyyyymmdd(end, 1);
		List<OrderUser> findAllByOrderByDateDesc = orderRepository.findByStatus_IdOrderByDateAsc(start,endDay);
		for(OrderUser o : findAllByOrderByDateDesc) {
			System.out.println(o.getDate());
		}
		
		Map<String,List<OrderUser>> map = new LinkedHashMap<>();
		System.out.println(day);
		for(int i = 0 ; i < day + 1; i++) {
			//
			String substring = start.substring(start.indexOf("-") + 1);
			String dateMinusAndAddDay = DateUtil.dateMinusAndAddDaymmdd(substring, i);
			List<OrderUser> list = new ArrayList<>();
			map.put(dateMinusAndAddDay,list );
			for(OrderUser o :findAllByOrderByDateDesc) {
				String today = DateUtil.dateMinusAndAddDay(o.getDate(), 0);
				if(dateMinusAndAddDay.equals(today)) {
					map.get(dateMinusAndAddDay).add(o);
				}
			}
		}
		return map;
	}

	public Map<Integer,List<String>> statusChart() {
		List<OrderUser> list = orderRepository.findAll();
		Map<Integer,List<String>> map = new LinkedHashMap<>();
		map.put(1, new ArrayList<String>());
		map.put(2, new ArrayList<String>());
		map.put(3, new ArrayList<String>());
		map.put(4, new ArrayList<String>());
		for(OrderUser o : list) {
			if(o.getStatus().getId() == 1) {
				map.get(1).add(o.getStatus().getStatus());
			}
			if(o.getStatus().getId() == 2) {
				map.get(2).add(o.getStatus().getStatus());
				
			}
			if(o.getStatus().getId() == 3) {
				map.get(3).add(o.getStatus().getStatus());
			}
			if(o.getStatus().getId() == 4) {
				map.get(4).add(o.getStatus().getStatus());
			}
		}
		return map;
	}

	public List<OrderUser> total() {
		List<OrderUser> list = orderRepository.findAllByStatus_Id(4);
		return list;
	}

	public List<OrderUser> searchStatust(Integer user ,Integer status) {
		List<OrderUser> list = null;
		if(status == 0) {
			list = orderRepository.findByMemberBean_userId(user);
		}else {
			
			list = orderRepository.findUserByStatus_Id(user, status);
		}
		return list;
	}

}

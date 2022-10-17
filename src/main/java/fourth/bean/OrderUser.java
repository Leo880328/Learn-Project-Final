package fourth.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

//import org.hibernate.search.mapper.pojo.mapping.definition.annotation.Indexed;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

//@Indexed
@Entity
@Table(name = "order_user")
public class OrderUser implements Serializable{
	
	
	@Id
	@Column(name = "order_id")
	private String orderId;
	
	private Date date;

	@ManyToOne
	@JoinColumn(name = "status")
	private OrderStatus status;
	
	private int totoalcount = 1;
	private double totoalprice;
	
	
//	@Transient
//	private int user_id;

	@JsonManagedReference 
	@OneToMany(mappedBy = "orderUser" ,cascade = CascadeType.ALL)
	private List<OrderItem> orderItems ;
	
	
	
	@OneToOne(cascade= {CascadeType.PERSIST, CascadeType.MERGE,
			 CascadeType.DETACH, CascadeType.REFRESH})
	@JoinColumn(name = "user_id")
	private MemberBean memberBean ;
	
	@OneToOne
	@JoinColumn(name = "discount")
	private Voucher voucher ;
	
	
	public OrderUser() {
		
	}
	
	public OrderUser(String orderId, int user_id, Date date, OrderStatus status, int totoalcount, String discount,
			double totoalprice) {
		this.orderId = orderId;
		//this.user_id = user_id;
		this.date = date;
		this.status = status;
		this.totoalcount = totoalcount;
		this.totoalprice = totoalprice;
	}
	
	public OrderUser(String account, String name, String email, String orderId, int user_id, Date date, OrderStatus status,
			int totoalcount, String discount, double totoalprice) {
	
		this.orderId = orderId;
		//this.user_id = user_id;
		this.date = date;
		this.status = status;
		this.totoalcount = totoalcount;
		this.totoalprice = totoalprice;
	}
	

	public OrderUser(String account, String name, String email, String cellphone, String orderId, int user_id,
			Date date, OrderStatus status, int totoalcount, String discount, double totoalprice) {
		
		this.orderId = orderId;
		//this.user_id = user_id;
		this.date = date;
		this.status = status;
		this.totoalcount = totoalcount;
		this.totoalprice = totoalprice;
	}
	
	
	
	public OrderUser(String account, String name, String email, String cellphone, String orderId, Date date,
			OrderStatus status, int totoalcount, String discount, double totoalprice, List<OrderItem> orderItems,
			MemberBean memberBean) {
		
		this.orderId = orderId;
		this.date = date;
		this.status = status;
		this.totoalcount = totoalcount;
		this.totoalprice = totoalprice;
		this.orderItems = orderItems;
		this.memberBean = memberBean;
	}

	

	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
//	public int getUser_id() {
//		return user_id;
//	}
//	public void setUser_id(int user_id) {
//		this.user_id = user_id;
//	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	public OrderStatus getStatus() {
		return status;
	}

	public void setStatus(OrderStatus status) {
		this.status = status;
	}

	public int getTotoalcount() {
		return totoalcount;
	}
	public void setTotoalcount(int totoalcount) {
		this.totoalcount = totoalcount;
	}
	
	public double getTotoalprice() {
		return totoalprice;
	}
	public void setTotoalprice(double totoalprice) {
		this.totoalprice = totoalprice;
	}
	

	public MemberBean getMemberBean() {
		return memberBean;
	}
	
	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}
	
	
	
	public List<OrderItem> getorderItems() {
		return orderItems;
	}

	public void setorderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;

	}

	
	
	
	public Voucher getVoucher() {
		return voucher;
	}

	public void setVoucher(Voucher voucher) {
		this.voucher = voucher;

	}

	@Override
	public String toString() {
		return "OrderUser [orderId=" + orderId  + ", date=" + date + ", status=" + status

				+ ", totoalcount=" + totoalcount + ", voucher=" + voucher + ", totoalprice=" + totoalprice + "]" + memberBean;

	}
	
	public void addorderItems(OrderItem item) {
		
		if(orderItems == null) {
			orderItems = new ArrayList<>();
		}
		
		orderItems.add(item);
	}
	
}

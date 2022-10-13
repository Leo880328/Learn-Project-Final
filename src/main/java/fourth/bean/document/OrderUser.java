package fourth.bean.document;

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

import org.springframework.data.elasticsearch.annotations.DateFormat;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import fourth.bean.MemberBean;
import fourth.bean.OrderItem;
import fourth.bean.OrderStatus;
import fourth.bean.Voucher;


@Document(indexName = "myindex")
public class OrderUser implements Serializable{
	
	
	@Id
	private String orderId;
	
	@Field(type = FieldType.Date,format = DateFormat.custom,pattern = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
	private Date date;

//	@Field(type = FieldType.Object)
//	@ManyToOne
//	@JoinColumn(name = "orderStatus")
	@Field(type = FieldType.Nested, includeInParent = true)
	private OrderStatus status;
	
//	@Field(type = FieldType.Object)
//	@ManyToOne
//	@JoinColumn(name = "status")
//	private Integer status;
	
	
	private int totoalcount = 1;
	
	private double totoalprice;
	
	
//	@OneToOne(cascade= {CascadeType.PERSIST, CascadeType.MERGE,
//	 CascadeType.DETACH, CascadeType.REFRESH})
//	@JoinColumn(name = "user_id")
//	private int user_id;

//	@JsonManagedReference 
//	@OneToMany(mappedBy = "orderUser" ,cascade = CascadeType.ALL)
	@Field(type = FieldType.Nested, includeInParent = true)
	private List<OrderItem> orderItems ;
	
	
	
//	@OneToOne(cascade= {CascadeType.PERSIST, CascadeType.MERGE,
//			 CascadeType.DETACH, CascadeType.REFRESH})
//	@JoinColumn(name = "user_id")
	@Field(type = FieldType.Nested, includeInParent = true)
	private MemberBean memberBean ;
	
//	@OneToOne
//	@JoinColumn(name = "discount")
	@Field(type = FieldType.Nested, includeInParent = true)
	private Voucher voucher ;
	
//	@OneToOne
//	@JoinColumn(name = "discount")
//	private Integer discount;
	
	public OrderUser() {
		
	}
	
	public OrderUser(String orderId, int user_id, Date date, OrderStatus orderStatus, int totoalcount, String discount,
			double totoalprice) {
		this.orderId = orderId;
		//this.user_id = user_id;
		this.date = date;
		this.status = orderStatus;
		this.totoalcount = totoalcount;
		this.totoalprice = totoalprice;
	}
	
	public OrderUser(String account, String name, String email, String orderId, int user_id, Date date, OrderStatus orderStatus,
			int totoalcount, String discount, double totoalprice) {
	
		this.orderId = orderId;
		//this.user_id = user_id;
		this.date = date;
		this.status = orderStatus;
		this.totoalcount = totoalcount;
		this.totoalprice = totoalprice;
	}
	

	public OrderUser(String account, String name, String email, String cellphone, String orderId, int user_id,
			Date date, OrderStatus orderStatus, int totoalcount, String discount, double totoalprice) {
		
		this.orderId = orderId;
		//this.user_id = user_id;
		this.date = date;
		this.status = orderStatus;
		this.totoalcount = totoalcount;
		this.totoalprice = totoalprice;
	}
	
	
	
	public OrderUser(String account, String name, String email, String cellphone, String orderId, Date date,
			OrderStatus orderStatus, int totoalcount, String discount, double totoalprice, List<OrderItem> orderItems,
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
	
	public OrderStatus getorderStatus() {
		return status;
	}

	public void status(OrderStatus orderStatus) {
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
	
	

//	public Integer getStatus() {
//		return status;
//	}
//
//	public void setStatus(Integer status) {
//		this.status = status;
//	}
//
//	public int getUser_id() {
//		return user_id;
//	}
//
//	public void setUser_id(int user_id) {
//		this.user_id = user_id;
//	}

//	public Integer getDiscount() {
//		return discount;
//	}
//
//	public void setDiscount(Integer discount) {
//		this.discount = discount;
//	}

	@Override
	public String toString() {
		return "OrderUser [orderId=" + orderId  + ", date=" + date + ", orderStatus=" + status

				+ ", totoalcount=" + totoalcount + ", voucher=" + voucher + ", totoalprice=" + totoalprice + "]" + memberBean;

	}
	
	public void addorderItems(OrderItem item) {
		
		if(orderItems == null) {
			orderItems = new ArrayList<>();
		}
		
		orderItems.add(item);
	}
	
}

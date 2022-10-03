package fourth.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "voucher")
public class Voucher implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String number;
	private double discount;
	private int status;
	
//	@OneToOne
//    private OrderUser orderUser;
	
	public Voucher() {}

	public Voucher(int id, String number, double discount, int status) {
		this.id = id;
		this.number = number;
		this.discount = discount;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public int getstatus() {
		return status;
	}

	public void setstatus(int status) {
		this.status = status;
	}

	
	
//	public OrderUser getOrderUser() {
//		return orderUser;
//	}
//
//	public void setOrderUser(OrderUser orderUser) {
//		this.orderUser = orderUser;
//	}

	@Override
	public String toString() {
		return "Voucher [id=" + id + ", number=" + number + ", discount=" + discount + ", status=" + status + "]";
	}
	
	
}

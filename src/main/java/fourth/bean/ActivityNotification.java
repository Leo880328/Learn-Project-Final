package fourth.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity @Table(name = "activity_notification")
public class ActivityNotification {
	
	private int acticitiesId;
	
	@OneToOne @JoinColumn(name="user_id")
	private MemberBean userId;
	
	private String email;
	
	private String	title;
	
	private String	content;
	
	private int state ;	
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "GMT+8")
	private Date deliveryTime;
	
	
//=======================================================================================
//=======================================================================================
//=======================================================================================
	
	public int getActicitiesId() {
		return acticitiesId;
	}

	public void setActicitiesId(int acticitiesId) {
		this.acticitiesId = acticitiesId;
	}

	public MemberBean getUserId() {
		return userId;
	}

	public void setUserId(MemberBean userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Date getDeliveryTime() {
		return deliveryTime;
	}

	public void setDeliveryTime(Date deliveryTime) {
		this.deliveryTime = deliveryTime;
	}
	
	
}

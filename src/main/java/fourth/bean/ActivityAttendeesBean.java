package fourth.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "activity_attendees")
@IdClass(ActivityAttendeesId.class)
@Component
public class ActivityAttendeesBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	
	public static final int statusCode_default = 0;
	public static final int statusCode_False = 1;
	public static final int statusCode_True = 2;
	
	@Id
	@OneToOne
	@JoinColumn(name = "activity_id")
	private ActivityBean activity;

	@Id
	private int userId;
	
	@Column(name = "request_time")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "GMT+8")
	private Date requestTime;
	
	private int statusCode;

	// =======================================================================================
	// =======================================================================================
	// =======================================================================================

	public ActivityBean getActivity() {
		return activity;
	}

	public void setActivity(ActivityBean activity) {
		this.activity = activity;
	}


	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getRequestTime() {
		return requestTime;
	}

	public void setRequestTime(Date requestTime) {
		requestTime = requestTime;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

}

package fourth.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "activity_review")
@Component
public class ActivityReviewBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	public static final int STATUS_REVIEW_FAIL=-1;
	public static final int STATUS_REVIEW_ING= 0;
	public static final int STATUS_REVIEW_SUCCESSFUL=1;
	
	
	public ActivityReviewBean() {
		
	}

	

	public ActivityReviewBean(int activityId , String illustrate, int statusCode) {
		super();
		this.activityId = activityId;
		this.message = illustrate;
		this.statusCode = statusCode;
	}



	@Id @Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "activity_id")
	private int activityId;
	
	@Column(name = "message")
	private String message;
	
	@Column(name = "status_code")
	private int statusCode;
	
	@Column(name = "request_time")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "GMT+8")
	private Date RequestTime;


	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public int getActivityId() {
		return activityId;
	}



	public void setActivityId(int activityId) {
		this.activityId = activityId;
	}



	public String getMessage() {
		return message;
	}



	public void setMessage(String message) {
		this.message = message;
	}



	public int getStatusCode() {
		return statusCode;
	}



	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}



	public Date getRequestTime() {
		return RequestTime;
	}



	public void setRequestTime(Date requestTime) {
		RequestTime = requestTime;
	}


	
	
	
	
}

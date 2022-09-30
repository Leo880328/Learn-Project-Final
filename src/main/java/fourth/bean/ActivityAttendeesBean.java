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
	
	
	public static final int statusCode_True = 1;
	public static final int statusCode_default = 0;
	public static final int statusCode_False = -1;
	
	@Id
	@OneToOne
	@JoinColumn(name = "id")
	private ActivityBean activity;

	@Id
	@OneToOne
	@JoinColumn(name = "user_id")
	private MemberBean user;
	
	@Column(name = "request_time")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "GMT+8")
	private Date RequestTime;
	
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

	public MemberBean getUser() {
		return user;
	}

	public void setUser(MemberBean user) {
		this.user = user;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

}

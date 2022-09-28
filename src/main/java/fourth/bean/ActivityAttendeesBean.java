package fourth.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.springframework.stereotype.Component;

@Entity
@Table(name = "activity_attendees")
@Component
public class ActivityAttendeesBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	public static final int statusCode_True = 1;
	public static final int statusCode_False = -1;
	
	@Id
	@OneToOne
	@JoinColumn(name = "id")
	private ActivityBean activity;

	@Id
	@OneToOne
	@JoinColumn(name = "user_id")
	private MemberBean user;
	
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

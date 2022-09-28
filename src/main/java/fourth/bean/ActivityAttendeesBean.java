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

	@Id
	private int activityId;

	@Id
	@OneToOne
	@JoinColumn(name = "user_id")
	private MemberBean userId;

	// =======================================================================================
	// =======================================================================================
	// =======================================================================================

	public int getActivityId() {
		return activityId;
	}

	public void setActivityId(int activityId) {
		this.activityId = activityId;
	}

	public MemberBean getUserId() {
		return userId;
	}

	public void setUserId(MemberBean userId) {
		this.userId = userId;
	}

}

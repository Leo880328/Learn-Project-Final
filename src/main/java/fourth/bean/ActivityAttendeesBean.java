package fourth.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.springframework.stereotype.Component;

@Entity @Table(name = "activity_attendees")
@Component
public class ActivityAttendeesBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int acticitiesId;
	
	@OneToOne @JoinColumn(name="user_id")
	private MemberBean userId;

}

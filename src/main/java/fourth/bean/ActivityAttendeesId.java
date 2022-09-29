package fourth.bean;

import java.io.Serializable;

public class ActivityAttendeesId implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private int activity;
	private int user;
	public int getActivity() {
		return activity;
	}
	public void setActivity(int activity) {
		this.activity = activity;
	}
	public int getUser() {
		return user;
	}
	public void setUser(int user) {
		this.user = user;
	}
	
	
	
	
	
}

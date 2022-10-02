package fourth.bean;

import java.io.Serializable;

public class ActivityAttendeesId implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private int activity;
	
	private int userId;

	
	public int getActivity() {
		return activity;
	}

	public void setActivity(int activity) {
		this.activity = activity;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
}

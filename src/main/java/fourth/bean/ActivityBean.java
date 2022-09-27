package fourth.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "acticities")
@Component
public class ActivityBean {
//	[id] [int] IDENTITY(100000,1) Primary key,
	@Id @Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@OneToOne @JoinColumn(name="user_id")
	private MemberBean userId;
	
	private String title;
	
	private String previewImage;
	
	private String content;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "GMT+8")
	private Date startTime;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "GMT+8")
	private Date endTime;
	//人數限制
	private int participantLimit;
	//googleMap API
	private int LocationLongitude;
	
	private int LocationLatitude;

	private int ApprovalStatus;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public MemberBean getUserId() {
		return userId;
	}
	public void setUserId(MemberBean userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPreviewImage() {
		return previewImage;
	}
	public void setPreviewImage(String previewImage) {
		this.previewImage = previewImage;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public int getParticipantLimit() {
		return participantLimit;
	}
	public void setParticipantLimit(int participantLimit) {
		this.participantLimit = participantLimit;
	}
	public int getLocationLongitude() {
		return LocationLongitude;
	}
	public void setLocationLongitude(int locationLongitude) {
		LocationLongitude = locationLongitude;
	}
	public int getLocationLatitude() {
		return LocationLatitude;
	}
	public void setLocationLatitude(int locationLatitude) {
		LocationLatitude = locationLatitude;
	}
	public int getApprovalStatus() {
		return ApprovalStatus;
	}
	public void setApprovalStatus(int approvalStatus) {
		ApprovalStatus = approvalStatus;
	}
	@Override
	public String toString() {
		return "ActivityBean [id=" + id + ", userId=" + userId + ", title=" + title + ", previewImage=" + previewImage
				+ ", content=" + content + ", startTime=" + startTime + ", endTime=" + endTime + ", participantLimit="
				+ participantLimit + ", LocationLongitude=" + LocationLongitude + ", LocationLatitude="
				+ LocationLatitude + ", ApprovalStatus=" + ApprovalStatus + "]";
	}
	
	
}

package fourth.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "acticities")
@Component
@SpringBootApplication
public class ActivityBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	
	public static final int STATUS_UNFINISHED= 0;
	public static final int STATUS_NON_PUBLICISE= 1;
	public static final int STATUS_FINISHED= 2;
	public static final int STATUS_PUBLIC= 3;
	
	
	@Id @Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int userId;
	//活動標題
	private String title;
	//活動圖片
	private String previewImage;
	//活動內容
	private String content;
	//人數限制
	private int participantLimit;
	//google map 經度
	private int LocationLongitude;
	//google map 緯度
	private int LocationLatitude;
	//狀態碼
	private int statusCode;
	//活動開始時間
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "GMT+8")
	private Date startTime;
	//活動結束時間
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "GMT+8")
	private Date endTime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
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

	@Override
	public String toString() {
		return "ActivityBean [id=" + id + ", title=" + title + ", previewImage=" + previewImage + ", content=" + content
				+ ", participantLimit=" + participantLimit + ", LocationLongitude=" + LocationLongitude
				+ ", LocationLatitude=" + LocationLatitude + ", statusCode=" + statusCode + ", userId=" + userId
				+ ", startTime=" + startTime + ", endTime=" + endTime + "]";
	}




}

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

	public static final int STATUS_REVIEW_ING = 0;
	public static final int STATUS_REVIEW_FAIL = 1;
	public static final int STATUS_NON_PUBLIC = 2;
	public static final int STATUS_PUBLIC = 3;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Integer userId;
	// 活動標題
	private String title;
	// 活動預覽圖片
	private String previewImage;
	// 活動圖片
	private String activityImage;
	// 活動內容
	private String content;
	// 狀態碼
	private Integer statusCode;
	// 活動開始時間
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm", timezone = "GMT+8")
	private Date startTime;
	// 活動結束時間
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm", timezone = "GMT+8")
	private Date endTime;
	// 人數限制
	private Integer numberLimit;
	// 活動地區
	private String place;
	// 活動詳細地址
	private String address;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
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
	public String getActivityImage() {
		return activityImage;
	}
	public void setActivityImage(String activityImage) {
		this.activityImage = activityImage;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(Integer statusCode) {
		this.statusCode = statusCode;
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
	public Integer getNumberLimit() {
		return numberLimit;
	}
	public void setNumberLimit(Integer numberLimit) {
		this.numberLimit = numberLimit;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	

}

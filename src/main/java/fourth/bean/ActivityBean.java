package fourth.bean;

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
@Table(name = "activitys")
@Component
public class ActivityBean {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "content")
	private String content;
	
	@Column(name = "start_time")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date start_time;
	
	@Column(name = "end_time") 
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date end_time;
	
	@Column(name = "imgpath")
	private String imgPath;

	public ActivityBean() {

	}



	public Integer getId() {
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public Date getStart_time() {
		return start_time;
	}



	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}



	public Date getEnd_time() {
		return end_time;
	}



	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}



	public String getImgPath() {
		return imgPath;
	}



	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}



	@Override
	public String toString() {
		return "ActivityBean [id=" + id + ", title=" + title + ", content=" + content + ", start_time=" + start_time
				+ ", end_time=" + end_time + ", imgPath=" + imgPath + "]";
	}

}

package fourth.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "COURSECOMMENTS")
@Component
public class CourseComments {
	
	@Id 
	@Column(name = "COMMENTSID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer commentsId;
	
//	@Column(name = "RATE")
//	private Integer rate;
	
	@Column(name = "COMMENTS")
	private String comments;
	
	@Column(name = "COMMENTSDATE")
	private String commentsDate;
	
	@JsonBackReference
    @ManyToOne
    @JoinColumn(name = "USERID")
    private MemberBean memberBean;
    
    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "COURSEID")
    private CourseBean courseBean;
	

	public CourseComments() {
	}


	public CourseComments(Integer commentsId, String comments, String commentsDate, MemberBean memberBean,
			CourseBean courseBean) {
		super();
		this.commentsId = commentsId;
		this.comments = comments;
		this.commentsDate = commentsDate;
		this.memberBean = memberBean;
		this.courseBean = courseBean;
	}


	public Integer getCommentsId() {
		return commentsId;
	}


	public void setCommentsId(Integer commentsId) {
		this.commentsId = commentsId;
	}


	public String getComments() {
		return comments;
	}


	public void setComments(String comments) {
		this.comments = comments;
	}


	public String getCommentsDate() {
		return commentsDate;
	}


	public void setCommentsDate(String commentsDate) {
		this.commentsDate = commentsDate;
	}


	public MemberBean getMemberBean() {
		return memberBean;
	}


	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}


	public CourseBean getCourseBean() {
		return courseBean;
	}


	public void setCourseBean(CourseBean courseBean) {
		this.courseBean = courseBean;
	}


	@Override
	public String toString() {
		return "CourseComments [commentsId=" + commentsId + ", comments=" + comments + ", commentsDate=" + commentsDate
				+ ", memberBean=" + memberBean + ", courseBean=" + courseBean + "]";
	}


	
}

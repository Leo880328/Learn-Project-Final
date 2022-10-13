package fourth.bean;

import java.util.Date;
import java.util.List;

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
import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "coursecollect")
@Component
public class CourseCollect {
	
	@Id
	@Column(name="ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
//	@Column(name = "USERID")
//	private Integer userId;
//	
//	@Column(name = "COURSEID")
//	private Integer courseId;
	

//    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
//    @Column(name = "COURSEDATE")
//    private Date courseDate;
	
	@JsonBackReference
    @ManyToOne
    @JoinColumn(name = "USERID")
    private MemberBean memberBeans;
    
    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "COURSEID")
    private CourseBean courseBeans;
    
    @Column(name = "COURSENAME")
    private String collectName;
    
    
    @Column(name = "COLLECTSTATUS")
    private String collectStatus;
    

	public CourseCollect() {
	}


	public CourseCollect(Integer id, MemberBean memberBeans, CourseBean courseBeans, String collectName,
			String collectStatus) {
		super();
		this.id = id;
		this.memberBeans = memberBeans;
		this.courseBeans = courseBeans;
		this.collectName = collectName;
		this.collectStatus = collectStatus;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public MemberBean getMemberBeans() {
		return memberBeans;
	}


	public void setMemberBeans(MemberBean memberBeans) {
		this.memberBeans = memberBeans;
	}


	public CourseBean getCourseBeans() {
		return courseBeans;
	}


	public void setCourseBeans(CourseBean courseBeans) {
		this.courseBeans = courseBeans;
	}


	public String getCollectName() {
		return collectName;
	}


	public void setCollectName(String collectName) {
		this.collectName = collectName;
	}


	public String getCollectStatus() {
		return collectStatus;
	}


	public void setCollectStatus(String collectStatus) {
		this.collectStatus = collectStatus;
	}


	@Override
	public String toString() {
		return "CourseCollect [id=" + id + ", memberBeans=" + memberBeans + ", courseBeans=" + courseBeans
				+ ", collectName=" + collectName + ", collectStatus=" + collectStatus + "]";
	}
	
	



//	public CourseCollect(Integer id, MemberBean memberBeans, CourseBean courseBeans, String collectName) {
//		super();
//		this.id = id;
//		this.memberBeans = memberBeans;
//		this.courseBeans = courseBeans;
//		this.collectName = collectName;
//	}
//
//
//
//	public Integer getId() {
//		return id;
//	}
//
//
//
//	public void setId(Integer id) {
//		this.id = id;
//	}
//
//
//
//	public MemberBean getMemberBeans() {
//		return memberBeans;
//	}
//
//
//
//	public void setMemberBeans(MemberBean memberBeans) {
//		this.memberBeans = memberBeans;
//	}
//
//
//
//	public CourseBean getCourseBeans() {
//		return courseBeans;
//	}
//
//
//
//	public void setCourseBeans(CourseBean courseBeans) {
//		this.courseBeans = courseBeans;
//	}
//
//
//
//	public String getCollectName() {
//		return collectName;
//	}
//
//
//
//	public void setCollectName(String collectName) {
//		this.collectName = collectName;
//	}
//
//
//
//	@Override
//	public String toString() {
//		return "CourseCollect [id=" + id + ", memberBeans=" + memberBeans + ", courseBeans=" + courseBeans
//				+ ", collectName=" + collectName + "]";
//	}
//	
	

	
	

}

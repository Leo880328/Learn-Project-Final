package fourth.bean;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="course_subject")
@Component
public class CourseSub {
	
	@Id
	@Column(name="subject_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer subject_id;
	
	@Column(name="subject_name")
	private String subject_name;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "coursesub")
	private List<CourseBean> courseBeans;

	public CourseSub() {
	}

	public CourseSub(Integer subject_id, String subject_name, List<CourseBean> courseBeans) {
		super();
		this.subject_id = subject_id;
		this.subject_name = subject_name;
		this.courseBeans = courseBeans;
	}

	public Integer getSubject_id() {
		return subject_id;
	}

	public void setSubject_id(Integer subject_id) {
		this.subject_id = subject_id;
	}

	public String getSubject_name() {
		return subject_name;
	}

	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}

	public List<CourseBean> getCourseBeans() {
		return courseBeans;
	}

	public void setCourseBeans(List<CourseBean> courseBeans) {
		this.courseBeans = courseBeans;
	}

	@Override
	public String toString() {
		return "CourseSub [subject_id=" + subject_id + ", subject_name=" + subject_name + ", courseBeans=" + courseBeans
				+ "]";
	}

	
}

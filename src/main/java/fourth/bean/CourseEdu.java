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
@Table(name="course_Education")
@Component
public class CourseEdu {
	
	@Id
	@Column(name="education_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer education_id;
	
	@Column(name = "educationlevel")
	private String educationlevel;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "courseedu")
	private List<CourseBean> courseBeans;

	public CourseEdu() {
	}

	public CourseEdu(Integer education_id, String educationlevel, List<CourseBean> courseBeans) {
		super();
		this.education_id = education_id;
		this.educationlevel = educationlevel;
		this.courseBeans = courseBeans;
	}

	public Integer getEducation_id() {
		return education_id;
	}

	public void setEducation_id(Integer education_id) {
		this.education_id = education_id;
	}

	public String getEducationlevel() {
		return educationlevel;
	}

	public void setEducationlevel(String educationlevel) {
		this.educationlevel = educationlevel;
	}

	public List<CourseBean> getCourseBeans() {
		return courseBeans;
	}

	public void setCourseBeans(List<CourseBean> courseBeans) {
		this.courseBeans = courseBeans;
	}

	@Override
	public String toString() {
		return "CourseEdu [education_id=" + education_id + ", educationlevel=" + educationlevel + ", courseBeans="
				+ courseBeans + "]";
	}

	

}

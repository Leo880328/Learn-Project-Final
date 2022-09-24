package fourth.bean;

import java.io.Serializable;
import java.util.*;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Entity
@Table(name="examination")
@Component
public class ExamBean implements Serializable
{		

	@Id
	@Column(name = "EXAMID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer examID;
	
	@ManyToOne
	@JoinColumn(name="SUBJECTNAME")
    private ExamSubBean subject;
	
	@ManyToOne
	@JoinColumn(name="EDUCATIONLEVEL")
    private ExamEduBean education;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "exam")
    private  List<ExamTest> examTests = new ArrayList<ExamTest>() ;
	
	@Column(name = "EXAMNAME")
    private String examName;

	@Column(name = "EXAMDATE")	
    private Date examdate;
	
	@Column(name = "EXAMPIC")	
	private String examPic;
	

	public ExamBean() {
		super();
	}

	public ExamBean(ExamSubBean subject, ExamEduBean education, String examName, Date examdate, String examPic) {
		super();
		this.subject = subject;
		this.education = education;
		this.examName = examName;
		this.examdate = examdate;
		this.examPic = examPic;
	}

	public ExamBean(Integer examID, ExamSubBean subject, ExamEduBean education, String examName, Date examdate,
			String examPic) {
		super();
		this.examID = examID;
		this.subject = subject;
		this.education = education;
		this.examName = examName;
		this.examdate = examdate;
		this.examPic = examPic;
	}

	@Override
	public String toString() {
		return "ExamBean [examID=" + examID + ", subject=" + subject + ", education=" + education + ", examName="
				+ examName + ", examdate=" + examdate + ", examPic=" + examPic + "]";
	}

	public Integer getExamID() {
		return examID;
	}

	public void setExamID(Integer examID) {
		this.examID = examID;
	}

	public ExamSubBean getSubject() {
		return subject;
	}

	public void setSubject(ExamSubBean subject) {
		this.subject = subject;
	}

	public ExamEduBean getEducation() {
		return education;
	}

	public void setEducation(ExamEduBean education) {
		this.education = education;
	}

	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

	public Date getExamdate() {
		return examdate;
	}

	public void setExamdate(Date examdate) {
		this.examdate = examdate;
	}

	public String getExamPic() {
		return examPic;
	}

	public void setExamPic(String examPic) {
		this.examPic = examPic;
	}

	public List<ExamTest> getExamTests() {
		return examTests;
	}

	public void setExamTests(List<ExamTest> examTests) {
		this.examTests = examTests;
	}
	
  

}
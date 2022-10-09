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
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;


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
	
	@Column(name = "EXAMNAME")
    private String examName;

	@Column(name = "EXAMDATE")	
    private Date examdate;
	
	@Transient
	private String stringDate;
	
	@Column(name = "EXAMPIC")	
	private String examPic;
	
	@ManyToOne
	@JoinColumn(name="MEMBERID")
    private MemberBean member;
	
	@Column(name = "DIFFICULTY")	
	private String difficulty;
	
	@Column(name = "EXAMSTATUS")	
	private Integer examStatus;
	
	@Column(name = "TESTNUMBER")	
	private Integer testNumber;

	@Column(name = "AVGSCORE")	
	private Integer avgScore;
	
	
	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "exam")
    private  List<ExamTest> examTests = new ArrayList<ExamTest>() ;
	
	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "exam")
    private  List<ExamQuesBean> examQueses = new ArrayList<ExamQuesBean>() ;
	
	
	public ExamBean() {
		super();
	}
	


	public ExamBean(ExamSubBean subject, ExamEduBean education, String examName,Date examdate, String examPic, 
			MemberBean member, String difficulty,Integer testNumber, Integer avgScore,Integer examStatus) {
		super();
		this.subject = subject;
		this.education = education;
		this.examName = examName;
		this.examdate = examdate;
		this.examPic = examPic;
		this.member = member;
		this.difficulty = difficulty;
		this.testNumber = testNumber;
		this.avgScore = avgScore;
		this.examStatus = examStatus;
	}



	public ExamBean(Integer examID, ExamSubBean subject, ExamEduBean education, String examName, Date examdate,
			String examPic, MemberBean member, String difficulty,Integer testNumber, Integer avgScore
			,Integer examStatus) {
		
		super();
		this.examID = examID;
		this.subject = subject;
		this.education = education;
		this.examName = examName;
		this.examdate = examdate;
		this.examPic = examPic;
		this.member = member;
		this.difficulty = difficulty;
		this.testNumber = testNumber;
		this.avgScore = avgScore;
		this.examStatus = examStatus;
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

	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}

	

	public String getDifficulty() {
		return difficulty;
	}



	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}




	public Integer getExamStatus() {
		return examStatus;
	}




	public void setExamStatus(Integer examStatus) {
		this.examStatus = examStatus;
	}




	public Integer getTestNumber() {
		return testNumber;
	}




	public void setTestNumber(Integer testNumber) {
		this.testNumber = testNumber;
	}




	public Integer getAvgScore() {
		return avgScore;
	}




	public void setAvgScore(Integer avgScore) {
		this.avgScore = avgScore;
	}




	public List<ExamQuesBean> getExamQueses() {
		return examQueses;
	}




	public void setExamQueses(List<ExamQuesBean> examQueses) {
		this.examQueses = examQueses;
	}




	public String getStringDate() {
		return stringDate;
	}




	public void setStringDate(String stringDate) {
		this.stringDate = stringDate;
	}







	

}
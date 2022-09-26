package fourth.bean;

import java.io.Serializable;
import java.security.KeyStore.PrivateKeyEntry;
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
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Entity
@Table(name="exammemrecord")
@Component
public class ExamRecord implements Serializable
{		

	@Id
	@Column(name = "EXAMMEMRECORDID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer examMemRecordId;
	
	@ManyToOne
	@JoinColumn(name="MEMBERID")
    private MemberBean member;
	
	@ManyToOne
	@JoinColumn(name="EXAMTESTID")
    private ExamTest examTest;
	
	@JoinColumn(name="EXAMSCORE")
	private int examscore;
	
	@JoinColumn(name="TESTDATE")
	private Date testdate;
	
	@Column(name = "EXAMNAME")
	private String examName;
	
	
	@Override
	public String toString() {
		return "ExamRecord [examMemRecordId=" + examMemRecordId + ", member=" + member + ", examTest=" + examTest
				+ ", examscore=" + examscore + ", testdate=" + testdate + ", examName=" + examName + "]";
	}



	public ExamRecord() {
		super();
	}



	public ExamRecord(MemberBean member, ExamTest examTest, int examScore, Date testDate) {
		super();
		this.member = member;
		this.examTest = examTest;
		this.examscore = examScore;
		this.testdate = testDate;
	}

	public ExamRecord(Integer examMemRecordId, MemberBean member, ExamTest examTest, int examScore, Date testDate) {
		super();
		this.examMemRecordId = examMemRecordId;
		this.member = member;
		this.examTest = examTest;
		this.examscore = examScore;
		this.testdate = testDate;
	}

	
	

	public ExamRecord(MemberBean member, ExamTest examTest, int examscore, Date testdate, String examName) {
		super();
		this.examMemRecordId = examMemRecordId;
		this.member = member;
		this.examTest = examTest;
		this.examscore = examscore;
		this.testdate = testdate;
		this.examName = examName;
	}



	public Integer getExamMemRecordId() {
		return examMemRecordId;
	}



	public void setExamMemRecordId(Integer examMemRecordId) {
		this.examMemRecordId = examMemRecordId;
	}



	public MemberBean getMember() {
		return member;
	}



	public void setMember(MemberBean member) {
		this.member = member;
	}



	public ExamTest getExamTest() {
		return examTest;
	}



	public void setExamTest(ExamTest examTest) {
		this.examTest = examTest;
	}



	public int getExamscore() {
		return examscore;
	}



	public void setExamscore(int examscore) {
		this.examscore = examscore;
	}



	public Date getTestdate() {
		return testdate;
	}



	public void setTestdate(Date testdate) {
		this.testdate = testdate;
	}



	public String getExamName() {
		return examName;
	}



	public void setExamName(String examName) {
		this.examName = examName;
	}
	
	
	
	
	
}
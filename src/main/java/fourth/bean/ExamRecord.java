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
	
	@Override
	public String toString() {
		return "ExamRecord [examMemRecordId=" + examMemRecordId + ", member=" + member + ", examTest=" + examTest
				+ ", examScore=" + examscore + ", testDate=" + testdate + "]";
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

	public int getExamScore() {
		return examscore;
	}

	public void setExamScore(int examScore) {
		this.examscore = examScore;
	}

	public Date getTestDate() {
		return testdate;
	}

	public void setTestDate(Date testDate) {
		this.testdate = testDate;
	}
	
}
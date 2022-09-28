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
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Entity
@Table(name="examtestdetail")
@Component
public class ExamTestDetail implements Serializable
{		

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "EXAMTESTDETAILID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer examTestDetailId;
	
	@OneToOne
	@JoinColumn(name="EXAMTESTID")
	private ExamTest examTest;
	
	@ManyToOne
	@JoinColumn(name="QUESId")
    private ExamQuesBean examQues;
	
	
	
	@Override
	public String toString() {
		return "ExamTestDetail [examTestDetailId=" + examTestDetailId + ", examTest=" + examTest + ", examQues="
				+ examQues + "]";
	}
	
	
	public ExamTestDetail() {
		super();
	}

	public ExamTestDetail(ExamTest examTest, ExamQuesBean examQues) {
		super();
		this.examTest = examTest;
		this.examQues = examQues;
	}

	public ExamTestDetail(Integer examTestDetailId, ExamTest examTest, ExamQuesBean examQues) {
		super();
		this.examTestDetailId = examTestDetailId;
		this.examTest = examTest;
		this.examQues = examQues;
	}

	public Integer getExamTestDetailId() {
		return examTestDetailId;
	}

	public void setExamTestDetailId(Integer examTestDetailId) {
		this.examTestDetailId = examTestDetailId;
	}

	public ExamTest getExamTest() {
		return examTest;
	}

	public void setExamTest(ExamTest examTest) {
		this.examTest = examTest;
	}

	public ExamQuesBean getExamQues() {
		return examQues;
	}

	public void setExamQues(ExamQuesBean examQues) {
		this.examQues = examQues;
	}


	
	
}
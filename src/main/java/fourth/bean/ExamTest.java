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
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;


@Entity
@Table(name="examtest")
@Component
public class ExamTest implements Serializable
{		

	@Id
	@Column(name = "EXAMTESTID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer examTestId;
	
	@JsonBackReference
	@ManyToOne
	@JoinColumn(name="EXAMID")
    private ExamBean exam;
	
	@Override
	public String toString() {
		return "ExamTest [examTestId=" + examTestId + ", exam=" + exam + "]";
	}
	
	
	
	public ExamTest() {
		super();
	}



	public ExamTest(Integer examTestId, ExamBean exam) {
		super();
		this.examTestId = examTestId;
		this.exam = exam;
	}

	public ExamTest(ExamBean exam) {
		super();
		this.exam = exam;
	}

	public Integer getExamTestId() {
		return examTestId;
	}

	public void setExamTestId(Integer examTestId) {
		this.examTestId = examTestId;
	}

	public ExamBean getExam() {
		return exam;
	}

	public void setExam(ExamBean exam) {
		this.exam = exam;
	}
	
	
	
	
	


  

}
package fourth.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="examreserve")
@Component
public class ExamReserve implements Serializable
{	
	@Id
	@Column(name="EXAMRESERVEID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)		
	private Integer examReserveID;
	
	@ManyToOne
	@JoinColumn(name="QUESID")
    private ExamQuesBean examQues;
	
	@ManyToOne
	@JoinColumn(name="MEMBERID")
    private MemberBean member;
	
	@Column(name="MARKER")
	private Integer marker;
	
	@Override
	public String toString() {
		return "ExamReserve [examReserveID=" + examReserveID + ", examQues=" + examQues + ", member=" + member
				+ ", marker=" + marker + "]";
	}

	public ExamReserve(ExamQuesBean examQues, MemberBean member, Integer marker) {
		super();
		this.examQues = examQues;
		this.member = member;
		this.marker = marker;
	}

	public ExamReserve(Integer examReserveID, ExamQuesBean examQues, MemberBean member, Integer marker) {
		super();
		this.examReserveID = examReserveID;
		this.examQues = examQues;
		this.member = member;
		this.marker = marker;
	}

	public Integer getExamReserveID() {
		return examReserveID;
	}

	public void setExamReserveID(Integer examReserveID) {
		this.examReserveID = examReserveID;
	}

	public ExamQuesBean getExamQues() {
		return examQues;
	}

	public void setExamQues(ExamQuesBean examQues) {
		this.examQues = examQues;
	}

	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}

	public Integer getMarker() {
		return marker;
	}

	public void setMarker(Integer marker) {
		this.marker = marker;
	}
	
	
	
	
}

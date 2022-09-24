package fourth.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import fourth.bean.ExamBean;
import fourth.bean.ExamReserve;

public interface ExamReserveRepository extends JpaRepository<ExamReserve, Integer> {
	
//	public List<ExamReserve> findBySubject_subjectNameAndEducation_educationName(String subName,String eduName);
	
	public List<ExamReserve> findByexamQues_quesID(Integer examQuesId);
}

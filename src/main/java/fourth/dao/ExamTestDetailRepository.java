package fourth.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import fourth.bean.ExamQuesBean;
import fourth.bean.ExamTest;
import fourth.bean.ExamTestDetail;

public interface ExamTestDetailRepository extends JpaRepository<ExamTestDetail, Integer> {
	
//	public List<ExamTestDetail> findBySubject_subjectNameAndEducation_educationName(String subName,String eduName);
	public List<ExamTestDetail> findByExamTest(ExamTest ExamTestId);
}

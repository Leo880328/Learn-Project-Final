package fourth.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import fourth.bean.ExamQuesBean;

public interface ExamQuesRepository extends JpaRepository<ExamQuesBean, Integer> {
	
	public List<ExamQuesBean> findBySubject_subjectNameAndEducation_educationName(String subName,String eduName);
	
//	@Query(value="SELECT TOP 5 * FROM Question where subjectname = :subIdx and educationlevel = :eduIdx ORDER BY NEWID()",nativeQuery=true)
//	
//	public List<ExamQuesBean> findRanQues(@Param("subIdx") Integer subIdx,@Param("eduIdx") Integer eduIdx);
	
	
	public List<ExamQuesBean> findByExam_ExamID(Integer examId);
	

	

}

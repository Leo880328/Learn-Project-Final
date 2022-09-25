package fourth.dao;

import java.util.List;

import javax.security.auth.Subject;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import fourth.bean.CartItem;
import fourth.bean.ExamBean;
import fourth.bean.ExamEduBean;
import fourth.bean.ExamSubBean;

public interface ExamRepository extends JpaRepository<ExamBean, Integer> {
	
//	public List<ExamBean> findBySubject_subjectId(Integer subjectId);
		
//	public List<ExamBean> findBySubject_subjectIdAndEducation_educationId(Integer subjectId,Integer educationId);
	public List<ExamBean> findBySubject_subjectNameAndEducation_educationName(String subName,String eduName);
	

}

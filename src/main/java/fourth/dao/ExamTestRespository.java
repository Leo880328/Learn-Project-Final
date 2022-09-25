package fourth.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import fourth.bean.ExamTest;
import fourth.bean.ExamQuesBean;

public interface ExamTestRespository extends JpaRepository<ExamTest, Integer> {
	
//	@Query(value="select max(testnum) from examcontent",nativeQuery=true)
//	public Integer findMaxTestNum ();
	
}

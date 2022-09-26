package fourth.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import fourth.bean.ExamBean;
import fourth.bean.ExamRecord;

public interface ExamMemRecordRepository extends JpaRepository<ExamRecord, Integer> {
	
	public List<ExamRecord> findByMember_userId(Integer userId);
	
}

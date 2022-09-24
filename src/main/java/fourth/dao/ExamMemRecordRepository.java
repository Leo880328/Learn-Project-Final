package fourth.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import fourth.bean.ExamRecord;

public interface ExamMemRecordRepository extends JpaRepository<ExamRecord, Integer> {
	
}

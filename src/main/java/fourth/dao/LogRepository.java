package fourth.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import fourth.bean.Log;

public interface LogRepository extends JpaRepository<Log, String> {
	public List<Log> findAllByOrderByOperateDateDesc();
}

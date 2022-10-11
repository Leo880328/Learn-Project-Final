package fourth.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import fourth.bean.Log;

public interface LogRepository extends JpaRepository<Log, String> {

}

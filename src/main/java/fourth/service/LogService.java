package fourth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fourth.bean.Log;
import fourth.dao.LogRepository;

@Service
@Transactional
public class LogService {
	
	@Autowired
	private LogRepository logRepository;
	
	public void saveLog(Log log) {
		System.out.println(log);
		logRepository.save(log);
	}

	public List<Log> findAll() {
		List<Log> logList = logRepository.findAll();
		return logList;
	}
}

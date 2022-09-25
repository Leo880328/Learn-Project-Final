package fourth.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import fourth.bean.ColumnBean;

public interface ColumnRepository extends JpaRepository<ColumnBean, Integer> {
	@Query(value="from ColumnBean where subject like concat('%',?1,'%')")
	public List<ColumnBean> findByEnglish(String subject);
}

package fourth.dao;


import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import fourth.bean.CourseBean;

public interface CourseRepository extends JpaRepository<CourseBean, Integer> {


	
	@Query(value = "from CourseBean where course_name like concat('%',?1,'%') ")
	public List<CourseBean> findByNameLike(String course_name);


}

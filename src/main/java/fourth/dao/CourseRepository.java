package fourth.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import fourth.bean.CourseBean;

public interface CourseRepository extends JpaRepository<CourseBean, Integer> {
	
	@Query(value = "from CourseBean where course_name like concat('%',?1,'%') ")
	public List<CourseBean> findByNameLike(String course_name);
	
	@Query(value = "from CourseBean where education_id like concat('%',?1,'%') ")
	public List<CourseBean> findByEduIdLike(String education_id);
	
	@Query(value = "from CourseBean where subject_id like concat('%',?1,'%') ")
	public List<CourseBean> findBySubIdLike(String subject_id);
	
	@Query(value = "from CourseBean where lecturer_name like concat('%',?1,'%') ")
	public List<CourseBean> findByLecturerName(String lecturer_name);
	
	

}

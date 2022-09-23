package fourth.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import fourth.bean.CourseBean;

public interface CourseRepository extends JpaRepository<CourseBean, Integer> {

}

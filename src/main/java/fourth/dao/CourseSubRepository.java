package fourth.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import fourth.bean.CourseSub;

public interface CourseSubRepository extends JpaRepository<CourseSub, Integer> {


}

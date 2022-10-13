package fourth.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import fourth.bean.CourseComments;

public interface CourseCommentsRepository extends JpaRepository<CourseComments, Integer> {
	
//	@Query(value = "select * from coursecomments where courseId = :courseId" ,nativeQuery = true)
	public List<CourseComments> findCourseCommentsByCourseBean_CourseId(int courseId);

}

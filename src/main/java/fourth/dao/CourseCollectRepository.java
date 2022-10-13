package fourth.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import fourth.bean.CourseCollect;

public interface CourseCollectRepository extends JpaRepository<CourseCollect, Integer> {
	

	public void deleteByMemberBeans_UserId(Integer userId);
	
	
	public List<CourseCollect> findByMemberBeans_UserId(Integer userId);
	
	@Query(value = "select count(*) as Collect from coursecollect where userId = :userId and courseId = :courseId" ,nativeQuery = true)
	public int haveCollect(@Param("userId") int userId,@Param("courseId") int courseId);
	
//	@Query(value = "delete from coursecollect where memberBeans.userId = ?1 and courseBeans.courseId = ?2" )
	public void deleteByMemberBeans_UserIdAndCourseBeans_CourseId( int userId,int courseId); 
//	
//	@Query(value = "delete from coursecollect where memberBeans.userId = :userId and courseBeans.courseId = :courseId" ,nativeQuery = true)
//	public void deleteByUserIdAndCourseId(@Param("userId") int userId,@Param("courseId") int courseId); 
//	

}

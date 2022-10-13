package fourth.service;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fourth.bean.CartItem;
import fourth.bean.CourseBean;
import fourth.bean.CourseCollect;
import fourth.bean.CourseComments;
import fourth.bean.CourseEdu;
import fourth.bean.CourseSub;
import fourth.bean.MemberBean;
import fourth.bean.OrderUser;
import fourth.dao.CourseCollectRepository;
import fourth.dao.CourseCommentsRepository;
import fourth.dao.CourseEduRepository;
import fourth.dao.CourseRepository;
import fourth.dao.CourseSubRepository;
import fourth.dao.MemberRepository;
import fourth.util.WebUtils;
import fourth.coursemail.JavaMail;

@Service
@Transactional
public class CourseService {

	@Autowired
	private CourseRepository cosRep;

	@Autowired
	private CourseSubRepository courseSubRepository;

	@Autowired
	private CourseEduRepository courseEduRepository;
	
	@Autowired
	private CourseCollectRepository courseCollectRepository;
	
	@Autowired
	private CourseCommentsRepository courseCommentsRepository;
	
	@Autowired
	private MemberRepository memberRepository;

	public CourseBean insert(CourseBean courseBean, Integer subId, Integer eduId) {
		CourseSub courseSub = courseSubRepository.findById(subId).get();
		courseBean.setCoursesub(courseSub);
		CourseEdu courseEdu = courseEduRepository.findById(eduId).get();
		courseBean.setCourseedu(courseEdu);
		CourseBean theCos = cosRep.save(courseBean);
		return theCos;
	}

	public CourseBean findByCourseId(int courseId) {
		Optional<CourseBean> optional = cosRep.findById(courseId);
		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
	public List<CourseBean> orderByEnrollment() {
		return cosRep.orderByEnrollment();
	}

	public List<CourseBean> findByNameLike(String course_name) {
		return cosRep.findByNameLike(course_name);
	}

	public List<CourseBean> findByEduIdLike(String education_id) {
		return cosRep.findByEduIdLike(education_id);
	}

	public List<CourseBean> findBySubIdLike(String subject_id) {
		return cosRep.findBySubIdLike(subject_id);
	}

	public List<CourseBean> findByLecturerName(String lecturer_name) {
		return cosRep.findByLecturerName(lecturer_name);
	}

	public List<CourseBean> selectAll() {
		return cosRep.findAll();
	}

	public CourseBean updateOne(CourseBean courseBean, Integer subId, Integer eduId) {
		CourseSub courseSub = courseSubRepository.findById(subId).get();
		courseBean.setCoursesub(courseSub);
		CourseEdu courseEdu = courseEduRepository.findById(eduId).get();
		courseBean.setCourseedu(courseEdu);
		CourseBean theCos = cosRep.save(courseBean);
		System.err.println(theCos);
		return theCos;
	}

	public void deleteOne(int courseId) {
		cosRep.deleteById(courseId);
		System.err.println(courseId);
	}

	public void collectAdd(String courseId,int id, String courseName) throws SQLException{
		System.out.println(courseId);
		CourseBean course = cosRep.findById(WebUtils.paseInt(courseId)).get();
		MemberBean memberBean = memberRepository.findById(id).get();
		CourseCollect collect = new CourseCollect();
		collect.setCourseBeans(course);
		collect.setCollectName(course.getCourse_name());
		collect.setMemberBeans(memberBean);
		collect.setCollectStatus("已收藏");
		courseCollectRepository.save(collect);
	}
	
	public List<CourseCollect> collectList(int id){
		List<CourseCollect> collectList = courseCollectRepository.findByMemberBeans_UserId(id);
		return collectList;
	}

	public boolean haveCollect(int userId, int courseId) {
		int haveCollect = courseCollectRepository.haveCollect(userId, courseId);
		if(haveCollect>0) {
			System.out.println(1);
			return true;
		}
		System.out.println(0);
		return false;
	}
	
	public void collectDelete(String id){
		courseCollectRepository.deleteById(WebUtils.paseInt(id));

	}
	
	public void deleteByUserIdAndCourseId(int userId, int courseId) {
		System.err.println(userId);
		System.err.println(courseId);
		courseCollectRepository.deleteByMemberBeans_UserIdAndCourseBeans_CourseId(userId, courseId);
	}
	
	public void commentsAdd(int userId, int courseId, String comments) throws SQLException{
		System.out.println(courseId);
		CourseBean course = cosRep.findById(courseId).get();
		MemberBean memberBean = memberRepository.findById(userId).get();
		CourseComments courseComments = new CourseComments();
		courseComments.setCourseBean(course);
		courseComments.setMemberBean(memberBean);
		courseComments.setComments(comments);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		courseComments.setCommentsDate(simpleDateFormat.format(date));
		System.err.println(courseComments);
		courseCommentsRepository.save(courseComments);
	}
	
	public List<CourseComments> findCourseCommentsByCourseBean_CourseId(int courseId) {
		return courseCommentsRepository.findCourseCommentsByCourseBean_CourseId(courseId);
	}
	
	public void deleteComments(int commentsId) {
		courseCommentsRepository.deleteById(commentsId);
		System.err.println(commentsId);
	}

	

}

package fourth.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fourth.bean.CourseBean;
import fourth.bean.CourseEdu;
import fourth.bean.CourseSub;
import fourth.bean.OrderUser;
import fourth.dao.CourseDao;
import fourth.dao.CourseEduRepository;
import fourth.dao.CourseRepository;
import fourth.dao.CourseSubRepository;
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

	public CourseBean insert(CourseBean courseBean, Integer subId, Integer eduId) {
		CourseSub courseSub = courseSubRepository.findById(subId).get();
		courseBean.setCoursesub(courseSub);
		CourseEdu courseEdu = courseEduRepository.findById(eduId).get();
		courseBean.setCourseedu(courseEdu);
		CourseBean theCos = cosRep.save(courseBean);
		return theCos;
	}

	public CourseBean findByCourseId(int course_id) {
		Optional<CourseBean> optional = cosRep.findById(course_id);
		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
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

	public void deleteOne(int course_id) {
		cosRep.deleteById(course_id);
		System.err.println(course_id);
	}

	public void updateCourse(CourseBean courseBean, Integer subId, Integer eduId, int course_id) throws SQLException {
		CourseService cService = new CourseService();
		CourseBean fbc = cService.findByCourseId(course_id);
		cService.updateOne(courseBean, subId, eduId);
		
		String txt = "<h2>" + "偉大的" + fbc.getLecturer_name() + "您好 :"
		        + "<br>" + "課程名稱: " + fbc.getCourse_name() + "<br>" + "上架日期: " + fbc.getCourse_date() + "<br>"
				+ "<br>" + "購買人信箱: "+ fbc.getLecturer_email() + "<br>" + "課程價格:"  + fbc.getCourse_price() + "<h2>";
		JavaMail javaMail = new JavaMail();
		javaMail.setCustomer("fock360man@gmail.com");
		javaMail.setSubject("好學生-EEIT49 課程審核通過!");
		javaMail.setTxt(txt);
		javaMail.sendMail();

	}

}

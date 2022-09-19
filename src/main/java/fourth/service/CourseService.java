package fourth.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fourth.bean.CourseBean;
import fourth.dao.CourseDao;
import fourth.dao.CourseRepository;


@Service
@Transactional
public class CourseService  {

	@Autowired
	private CourseRepository cosRep;

	
	public CourseBean insert(CourseBean cosBean) {
		CourseBean theCos = cosRep.save(cosBean);
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
	
	public List<CourseBean> selectAll() {
		return cosRep.findAll();
	}
	public CourseBean updateOne(CourseBean courseBean) {
		CourseBean theCos = cosRep.save(courseBean);
		return theCos;
	}
	public void deleteOne(int course_id) {
		cosRep.deleteById(course_id);
	}



	

}

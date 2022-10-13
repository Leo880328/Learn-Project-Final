package fourth.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import fourth.bean.CommentsBean;
import fourth.dao.CommentsRepository;

@Service
@Transactional
public class CommentsService {
	@Autowired
	private CommentsRepository commentsRepository;
	
	public CommentsBean insertComments(CommentsBean comment) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		comment.setTime(simpleDateFormat.format(date));
		return commentsRepository.save(comment);
	}
	
	public CommentsBean updateComments(CommentsBean comment) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		comment.setTime(simpleDateFormat.format(date));
		return commentsRepository.save(comment);
	}
	public CommentsBean selectByUserId(int user_id) {
		Optional<CommentsBean> optional = commentsRepository.findById(user_id);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null; 
	}
	public CommentsBean selectByCommentId(int commentid) {
		Optional<CommentsBean> optional = commentsRepository.findById(commentid);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	public List<CommentsBean> selectAllComments(){
		return commentsRepository.findAll();
	}
	
	public void deleteCommentByCommentId(int commentid) {
		commentsRepository.deleteById(commentid);
	}
}

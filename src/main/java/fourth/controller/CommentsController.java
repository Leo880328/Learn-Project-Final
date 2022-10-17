package fourth.controller;

import java.util.List;
import java.util.Map;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import fourth.bean.ColumnBean;
import fourth.bean.CommentsBean;
import fourth.service.ColumnService;
import fourth.service.CommentsService;

@Controller
public class CommentsController {
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private CommentsService commentsService;
	@Autowired
	private ColumnService columnService;
	
	@PostMapping("/insert")
	public String insertComment(int article_no, CommentsBean bean, Model m) {
		bean.setAuthor("Tony");
		bean.setUser_id(3);
		commentsService.insertComments(bean);
		return frontEndDetails(article_no, m);
	}
	
	public String queryAllComments(Model m) {
		List<CommentsBean> allComments = commentsService.selectAllComments();
		m.addAttribute("queryall", allComments);
		return "ColumnFrontEndDetails";
	
	}
	@PostMapping("/deletecomment")
	public String deleteByCommentId(int commentid,  Model m, int article_no) {
		commentsService.deleteCommentByCommentId(commentid);
		return frontEndDetails(article_no, m);
	}
	@PostMapping("/updatecomment")
	@ResponseBody
	public boolean updateComment(@RequestBody Map<String, String> map, Model m) {
		Integer commentId = Integer.valueOf(map.get("id"));
		String comments = map.get("comments");
		
		CommentsBean bean1 = commentsService.selectByCommentId(commentId);
		bean1.setComments(comments);
		commentsService.updateComments(bean1);
		return true;
	}
	public String queryByUserId(@RequestParam("user_id") int user_id, Model m) {
		CommentsBean list = commentsService.selectByUserId(user_id);
		m.addAttribute("icomments", list);
		return "";
	
	}
	@RequestMapping(path="/details", method=RequestMethod.GET)
	public String frontEndDetails(int article_no, Model m) {
		List<CommentsBean> allcomments = commentsService.selectAllComments();
		m.addAttribute("all", allcomments);
		
		ColumnBean col = columnService.selectByArticleNo(article_no);
		m.addAttribute("col", col);
		
		return "ColumnFrontEndDetails";
	}
}

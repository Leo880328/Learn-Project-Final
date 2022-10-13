package fourth.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="comments")
@Component
public class CommentsBean implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="commentid")
	private int commentid;
	@Column(name="user_id")
	private int user_id;
	@Column(name="author")
	private String author;
	@Column(name="time")
	private String time;
	@Column(name="comments")
	private String comments;
	
	
	public CommentsBean() {
		
	}
	public CommentsBean(int commentid, int user_id, String author, String time, String comments) {
		this.commentid = commentid;
		this.user_id = user_id;
		this.author = author;
		this.time = time;
		this.comments = comments;
	}
	public int getCommentid() {
		return commentid;
	}
	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	@Override
	public String toString() {
		return "CommentsBean [commentid=" + commentid + ", user_id=" + user_id + ", author=" + author + ", time=" + time
				+ ", comments=" + comments + "]";
	}
	
	
	
	
	
}

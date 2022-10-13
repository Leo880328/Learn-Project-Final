package fourth.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import fourth.bean.ColumnBean;
import fourth.columnmail.JavaMail;
import fourth.dao.ColumnDAO1;
import fourth.service.ColumnService;

@Controller

public class ColumnController {
	
	@Autowired
	private SessionFactory sessionFactory ;
	
	@Autowired
	private ColumnService columnService;
	
	@GetMapping("/ColumnAdd")
	public String addJsp() {
		return "ColumnAdd";
	}
	@PostMapping("/ColumnAddAction")
	public String addAction(@RequestParam(required = false)String backToQuery , ColumnBean bean){
		if(backToQuery!= null) {
			return "redirect:QueryAll";
		}
		bean.setPicture("images/"+bean.getPicture());
		columnService.insertColumn(bean);
		return "redirect:QueryAll";		
	}
	@GetMapping("/QueryAll")
	public String queryAllAction(Model m) {
		List<ColumnBean> selectAllColumns = columnService.selectAllColumns();
		m.addAttribute("queryall", selectAllColumns);
		return "ColumnQueryAll";
	}
	
	@ResponseBody
	@DeleteMapping("/ColumnDelete/{id}")
	public String delete(@PathVariable("id") int article_no) {
		columnService.deleteColumnByNo(article_no);
		return "delete ok";
	}
	@GetMapping("/Update")
	public String update(ColumnBean bean) {
		return "ColumnUpdate"; 
	}
	@PostMapping("/updateAction")
	public String updateAction(@RequestParam("status") int status, ColumnBean bean, int article_no) {
		//bean.setPicture("images/"+bean.getPicture());
		ColumnBean bean1 = columnService.selectByArticleNo(article_no);
		if(status == bean1.getStatus()) {
			columnService.updateColumn(bean);
			return "redirect:QueryAll";		
		}
		if(status == 3) {
			columnService.updateColumn(bean);
			String txt = "<h2>" + "親愛的 " + bean.getAuthor() + " 您好 :" + "<br>" + "文章編號: "
					+ bean.getArticle_no() + "<br>" + "文章標題: " + bean.getTitle() + "<br>" + "<br>" + "<br>"
					+ "審核結果: 通過!!" + "<h2>";
			JavaMail javaMail = new JavaMail();
			javaMail.setCustomer("s811026a@hotmail.com");
			javaMail.setSubject("好學生-EEIT49 文章審核通過!");
			javaMail.setTxt(txt);
			javaMail.sendMail();
			return "redirect:/QueryAll";
		}else if(status == 2) {
			columnService.updateColumn(bean);
			String txt = "<h2>" + "親愛的 " + bean.getAuthor() + " 您好 :" + "<br>" + "文章編號: "
					+ bean.getArticle_no() + "<br>" + "文章標題: " + bean.getTitle() + "<br>" + "<br>"
					+ "審核結果: 駁回!!" + "<br>" + "駁回原因: 文章內容帶有不當資訊" + "<h2>";
			JavaMail javaMail = new JavaMail();
			javaMail.setCustomer("s811026a@hotmail.com");
			javaMail.setSubject("好學生-EEIT49 文章駁回通知");
			javaMail.setTxt(txt);
			javaMail.sendMail();
			return "redirect:/QueryAll";
		}
		return "redirect:/QueryAll";
		
	}
	@GetMapping("/searchAction")
	public String search(@RequestParam("search") String article_no, Model m) {
		Map<String, String> errors = new HashMap<String,String>();
		m.addAttribute("errors", errors);

		if (article_no == "") {
			article_no = "0";
			System.err.println("article_no" + article_no);
		}
		ColumnBean col = columnService.selectByArticleNo(Integer.parseInt(article_no));
		if(article_no == "0" || col == null) {
			System.err.println("article_no" + article_no);
			errors.put("name", "<font color=red size=5>查無資料!!</font>");
		}
		
		if(errors!=null && !errors.isEmpty()) {
			return queryAllAction(m);
		}		
		m.addAttribute("column", col);
		return queryAllAction(m);
	}
	@RequestMapping(path="/more", method=RequestMethod.GET)
	public String more(int article_no, Model m) {
		ColumnBean col = columnService.selectByArticleNo(article_no);
		m.addAttribute("col", col);
		return "ColumnMoreContents";
	}
	@PostMapping(path="/searchEnglish")
	public String searchByEnglish(@RequestParam("searchEnglish") String subject, Model m) {
		List<ColumnBean> list = columnService.findByEnglish("%"+"英文"+"%");
		m.addAttribute("English", list);
		return "English";
	}
	@PostMapping(path="/searchToeic")
	public String searchByToeic(@RequestParam("searchToeic") String subject, Model m) {
		List<ColumnBean> list = columnService.findByEnglish("%"+"多益"+"%");
		m.addAttribute("Toeic", list);
		return "Toeic";
	}
	@PostMapping(path="/searchMath")
	public String searchByMath(@RequestParam("searchMath") String subject, Model m) {
		List<ColumnBean> list = columnService.findByEnglish("%"+"數學"+"%");
		m.addAttribute("Math", list);
		return "Math";
	}
	@GetMapping(path="/ColumnFrontEnd")
	public String columnFrontEnd(Model m) {
		List<ColumnBean> selectAllColumns = columnService.selectAllColumns();
		m.addAttribute("queryall", selectAllColumns);
		return "ColumnFrontEnd";
	}
	@GetMapping(path="/ColumnFrontEndDetails")
	public String columnFrontEndDetails() {
//		ColumnBean col = columnService.selectByArticleNo(article_no);
//		m.addAttribute("col", col);
		return "ColumnFrontEndDetails";
	}
//	@RequestMapping(path="/details", method=RequestMethod.GET)
//	public String frontEndDetails(int article_no, Model m) {
//		ColumnBean col = columnService.selectByArticleNo(article_no);
//		m.addAttribute("col", col);
//		return "ColumnFrontEndDetails";
//	}
	@GetMapping(path="/queryEnglish")
	public String queryByEnglish(String subject, Model m) {
		List<ColumnBean> list = columnService.findByEnglish("%"+"英文"+"%");
		m.addAttribute("queryEnglish", list);
		return "ColumnFrontEndQuery";
	}
	@GetMapping(path="/queryToeic")
	public String queryByToeic(String subject, Model m) {
		List<ColumnBean> list = columnService.findByEnglish("%"+"多益"+"%");
		m.addAttribute("queryToeic", list);
		return "ColumnFrontEndQuery";
	}
	@GetMapping(path="/queryMath")
	public String queryByMath(String subject, Model m) {
		List<ColumnBean> list = columnService.findByEnglish("%"+"數學"+"%");
		m.addAttribute("queryMath", list);
		return "ColumnFrontEndQuery";
	}
	
	@GetMapping("/ColumnFrontAdd")
	public String columnFrontAdd() {
		return "ColumnFrontAdd";
	}
	@PostMapping("/ColumnAddAction1")
	public String addAction1(@RequestParam(required = false)String backToQuery , ColumnBean bean){	
		bean.setPicture("images/"+bean.getPicture());
		columnService.insertColumn(bean);
		return "redirect:ColumnTeacherFront";		
	}
	@GetMapping("/ColumnTeacherFront")
	public String findByAuthor(String author,Model m) {
		List<ColumnBean> list = columnService.findByAuthor("%"+"Winnie"+"%");
		m.addAttribute("queryAuthor", list);
		return "ColumnTeacherFront";
	}
	
	@GetMapping("/ColumnDelete1")
	public String delete1(int article_no) {
		columnService.deleteColumnByNo(article_no);
		return "redirect:ColumnTeacherFront";
	}
	@GetMapping("/Update1")
	public String update1(ColumnBean bean) {
		return "ColumnFrontUpdate"; 
	}
	@PostMapping("/updateAction1")
	public String updateAction1(ColumnBean bean) {
		//bean.setPicture("images/"+bean.getPicture());
		columnService.updateColumn(bean);
		return "redirect:ColumnTeacherFront";
	}
	@RequestMapping(path="/more1", method=RequestMethod.GET)
	public String more1(int article_no, Model m) {
		ColumnBean col = columnService.selectByArticleNo(article_no);
		m.addAttribute("col", col);
		return "ColumnUpdate";
	}
	
}

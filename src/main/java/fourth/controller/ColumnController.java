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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import fourth.bean.ColumnBean;
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
	
	
	@PostMapping("/ColumnDelete")
	public String delete(int article_no) {
		columnService.deleteColumnByNo(article_no);
		return "redirect:QueryAll";
	}
	@GetMapping("/Update")
	public String update(ColumnBean bean) {
		return "ColumnUpdate"; 
	}
	@PostMapping("/updateAction")
	public String updateAction(ColumnBean bean) {
		//bean.setPicture("images/"+bean.getPicture());
		columnService.updateColumn(bean);
		return "redirect:QueryAll";
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
	@RequestMapping(path="/details", method=RequestMethod.GET)
	public String frontEndDetails(int article_no, Model m) {
		ColumnBean col = columnService.selectByArticleNo(article_no);
		m.addAttribute("col", col);
		return "ColumnFrontEndDetails";
	}
	
	
	
}

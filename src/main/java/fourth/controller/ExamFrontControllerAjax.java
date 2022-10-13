package fourth.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.swing.DefaultButtonModel;

import org.hibernate.mapping.Subclass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.format.DataFormatDetector;

import fourth.bean.CourseBean;
import fourth.bean.ExamBean;
import fourth.bean.ExamQuesBean;
import fourth.bean.MemberBean;
import fourth.bean.OrderUser;
import fourth.service.ExamService;
import fourth.util.DateUtil;

@Controller
@SessionAttributes(names = {"testMap","user","upBean"})
public class ExamFrontControllerAjax {
	
	@Autowired
	private ExamService examService;
	
	
	@GetMapping("/ExamFrontController")
	public String entrance(Model m,HttpServletRequest request) {
		
		return "ExamFront";
	}
	
	@ResponseBody
	@PostMapping(path = "/examFrontQuery")
	public List<ExamBean> examQuery(@RequestParam(defaultValue = "") String subject,@RequestParam(defaultValue = "") String education) {
		List<ExamBean> examTable= examService.select(subject,education);

		for (int i=0;i<examTable.size();i++) {
			
			examTable.get(i).getExamdate();
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();        
			String dateToStr = dateFormat.format(examTable.get(i).getExamdate());
			examTable.get(i).setStringDate(dateToStr);
			
		}
		
		return examTable;
	}
	
	
	@ResponseBody
	@PostMapping(path = "/examFrontQueryAll")
	public List<ExamBean> examQueryAll() {
		List<ExamBean> examTable= examService.selectAll();
//		System.err.println(theExamQuTable);
//		System.err.println("controller回傳前");
//		System.err.println(examTable);
		for (int i=0;i<examTable.size();i++) {
			
			examTable.get(i).getExamdate();
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();        
			String dateToStr = dateFormat.format(examTable.get(i).getExamdate());
			examTable.get(i).setStringDate(dateToStr);
			
		}
		
		return examTable;
	}

			
	
}




/*	@PostMapping(path = "/examFrontUpload")
public String processUploadAction(Model m) {
	
	String nextPage = "ExamInsert";
	
	return nextPage;
}

@PostMapping(path = "/examFrontInsert")
public String processInsertAction(
		
	Model m,HttpServletRequest request
			
	//Insert參數
	,@RequestParam(defaultValue = "") String subject,@RequestParam(defaultValue = "") String education
	,@RequestParam(defaultValue = "") String examName,@RequestParam(defaultValue = "") String examDate
	,@RequestParam(defaultValue = "") String examID,@RequestParam(required = false) MultipartFile myfile
	,@RequestParam(defaultValue = "") String difficulty
	
	//考題Insert
	,@RequestParam(defaultValue = "") String[] content
	,@RequestParam(defaultValue = "") String[] optA,@RequestParam(defaultValue = "") String[] optB
	,@RequestParam(defaultValue = "") String[] optC,@RequestParam(defaultValue = "") String[] optD
	,@RequestParam(defaultValue = "") String[] answer,@RequestParam(defaultValue = "") String[] score

	
	) throws IllegalStateException, IOException {
	
	//抓取會員ID
	MemberBean user = (MemberBean)m.getAttribute("user");

	//處理儲存路徑
	String saveFileSubPath = "static/images";
	String saveFileDir = request.getSession().getServletContext().getRealPath(saveFileSubPath).replaceFirst("webapp", "resources");
	String fileName = myfile.getOriginalFilename();
	
	//資料庫中的儲存路徑，給jsp直接呼叫用的
	String fileLocalPath = "images/"+fileName;
	File saveFilePath = new File(saveFileDir, fileName);
	myfile.transferTo(saveFilePath);
	
	examService.insert(subject, education, examName, examDate,fileLocalPath,user.getuserId(),difficulty,
					   content,optA,optB,optC,optD,answer,score);
	
	
	
	String nextPage="ExamFront";
	
	return nextPage;
}*/

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
public class ExamControllerAjax {
	
	@Autowired
	private ExamService examService;
	
	
	@GetMapping("/ExamBackController")
	public String entrance(Model m,HttpServletRequest request) {
		
		System.err.println("進入後台");
		
		return "Exam";
	}
	
	
	@ResponseBody
	@PostMapping(path = "/examQueryAll")
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
	
	
	
	@PostMapping(path = "/ExamDe")
	@ResponseBody
	public boolean processDeAction(@RequestParam(defaultValue = "") String examId ) {
		
		System.err.println("刪除ID~~~~~"+examId);
				
		examService.delete(examId);
		return true;
	};
	
	
	@PostMapping(path = "/quDe")
	public void processQuDActione(@RequestParam(defaultValue = "") String quId) {
		
		System.err.println("考題ID"+quId);
		
		examService.deleteQuesById(quId.trim());
		
	}

	@PostMapping(path = "/examUpload")
	public String processUploadAction(Model m) {
		
		String nextPage = "ExamInsert";
		
		return nextPage;
	}
	
	@PostMapping(path = "/examInsert")
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
		
		
		String pageStatus = (String)request.getSession().getAttribute("pageStatus");
		String nextPage="ExamFront";
		
		if (pageStatus.equals("3") ) {nextPage="Exam";};
		
		
		return nextPage;
	}
	
	
	
	@PostMapping(path="/examUpdate")
	public String processControllerAction(@RequestParam(defaultValue = "") String examId, Model m) {
		
		System.err.println("進入examUpdate");
		
		//調出考卷
		ExamBean upBean = examService.selectById(examId);
		m.addAttribute("upBean", upBean);
		
		//調考卷有的題目
		List<ExamQuesBean> examQues = examService.selectQuesByExamId(examId);
		Integer examQuesNum = examQues.size();
		m.addAttribute("examQuesNum",examQuesNum);
		m.addAttribute("examQues",examQues);
		
		//考卷的日期型態為data往前端傳時改為字串
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();        
		String dateToStr = dateFormat.format(upBean.getExamdate());
		upBean.setStringDate(dateToStr);
		
		
		String nextPage = "ExamUpdate";
		
		return nextPage;
	}
	
	@PostMapping(path="/examUpdateConfirm")
	public String processUpdateConfirmAction(
			
			Model m,HttpServletRequest request,@RequestParam(defaultValue = "") String userId
			//Insert參數
			,@RequestParam(defaultValue = "") String examId
			,@RequestParam(defaultValue = "") String subject,@RequestParam(defaultValue = "") String education
			,@RequestParam(defaultValue = "") String examName,@RequestParam(defaultValue = "") String examDate
			,@RequestParam(required = false) MultipartFile myfile,@RequestParam(defaultValue = "") String difficulty
			,@RequestParam(defaultValue = "") String review
			
			//考題Insert
			,@RequestParam(defaultValue = "") String[] examQuId
			,@RequestParam(defaultValue = "") String[] content
			,@RequestParam(defaultValue = "") String[] optA,@RequestParam(defaultValue = "") String[] optB
			,@RequestParam(defaultValue = "") String[] optC,@RequestParam(defaultValue = "") String[] optD
			,@RequestParam(defaultValue = "") String[] answer,@RequestParam(defaultValue = "") String[] score
			
			) throws IllegalStateException, IOException {
		
		ExamBean upBean = (ExamBean) m.getAttribute("upBean");
		String fileLocalPath = upBean.getExamPic();
		
		System.err.println(fileLocalPath);
		System.err.println(myfile);
		System.err.println(review);
		
		if (!myfile.isEmpty()) {
			String saveFileSubPath = "static/images";
			String saveFileDir = request.getSession().getServletContext().getRealPath(saveFileSubPath).replaceFirst("webapp", "resources");
			String fileName = myfile.getOriginalFilename();
			
			//資料庫中的儲存路徑，給jsp直接呼叫用的
			fileLocalPath = "images/"+fileName;
			File saveFilePath = new File(saveFileDir, fileName);
			myfile.transferTo(saveFilePath);
		}

		
		examService.update(examId,subject, education, examName, examDate,fileLocalPath,Integer.valueOf(userId),difficulty,review,
							examQuId,content,optA,optB,optC,optD,answer,score);
		
		return "Exam";
	}
	
}

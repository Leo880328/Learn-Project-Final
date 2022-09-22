package fourth.service;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fourth.bean.ExamEduBean;
import fourth.bean.ExamQuesBean;
import fourth.bean.ExamRecord;
import fourth.bean.ExamBean;
import fourth.bean.ExamTest;
import fourth.bean.ExamTestDetail;
import fourth.bean.ExamSubBean;
import fourth.dao.ExamQuesRepository;
import fourth.dao.ExamRepository;
import fourth.dao.ExamTestDetailRepository;
import fourth.dao.ExamTestRespository;
import fourth.util.ExamUtil;

@Service
@Transactional
public class ExamTestService2  {
	
	
	@Autowired
	private ExamQuesRepository examQuRes;
	
	@Autowired
	private ExamRepository examRes;
	
	@Autowired
	private ExamTestRespository examTestRes;
	
	@Autowired
	private ExamTestDetailRepository examTestDetailRes;
	//增加

	
	////////////////////考試////////////////////考試////////////////////考試////////////////////考試
	//查詢考試題目
	public List<ExamQuesBean> Test(String subString,String eduString,String examID,Integer memberId){
		
		
		//找出考題
		List<ExamQuesBean> examQuesList = examQuRes.findQues(1,1);
		
		//看是哪張考卷
		ExamBean examBean = examRes.findById(Integer.valueOf(examID)).get(); 
		//建立考試紀錄
		ExamTest examTest = new ExamTest(examBean);
		examTestRes.save(examTest);
		
		//紀錄是哪個會員考試
		//會員ID、考試ID、分數、日期
		
		//紀錄考卷內容
		for(int i=0;i<examQuesList.size();i++) {
			
			
			ExamTestDetail examTestDetail = new ExamTestDetail(examTest, examQuesList.get(i));
			examTestDetailRes.save(examTestDetail);
		}
		
		return examQuesList;
	}
	
	////////////////////考試////////////////////考試////////////////////考試
	
}

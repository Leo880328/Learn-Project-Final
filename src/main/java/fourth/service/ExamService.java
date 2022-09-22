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
public class ExamService  {
	
	
	@Autowired
	private ExamQuesRepository examQuRes;
	
	@Autowired
	private ExamRepository examRes;
	
	@Autowired
	private ExamTestRespository examTestRes;
	
	@Autowired
	private ExamTestDetailRepository examTestDetailRes;
	//增加
	public ExamBean insert(String subString,String eduString,String examName,String examDate,String exampic){
		
		
		ExamSubBean subBean = new ExamSubBean(ExamUtil.getSubIdx(subString), subString);
		ExamEduBean eduBean = new ExamEduBean(ExamUtil.getEduIdx(eduString), eduString);
		
//		System.out.println(ExamUtil.getSubIdx(subString)+subString);
//		System.out.println(ExamUtil.getEduIdx(eduString)+eduString);
		ExamBean insBean = new ExamBean();
		try {
			
			Date tDate = new SimpleDateFormat("yyyy-MM-dd").parse(examDate);
			insBean = new ExamBean(subBean, eduBean, examName, tDate, exampic); 
//			insBean.setExamdate(tDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		return examRes.save(insBean);
		
	}
	
	//修改
	public ExamBean update(String updateId, String subString,String eduString,String examName,String examDate,String exampic){
		
		
		Integer upId = Integer.valueOf(updateId);
		ExamSubBean subBean = new ExamSubBean(ExamUtil.getSubIdx(subString), subString);
		ExamEduBean eduBean = new ExamEduBean(ExamUtil.getEduIdx(eduString), eduString);
		
//		System.out.println(ExamUtil.getSubIdx(subString)+subString);
//		System.out.println(ExamUtil.getEduIdx(eduString)+eduString);
		
		ExamBean upBean = new ExamBean();
//		
		try {
			
			Date tDate = new SimpleDateFormat("yyyy-MM-dd").parse(examDate);
//			upBean = new ExamBean(subBean, eduBean, examName, tDate); 
			upBean = new ExamBean(upId, subBean, eduBean, examName, tDate, exampic);
			upBean.setExamdate(tDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return examRes.save(upBean);
		
	}
	
	//查詢考卷
	public List<ExamBean> select(String subString,String eduString){
		
//		Integer subIdx = ExamUtil.getSubIdx(subString);
//		Integer eduIdx = ExamUtil.getEduIdx(eduString);
		return examRes.findBySubject_subjectNameAndEducation_educationName(subString, eduString);
	}
	
	//查詢全部
	public List<ExamBean> selectAll(){
		return examRes.findAll();
	}
	
	//刪除
	public void delete(String id){
		Integer examID = Integer.valueOf(id);
		examRes.deleteById(examID);
	}
	
	////////////////////考試////////////////////考試////////////////////考試////////////////////考試
	//查詢考試題目
	public List<ExamQuesBean> selectQu(String subString,String eduString,String examID){
		
		
		List<ExamQuesBean> examQuesList = examQuRes.findQues(1,1);
		ExamBean examBean = examRes.findById(Integer.valueOf(examID)).get();
//		Integer totalTestNum = examContentRes.findMaxTestNum();
		ExamTest examTest = new ExamTest(examBean);
		
		for(int i=0;i<examQuesList.size();i++) {
			
			
			ExamTestDetail examTestDetail = new ExamTestDetail(examTest, examQuesList.get(i));
			examTestRes.save(examTest);
			examTestDetailRes.save(examTestDetail);
			
		}
		
		return examQuesList;
		
	}
	
	////////////////////考試////////////////////考試////////////////////考試
	
}

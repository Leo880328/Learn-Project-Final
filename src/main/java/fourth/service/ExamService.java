  package fourth.service;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fourth.bean.ExamEduBean;
import fourth.bean.ExamQuesBean;
import fourth.bean.ExamRecord;
import fourth.bean.ExamBean;
import fourth.bean.ExamTest;
import fourth.bean.ExamTestDetail;
import fourth.bean.MemberBean;
import fourth.bean.ExamSubBean;
import fourth.dao.ExamMemRecordRepository;
import fourth.dao.ExamMemberRepository;
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
	
	@Autowired
	private ExamMemberRepository examMemberRes;
	
	//增加
	public ExamBean insert(
			
			//考卷
			String subString,String eduString,String examName,String examDate,String exampic
			,Integer userId,String difficulty
			
			//考題
			,String[] content,String[] optA,String[] optB,String[] optC,String[] optD
			,String[] answer,String[] score
			
			){
		

		//儲存考試物件
		ExamSubBean subBean = new ExamSubBean(ExamUtil.getSubIdx(subString), subString);
		ExamEduBean eduBean = new ExamEduBean(ExamUtil.getEduIdx(eduString), eduString);
		MemberBean memberBean = examMemberRes.findById(userId).get();
		System.err.println("diff"+difficulty);
		System.err.println("date"+examDate);
//		System.out.println(ExamUtil.getSubIdx(subString)+subString);
//		System.out.println(ExamUtil.getEduIdx(eduString)+eduString);
		ExamBean insBean = new ExamBean();
		try {
			
			Date tDate = new SimpleDateFormat("yyyy-MM-dd").parse(examDate);
			insBean = new ExamBean(subBean, eduBean, examName, tDate, exampic,memberBean,difficulty,0,0,0); 
//			insBean.setExamdate(tDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		//此次考試內容
		for(int i=0;i<content.length;i++) {
			
			ExamQuesBean insQues = new ExamQuesBean(subBean, eduBean, insBean,content[i], 
													optA[i], optB[i], optC[i], optD[i],answer[i], Integer.parseInt(score[i]));
			examQuRes.save(insQues);
		}
		
		
		return examRes.save(insBean);
		
	}
	
	//修改
	public ExamBean update(
			
			//考卷
			String updateId//考卷修改ID
			
			, String subString,String eduString,String examName,String examDate,String exampic
			,Integer userId//原考卷出題者ID
			,String difficulty,String status
			
			//考題
			,String[] quId
			,String[] content,String[] optA,String[] optB,String[] optC,String[] optD
			,String[] answer,String[] score
			
			){
		
		
		Integer upId = Integer.valueOf(updateId);
		ExamSubBean subBean = new ExamSubBean(ExamUtil.getSubIdx(subString), subString);
		ExamEduBean eduBean = new ExamEduBean(ExamUtil.getEduIdx(eduString), eduString);
		MemberBean memberBean = examMemberRes.findById(userId).get();
//		System.out.println(ExamUtil.getSubIdx(subString)+subString);
//		System.out.println(ExamUtil.getEduIdx(eduString)+eduString);
		
		ExamBean upBean = new ExamBean();
//		
		
		
		System.err.println("service~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+status);
		try {
			
			Date tDate = new SimpleDateFormat("yyyy-MM-dd").parse(examDate);
//			upBean = new ExamBean(upId, subBean, eduBean, examName, tDate, exampic);
			upBean = new ExamBean(upId,subBean, eduBean, examName, tDate, exampic,memberBean,difficulty,0,0,Integer.valueOf(status)); 
			upBean.setExamdate(tDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//此次考試內容
		for(int i=0;i<content.length;i++) {
			
			ExamQuesBean insQues = new ExamQuesBean(Integer.valueOf(quId[i]),subBean, eduBean, upBean,content[i], 
													optA[i], optB[i], optC[i], optD[i],answer[i], Integer.parseInt(score[i]));
			examQuRes.save(insQues);
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
	
	//刪除考卷
	public void delete(String id){
		Integer examID = Integer.valueOf(id);
		
		
		ExamBean deExamBean = examRes.findById(examID).get();
		
		//把考試記錄中的examId設成null
		List<ExamTest> deTeSet = deExamBean.getExamTests();
		for (int i = 0; i < deTeSet.size(); i++) {
			deTeSet.get(i).setExam(null);
		}
		
		//把考題中的examId設成null
		List<ExamQuesBean> deQuSet = deExamBean.getExamQueses();
		for (int i = 0; i < deQuSet.size(); i++) {
			deQuSet.get(i).setExam(null);
		}
		
		examRes.deleteById(examID);
	}
	
	//保留考題，把與考試連結設為null
	public void deleteQuesById(String quId) {
		
		ExamQuesBean quesBean = examQuRes.findById(Integer.valueOf(quId.trim())).get();
		
		quesBean.setExam(null);
		
		
	}
	

	
	
	public ExamBean selectById(String examId) {
		
		return examRes.findById(Integer.valueOf(examId)).get();
		
	}
	
	public List<ExamQuesBean> selectQuesByExamId(String examId) {
		
		List<ExamQuesBean> quList = examQuRes.findByExam_ExamID(Integer.valueOf(examId));
		
		return quList;
	
	}
	

	
	
//	////////////////////考試////////////////////考試////////////////////考試////////////////////考試
//	//查詢考試題目
//	public List<ExamQuesBean> selectQu(String subString,String eduString,String examID){
//		
//		
//		//找出考題
//		List<ExamQuesBean> examQuesList = examQuRes.findQues(1,1);
//		ExamBean examBean = examRes.findById(Integer.valueOf(examID)).get();
//		
//		//建立考試
//		ExamTest examTest = new ExamTest(examBean);
//		examTestRes.save(examTest);
//		
//		//紀錄是哪個會員考試
//		//會員ID、考試ID、分數、日期
//		
//		//紀錄考卷內容
//		for(int i=0;i<examQuesList.size();i++) {
//			
//			
//			ExamTestDetail examTestDetail = new ExamTestDetail(examTest, examQuesList.get(i));
//			
//			examTestDetailRes.save(examTestDetail);
//			
//		}
//		
//		return examQuesList;
//		
//	}
//	
//	
//	
//	////////////////////考試////////////////////考試////////////////////考試
	
}

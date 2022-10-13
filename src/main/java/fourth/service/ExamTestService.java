package fourth.service;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fourth.bean.ExamEduBean;
import fourth.bean.ExamQuesBean;
import fourth.bean.ExamRecord;
import fourth.bean.ExamReserve;
import fourth.bean.ExamBean;
import fourth.bean.ExamTest;
import fourth.bean.ExamTestDetail;
import fourth.bean.MemberBean;
import fourth.bean.ExamSubBean;
import fourth.dao.ExamMemRecordRepository;
import fourth.dao.ExamMemberRepository;
import fourth.dao.ExamQuesRepository;
import fourth.dao.ExamRepository;
import fourth.dao.ExamReserveRepository;
import fourth.dao.ExamTestDetailRepository;
import fourth.dao.ExamTestRespository;
import fourth.util.ExamUtil;

@Service
@Transactional
public class ExamTestService  {
	
	//考題隨機查詢
	@Autowired
	private ExamQuesRepository examQuRes;
	
	//考卷相關
	@Autowired
	private ExamRepository examRes;
	
	//創建考試
	@Autowired
	private ExamTestRespository examTestRes;
	
	//創建考試有哪些題目
	@Autowired
	private ExamTestDetailRepository examTestDetailRes;

	//紀錄哪個會員考哪個考試
	@Autowired
	private ExamMemRecordRepository examMemRecordRes;
	
	//保存考試
	@Autowired
	private ExamReserveRepository examReserveRes;
	
	//自行先創造的會員查詢方法
	@Autowired
	private ExamMemberRepository examMemberRes;

	
	////////////////////考試////////////////////考試////////////////////考試////////////////////考試
	//查詢考試題目
	public Map<String, Object> EstaTest(String examID){
		
		//建立Map儲存考試相關物件
		Map<String, Object> testMap = new HashedMap();
		
		
		//看是哪張考卷
		ExamBean examBean = examRes.findById(Integer.valueOf(examID)).get(); 
		
		//找出考題
//		List<ExamQuesBean> examQuesList = examQuRes.findQues(examBean.getSubject().getSubjectId(),examBean.getEducation().getEducationId());
		List<ExamQuesBean> examQuesList = examQuRes.findByExam_ExamID(Integer.valueOf(examID));
		//建立考試紀錄
		ExamTest examTest = new ExamTest(examBean);
		examTestRes.save(examTest);
		
		List<ExamTestDetail> examTestDetailsList = new ArrayList<ExamTestDetail>();
		//紀錄考卷內容
		for(int i=0;i<examQuesList.size();i++) {
			
			
			ExamTestDetail examTestDetail = new ExamTestDetail(examTest, examQuesList.get(i));
			examTestDetailRes.save(examTestDetail);
			examTestDetailsList.add(examTestDetail);
		}
		
		testMap.put("examName", examBean.getExamName()); //紀錄考試名字，預防刪除後會員看不到考卷名
		testMap.put("examBean", examBean); //哪張考卷
		testMap.put("examTest", examTest); //哪次考試
		testMap.put("examTestDetailList", examTestDetailsList);//紀錄本次考試有哪些題目，後面用來記錄會員選擇答案
		testMap.put("examQueList", examQuesList); //那些題目
		
		return testMap;

	}
	
	
	
	public void EstaRecord(Map<String, Object> testMap,Integer memberId) {
		////ExamRecord紀錄考試相關資訊
		//會員ID、分數、對應哪次考試
		MemberBean memberBean = examMemberRes.findById(memberId).get();
		
		//拿到題目
		List<ExamQuesBean> examQueList = (List<ExamQuesBean>)testMap.get("examQueList");
//		List<String> chooseAnsList = (List<String>)testMap.get("chooseList");
		
		//紀錄會員
		List<ExamTestDetail> examTestDetailsList = (List<ExamTestDetail>)testMap.get("examTestDetailList");
		
		////紀錄會員的回答
		//String[i][0] 錯第幾題
		//String[i][1] 錯誤題目選哪個選項
		List<String> wrongNumList = new ArrayList<String>();
		
		//對答案
		int ctCount =0;
		Integer score = 0;
		for(int i=0;i<examQueList.size();i++) {
			
			String chooseAns = examQueList.get(i).getChooseAns();
			
			examTestDetailsList.get(i).setChooseAns(chooseAns);
			
			examTestDetailRes.save(examTestDetailsList.get(i));
			
			if (chooseAns.equals(examQueList.get(i).getQuesAnswer())) {
				ctCount++;
				score += examQueList.get(i).getQuesScore();
			}else {
//				wrongNumList.add(String.valueOf(i));
			}
		}
		
		
		
		//checkAns對答案，算分數
		testMap.put("examScore", score);
		
		//抓取是哪次考試
		ExamTest examTest = (ExamTest)testMap.get("examTest");
	
		//處理考卷更新資訊
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//抓取這次考試的考卷分數與人數，計算平均分數
		ExamBean examBean = examTest.getExam();
		Integer avgScore = examBean.getAvgScore();
		Integer testNum = examBean.getTestNumber();
		
		//計算新平均
		Integer newAvgScore = (avgScore * testNum + score) / (testNum + 1);
		
		//更新考卷平均分數與考卷人數
		examBean.setAvgScore(newAvgScore);
		examBean.setTestNumber(testNum+1);
		
		//儲存更新後資料
		examRes.save(examBean);
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		
		//抓取現在時間
		Date date = new Date();
		SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
		System.out.println(dateFormat.format(date));
		
		ExamRecord examRecord = 
				new ExamRecord(memberBean,examTest,score, date, (String)testMap.get("examName"));
		
		examMemRecordRes.save(examRecord);
		
	}
	
	public void reserveQu(Map<String, Object> testMap,List<Integer> reserveQuIdx,Integer memberId) {
		
		////保存題目
		//會員ID、題目bean、marker(標記)
		
		MemberBean currentMember = examMemberRes.findById(memberId).get();
		Integer marker = 1;
		List<ExamQuesBean> examQueList = (List<ExamQuesBean>)testMap.get("examQueList");
		
		
		
		for (int i = 0; i < reserveQuIdx.size(); i++) {

			Integer reserveIdx = reserveQuIdx.get(i);
			
			System.err.println("保存考試" + reserveIdx);
			
			List<ExamReserve> checkExist = examReserveRes.findByexamQues_quesID(examQueList.get(reserveIdx).getQuesID());
 
			if(checkExist.isEmpty()) {
				
				ExamReserve reserve = new ExamReserve(examQueList.get(reserveIdx),currentMember,marker);
				examReserveRes.save(reserve);
				
			}else {
				
				continue;
				
			}
			

		}
		
		
	}
	
	//錯題統計
	public int[] getUserStatistic(Integer memberId) {
		
		System.err.println("memberId~~~~~~~~~~~~"+memberId);
		
		//拿出會員考過哪一次test
		MemberBean memberBean = examMemberRes.findById(memberId).get();
		List<ExamRecord> memberRecords =  (List<ExamRecord>) examMemRecordRes.findByMember_userId(memberBean.getuserId());
		
		//包含所有考題的List 不管科目
		List<ExamTestDetail> totalDetailsList = new ArrayList<ExamTestDetail>();
	
		
		//透過Test查詢ExamtestDetail
		for(int i=0;i<memberRecords.size();i++) {
			
			List<ExamTestDetail> examTestDetailsList = examTestDetailRes.findByExamTest(memberRecords.get(i).getExamTest());
			
			totalDetailsList.addAll(examTestDetailsList);
			
		}
		
		//統計錯題參數
		int eng = 0;
		int math = 0;
		int chin = 0;
		
		//創造一個空的detail可以簡化程式碼
		ExamTestDetail detail;
		
		for (int i = 0; i < totalDetailsList.size(); i++) {

			totalDetailsList.get(i).getExamQues().getSubject().getSubjectId();

//			System.err.println("~~~~~~~~~~~~~~~~~~~~~~"+totalDetailsList.get(i).getExamTest().getExamTestId());
			detail = totalDetailsList.get(i);

			// 記錄錯題
			if (!detail.getChooseAns().equals(detail.getExamQues().getQuesAnswer())) {
				
				//依照科目IDX統計錯題
				if (detail.getExamQues().getSubject().getSubjectId() == 1) {
					math += 1;
				} else if (detail.getExamQues().getSubject().getSubjectId() == 2) {
					eng += 1;
				} else {
					chin += 1;
				}

			}

		}
		
		System.err.println("~~~~~~~~~"+math);
		System.err.println("~~~~~~~~~"+eng);
		System.err.println("~~~~~~~~~"+chin);
		
		int[] statistic = {math,eng,chin};
		
		
		
		
		return statistic;
	}
	
	
	
	
	//重新考試
	public Map<String, Object> reTest(String examRecordId){
		
		//建立Map儲存考試相關物件
		Map<String, Object> reTestMap = new HashedMap();
		
		ExamRecord memRecord = examMemRecordRes.findById(Integer.valueOf(examRecordId)).get();
		
//		System.err.println("ser");
		
		//調出考卷
		ExamBean examBean = memRecord.getExamTest().getExam();
		
		//找出考題
//		List<ExamQuesBean> examQuesList = examQuRes.findQues(examBean.getSubject().getSubjectId(),examBean.getEducation().getEducationId());
		List<ExamQuesBean> examQuList = examQuRes.findByExam_ExamID(Integer.valueOf(examBean.getExamID()));
		
		reTestMap.put("examBean", examBean); //哪張考卷
		reTestMap.put("examQuList", examQuList); 

		return reTestMap;

	}
	
	
	////////////////////考試////////////////////考試////////////////////考試
	
	public void reTestShowScore(Map<String, Object> retestMap) {
		////ExamRecord紀錄考試相關資訊
		//會員ID、分數、對應哪次考試
		
		//拿到題目
		List<ExamQuesBean> examQueList = (List<ExamQuesBean>)retestMap.get("examQueList");
//		List<String> chooseAnsList = (List<String>)testMap.get("chooseList");
		
		
		////紀錄會員的回答
		//String[i][0] 錯第幾題
		//String[i][1] 錯誤題目選哪個選項
		List<String> wrongNumList = new ArrayList<String>();
		
		//對答案
		int ctCount =0;
		Integer score = 0;
		for(int i=0;i<examQueList.size();i++) {
			
			String chooseAns = examQueList.get(i).getChooseAns();
			
			if (chooseAns.equals(examQueList.get(i).getQuesAnswer())) {
				ctCount++;
				score += examQueList.get(i).getQuesScore();
			}else {
				wrongNumList.add(String.valueOf(i));
			}
		}
		
		
		
		//checkAns對答案，算分數
		retestMap.put("reExamScore", score);
		
	
		
	}
	
}

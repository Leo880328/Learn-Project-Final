package fourth.service;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

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
		System.err.println(examBean);
		System.err.println(examID);
		//找出考題
		List<ExamQuesBean> examQuesList = examQuRes.findQues(examBean.getSubject().getSubjectId(),examBean.getEducation().getEducationId());
		
		//建立考試紀錄
		ExamTest examTest = new ExamTest(examBean);
		examTestRes.save(examTest);
		
		//紀錄考卷內容
		for(int i=0;i<examQuesList.size();i++) {
			
			
			ExamTestDetail examTestDetail = new ExamTestDetail(examTest, examQuesList.get(i));
			examTestDetailRes.save(examTestDetail);
		}
		
		testMap.put("examName", examBean.getExamName()); //紀錄考試名字，預防刪除後會員看不到考卷名
		testMap.put("examBean", examBean); //哪張考卷
		testMap.put("examTest", examTest); //哪次考試
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
		
		////紀錄會員的回答
		//String[i][0] 錯第幾題
		//String[i][1] 錯誤題目選哪個選項
		List<String> wrongNumList = new ArrayList<String>();
		
		//對答案
		int ctCount =0;
		
		for(int i=0;i<examQueList.size();i++) {
			if (examQueList.get(i).getChooseAns().equals(examQueList.get(i).getQuesAnswer())) {
				ctCount++;
			}else {
				wrongNumList.add(String.valueOf(i));
			}
		}
		
		//checkAns對答案，算分數
		Integer score = 20*ctCount;
		testMap.put("examScore", score);
		
		//抓取是哪次考試
		ExamTest examTest = (ExamTest)testMap.get("examTest");
		
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
	
	
	
	
	
	
	////////////////////考試////////////////////考試////////////////////考試
	
}

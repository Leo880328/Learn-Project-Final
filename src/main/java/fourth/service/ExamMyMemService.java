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
public class ExamMyMemService  {
	
	
	//創建考試有哪些題目
	@Autowired
	private ExamTestDetailRepository examTestDetailRes;

	//紀錄哪個會員考哪個考試
	@Autowired
	private ExamMemRecordRepository examMemRecordRes;
	
	//保存考試題目
	@Autowired
	private ExamReserveRepository examReserveRes;
	
	
	//收藏查詢全部
	public List<ExamReserve> resSelectAll(){
		return examReserveRes.findAll();
	}
	
	//收藏刪除
	public void resDelete(Integer examId) {
		
		examReserveRes.deleteById(examId);
		
	}
	
	//考卷查詢
	public List<ExamRecord> ExamRecordSelectAll(Integer memberId){
		return examMemRecordRes.findByMember_userId(memberId);
	}
	
	
	//考試刪除
	public void ExamRecordDelete(Integer recordId) {
		
	
		examMemRecordRes.deleteById(recordId);
		
	}
	
}

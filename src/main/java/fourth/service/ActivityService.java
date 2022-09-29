package fourth.service;

import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fourth.bean.ActivityBean;
import fourth.bean.ActivityReviewBean;
import fourth.dao.ActivityRepository;
import fourth.dao.ActivityReviewRepository;

@Service
@Transactional
public class ActivityService {

	@Autowired
	private ActivityRepository activityRepository;

	@Autowired
	private ActivityReviewRepository activityReviewRepository;

	// 顯示所有活動
	public Page<ActivityBean> selectAllActivity(Pageable pageable) {
		Page<ActivityBean> activityBeans = activityRepository.findAll(pageable);
		return activityBeans;

	}

	// 題目
	public Page<ActivityBean> selectAllByTitleLike(Pageable pageable, String keyWord) {
		Page<ActivityBean> findAllByTitleLike = activityRepository.findAllByTitleLike(pageable, "%" + keyWord + "%");
		return findAllByTitleLike;
	}

	// 顯示在期限內
	public Page<ActivityBean> seletAllByTodayInTerm(Pageable pageable) {
		Page<ActivityBean> findAllByStartTimeAfterAndEndTimeBefore = activityRepository
				.findAllByBetweenActivityTime(pageable, new Date());
		return findAllByStartTimeAfterAndEndTimeBefore;
	}

	public ActivityBean selectActivityById(Integer id) {
		Optional<ActivityBean> findById = activityRepository.findById(id);
		if (findById.isPresent()) {
			return findById.get();
		}
		return null;

	}

	// 新增活動資料
	public ActivityBean insertActivities(ActivityBean activity) {
		if (activity != null) {
			activity.setStatusCode(ActivityBean.STATUS_DRAFT);
			return activityRepository.save(activity);
		}
		return null;
	}

	// 調用資料庫更新活動
	public ActivityBean updateActivities(ActivityBean activity) {
		if (activity != null) {
			activity.setStatusCode(ActivityBean.STATUS_DRAFT);
			return activityRepository.save(activity);
		}
		return null;
	}

	// 調用資料庫刪除活動
	@SuppressWarnings("unused")
	public boolean deleteActivities(ActivityBean activity) {
		Integer id = activity.getId();
		if (id != null) {
			activityRepository.delete(activity);
			return true;
		}
		return false;
	}

	// ======================================================================================================
	
	//辦理活動者查看狀態
	public Page<ActivityReviewBean> findAllByActivityId(Pageable pageable, int activityId) {
		return activityReviewRepository.findAllByActivityId(pageable, activityId);	
	}
	//管理者查看需要審核
	public Page<ActivityReviewBean> findAllByActivityReviewing(Pageable pageable) {
		return activityReviewRepository.findAllByStatusCode(pageable,ActivityReviewBean.STATUS_REVIEW_ING );	
	}

	// 活動送審核
	public String activityReviewing(int activityById, String message) {
		ActivityBean selectActivityById = this.selectActivityById(activityById);
		selectActivityById.setStatusCode(ActivityBean.STATUS_REVIEWING);
		// log
		activityReviewRepository
				.save(new ActivityReviewBean(activityById, message, ActivityReviewBean.STATUS_REVIEW_ING));
		ActivityBean updateActivities = this.updateActivities(selectActivityById);
		return "true";
	}

	// 活動審核失敗
	public String activityReviewFail(int activityById , String message) {
		ActivityBean selectActivityById = this.selectActivityById(activityById);
		selectActivityById.setStatusCode(ActivityBean.STATUS_DRAFT);
		// log
		activityReviewRepository
				.save(new ActivityReviewBean(activityById, message, ActivityReviewBean.STATUS_REVIEW_FAIL));
		ActivityBean updateActivities = this.updateActivities(selectActivityById);
		return "true";
	}

	// 活動審核失敗
	public String activityRviewSuccessful(int activityById, String message) {
		ActivityBean selectActivityById = this.selectActivityById(activityById);
		selectActivityById.setStatusCode(ActivityBean.STATUS_FINAL);
		// log
		activityReviewRepository
				.save(new ActivityReviewBean(activityById, message, ActivityReviewBean.STATUS_REVIEW_SUCCESSFUL));
		ActivityBean updateActivities = this.updateActivities(selectActivityById);
		return "true";
	}

}

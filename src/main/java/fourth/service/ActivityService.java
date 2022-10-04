package fourth.service;

import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fourth.bean.ActivityAttendeesBean;
import fourth.bean.ActivityBean;
import fourth.bean.ActivityReviewBean;
import fourth.dao.ActivityAttendeesRepository;
import fourth.dao.ActivityRepository;
import fourth.dao.ActivityReviewRepository;

@Service
@Transactional
public class ActivityService {

	@Autowired
	private ActivityRepository activityRepository;

	@Autowired
	private ActivityReviewRepository activityReviewRepository;

	@Autowired
	private ActivityAttendeesRepository activityAttendeesRepository;

	// 顯示所有活動
	public Page<ActivityBean> selectAllActivity(Pageable pageable) {
		Page<ActivityBean> activityBeans = activityRepository.findAll(pageable);
		return activityBeans;

	}

	// 題目
	public Page<ActivityBean> selectActivityByTitleLike(Pageable pageable, String keyWord) {
		Page<ActivityBean> findAllByTitleLike = activityRepository.findAllByTitleLike(pageable, "%" + keyWord + "%");
		return findAllByTitleLike;
	}

	// 顯示在期限內
	public Page<ActivityBean> selectActivityByTodayInTerm(Pageable pageable) {
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
	public ActivityBean insertActivity(ActivityBean activity) {
		if (activity != null) {
			return activityRepository.save(activity);
		}
		return null;
	}

	// 調用資料庫更新活動
	public ActivityBean updateActivity(ActivityBean activity) {
		if (activity != null) {
			return activityRepository.save(activity);
		}
		return null;
	}

	// 調用資料庫刪除活動
	public boolean deleteActivity(int activityId) {
		Optional<ActivityBean> activity = activityRepository.findById(activityId);

		if (activity.isPresent()) {
			activityRepository.delete(activity.get());
			return true;
		}
		return false;
	}

	// ======================================================================================================

	public Page<ActivityBean> selectAllActivityByUserId(Pageable pageable, int userId) {
		return activityRepository.findAllByUserId(pageable, userId);
	}

	public Page<ActivityBean> selectPublicActivityByUserId(Pageable pageable, int userId) {
		return activityRepository.findAllByUserIdAndStatusCode(pageable, userId, ActivityBean.STATUS_PUBLIC);
	}

	// 辦理活動者查看狀態紀錄
	public Page<ActivityReviewBean> selectReviewByActivityId(Pageable pageable, int activityId) {
		return activityReviewRepository.findAllByActivityId(pageable, activityId);
	}

	// 讀取參加者名單
	public Page<ActivityAttendeesBean> selectAttendeesByActivityId(Pageable pageable, int activityId) {
		return activityAttendeesRepository.findAllByActivityID(pageable, activityId);

	}

	// 讀取有效參加者名單
	public Page<ActivityAttendeesBean> selectEffectiveAttendeesByActivityId(Pageable pageable, int activityId) {
		return activityAttendeesRepository.findRegisterEffectiveByUserID(pageable, activityId);

	}

	// 調取使用者參加活動名單
	public Page<ActivityAttendeesBean> selectAttendeesByUserId(Pageable pageable, int userId) {
		return activityAttendeesRepository.findAllByUserID(pageable, userId);

	}

	// 拿取目前參加者數量
	public int getActivityFindEffectiveNumber(int activityId) {
		return  activityAttendeesRepository.findEffectiveNumberByActivityID(activityId);
	}

	// =======================================================================================================
	// 管理者查看需要審核
	public Page<ActivityBean> selectReviewingActivity(Pageable pageable) {
		return activityRepository.findAllByStatusCode(pageable, ActivityBean.STATUS_REVIEW_ING);
	}

	// 活動審核失敗
	public String activityReviewFalse(int activityById, String message) {
		ActivityBean selectActivityById = this.selectActivityById(activityById);
		selectActivityById.setStatusCode(ActivityBean.STATUS_REVIEW_FAIL);
		//log
		ActivityReviewBean activityReviewBean = new ActivityReviewBean(activityById, message, ActivityBean.STATUS_REVIEW_FAIL);
		activityReviewRepository.save(activityReviewBean);
		this.updateActivity(selectActivityById);
		return "true";
	}

	// 活動審核成功
	public String activityRviewTrue(int activityById) {
		ActivityBean selectActivityById = this.selectActivityById(activityById);
		selectActivityById.setStatusCode(ActivityBean.STATUS_PUBLIC);
		//log
		ActivityReviewBean activityReviewBean = new ActivityReviewBean(activityById, null, ActivityBean.STATUS_REVIEW_FAIL);
		activityReviewRepository.save(activityReviewBean);
		
		this.updateActivity(selectActivityById);
		return "true";
	}

	// =================================================================================================================

	// 報名活動
	public String insertActivityAttendees(ActivityBean activityBean, int userId) {
		if (activityBean.getNumberLimit() > getActivityFindEffectiveNumber(activityBean.getId())) {
			ActivityAttendeesBean activityAttendeesBean = new ActivityAttendeesBean();
			activityAttendeesBean.setActivity(activityBean);
			activityAttendeesBean.setUserId(userId);
			activityAttendeesRepository.save(activityAttendeesBean);

			if (getActivityFindEffectiveNumber(activityBean.getId()) >= activityBean.getNumberLimit()) {
				activityBean.setStatusCode(ActivityBean.STATUS_NON_PUBLIC);
			}
			return "報名成功";
		}
		return "人數已滿";
	}
}

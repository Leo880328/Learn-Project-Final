package fourth.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fourth.bean.ActivityAttendeesBean;
import fourth.bean.ActivityBean;
import fourth.bean.ActivityReviewBean;
import fourth.bean.MemberBean;
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
	public ActivityBean insertActivities(ActivityBean activity) {
		if (activity != null) {
			activity.setStatusCode(ActivityBean.STATUS_UNFINISHED);
			return activityRepository.save(activity);
		}
		return null;
	}

	// 調用資料庫更新活動
	public ActivityBean updateActivities(ActivityBean activity) {
		if (activity != null) {
			activity.setStatusCode(ActivityBean.STATUS_UNFINISHED);
			return activityRepository.save(activity);
		}
		return null;
	}

	// 調用資料庫刪除活動
	public boolean deleteActivities(int activityId) {
		Optional<ActivityBean> activity = activityRepository.findById(activityId);

		if (activity.isPresent()) {
			activityRepository.delete(activity.get());
			return true;
		}
		return false;
	}

	// ======================================================================================================

	// 辦理活動者查看狀態
	public Page<ActivityReviewBean> selectReviewByActivityId(Pageable pageable, int activityId) {
		return activityReviewRepository.findAllByActivityId(pageable, activityId);
	}

	// 管理者查看需要審核
	public Page<ActivityReviewBean> selectReviewByActivityReviewing(Pageable pageable) {
		return activityReviewRepository.findAllByStatusCode(pageable, ActivityReviewBean.STATUS_REVIEW_ING);
	}

	// 活動送審核
	public String activityReviewing(int activityById, String message) {
		ActivityBean selectActivityById = this.selectActivityById(activityById);
		// log
		ActivityReviewBean activityReviewBean = new ActivityReviewBean(activityById, message,
				ActivityReviewBean.STATUS_REVIEW_ING);
		activityReviewRepository.save(activityReviewBean);
		this.updateActivities(selectActivityById);
		return "true";
	}

	// 活動審核失敗
	public String activityReviewFail(int activityById, String message) {
		ActivityBean selectActivityById = this.selectActivityById(activityById);
		// log
		activityReviewRepository
				.save(new ActivityReviewBean(activityById, message, ActivityReviewBean.STATUS_REVIEW_FAIL));
		this.updateActivities(selectActivityById);
		return "true";
	}

	// 活動審核失敗
	public String activityRviewSuccessful(int activityById, String message) {
		ActivityBean selectActivityById = this.selectActivityById(activityById);
		selectActivityById.setStatusCode(ActivityBean.STATUS_PUBLIC);
		// log
		activityReviewRepository
				.save(new ActivityReviewBean(activityById, message, ActivityReviewBean.STATUS_REVIEW_SUCCESSFUL));
		this.updateActivities(selectActivityById);
		return "true";
	}

	// =================================================================================================================
	// 讀取參加者名單
	public List<ActivityAttendeesBean> selectAttendeesByActivityId(int activityId) {
		List<ActivityAttendeesBean> findAttendeesByActivityID = activityAttendeesRepository
				.findAllByActivityID(activityId);
		return findAttendeesByActivityID;
	}

	public List<ActivityAttendeesBean> selectAttendeesByUserId(int userId) {
		List<ActivityAttendeesBean> findAttendeesByActivityID = activityAttendeesRepository.findAllByUserID(userId);
		return findAttendeesByActivityID;
	}

//	拿取目前參加者數量
	public int getActivityParticipantsNumber(int activityId) {
		List<ActivityAttendeesBean> selectAttendeesByActivityId = selectAttendeesByActivityId(activityId);
		return selectAttendeesByActivityId.size();
	}

//	報名活動
	public String insertActivityAttendees(ActivityBean activityBean, MemberBean memberBean) {
		if (activityBean.getParticipantLimit() > getActivityParticipantsNumber(activityBean.getId())) {
			ActivityAttendeesBean activityAttendeesBean = new ActivityAttendeesBean();
			activityAttendeesBean.setActivity(activityBean);
			activityAttendeesBean.setUser(memberBean);
			activityAttendeesRepository.save(activityAttendeesBean);

			if (getActivityParticipantsNumber(activityBean.getId()) >= activityBean.getParticipantLimit()) {
				activityBean.setStatusCode(ActivityBean.STATUS_FINISHED);
			}
			return "報名成功";
		}
		return "人數已滿";
	}
}

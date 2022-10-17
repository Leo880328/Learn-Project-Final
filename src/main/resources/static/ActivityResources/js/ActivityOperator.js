let jquery = {
    reviewingActivity: ".reviewingActivity",
    readMoreReviewingButton: ".readMoreReviewingButton",
}
let reviewingActivityPage = {
    pageSize: 100,
    pageNo: 1,
    totalPages: 1
}
$().ready(
    // 取直並將ActivityBean送出等待回應
    function () {
        requestReviewingActivities();
        listener();
    }

)
function listener() {
    $(jquery.readMoreReviewingButton).click(() => {
        readMoreReviewingActivities();
    });
}
function requestReviewingActivities() {
    $.ajax({
        url: "ActivityOperator/all",
        method: "POST",
        dataType: "JSON",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(reviewingActivityPage),
        success: function (reviewingArray) {
            $('.table').DataTable().clear()
            reviewingArray.content.forEach(function (attendees, index, array) {
                let table = $('.table').DataTable();
                table.row.add(createReviewingActivityInformation(attendees));
                // $(jquery.reviewingActivity).append(createReviewingActivityInformation(activity))
            });

            reviewingActivityPage.totalPages = reviewingActivityPage.totalPages;
            if (reviewingActivityPage.pageNo < reviewingActivityPage.totalPages) {
                $(jquery.readMoreReviewingButton).css('visibility', 'visible')
            } else {
                $(jquery.readMoreReviewingButton).css('visibility', 'hidden')
            }
            $('.table').DataTable().draw()
        },
        error: function (err) { alert("資料獲取失敗，請刷新網頁!") },
    })
}
function createReviewingActivityInformation(activity) {
    let title = activity.title;
    let time = activity.startTime + "~" + activity.endTime;
    let place = activity.place;
    [1, 2, 3, 4,]

    let activityBean = [`<a  href="javascript:void(0);"  onclick="windowOpen(${activity.id})">${title}</a>`, activity.startTime + "~" + activity.endTime, 15, activity.place]
    return activityBean;
}
function readMoreReviewingActivities() {
    reviewingActivityPage.pageNo++;
    requestReviewingActivities();
}
function windowOpen(activityId) {
    let new_window = window.open(`ActivityOperator/activity/${activityId}`, "活動預覽", config = 'height=500,width=1000,toolbar=no,status=no');
    let windowClosed = setInterval(function () {
        if (new_window.closed) {
            clearInterval(windowClosed);
            requestReviewingActivities();
        }
    }, 1000);
}
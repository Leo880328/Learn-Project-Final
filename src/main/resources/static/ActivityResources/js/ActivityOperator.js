let jquery = {
    reviewingActivity: ".reviewingActivity",
    readMoreReviewingButton: ".readMoreReviewingButton",
}
let reviewingActivityPage = {
    pageSize: 4,
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
        success: function (activityArray) {
            activityArray.content.forEach(function (activity, index, array) {
                let table = $('.table').DataTable();
                // console.log($.fn.dataTable.tables());
                // console.log(table);
                table.row.add(createReviewingActivityInformation(activity)).draw();
                // $(jquery.reviewingActivity).append(createReviewingActivityInformation(activity))
            });

            reviewingActivityPage.totalPages = reviewingActivityPage.totalPages;
            if (reviewingActivityPage.pageNo < reviewingActivityPage.totalPages) {
                $(jquery.readMoreReviewingButton).css('visibility', 'visible')
            } else {
                $(jquery.readMoreReviewingButton).css('visibility', 'hidden')
            }
        },
        error: function (err) { alert("資料獲取失敗，請刷新網頁!") },
    })
}
function createReviewingActivityInformation(activity) {
    let title = activity.title;
    let time = activity.startTime + "~" + activity.endTime;
    let place = activity.place;
    let activityInformation =
        `
    <tr>
        <td><a href="">${title}</a> </td>
        <td>${time}</td>
        <td>15</td>
        <td>${place}</td>
    </tr>
    `
    // let activityBean = {
    //     title: activity.title,
    //     time: activity.startTime + "~" + activity.endTime,
    //     number: 15,
    //     place: activity.place
    // }
    let activityBean = [`<a href="">${title}</a>`, activity.startTime + "~" + activity.endTime, 15, activity.place]

    // return activityInformation
    return activityBean;
}
function readMoreReviewingActivities() {
    reviewingActivityPage.pageNo++;
    requestReviewingActivities();
}
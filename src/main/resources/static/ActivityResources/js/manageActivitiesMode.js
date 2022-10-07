
let activityStatusCode = [
    "審核中", "審核失敗", "已完成", "上架中"
]
let jquery = {
    publicActivity: ".publicActivity",
    allActivity: ".allActivity",
    readMorePublicButton: ".readMorePublicButton",
    readMoreAllButton: ".readMoreAllButton",

}
let publicActivityPage = {
    pageSize: 4,
    pageNo: 1,
    totalPages: 1
}
let allActivityPage = {
    pageSize: 4,
    pageNo: 1
}

$().ready(
    // 取直並將ActivityBean送出等待回應
    function () {
        requestPublicActivities();
        requestAllActivities();
        listener();

    }
)
function listener() {
    $(jquery.readMorePublicButton).click(() => {
        readMorePublicActivities()
    });

    $(jquery.readMoreAllButton).click(() => {
        readMoreAllActivities()
    });
}

function requestPublicActivities() {
    $.ajax({
        url: "ManageActivities/Public",
        method: "POST",
        dataType: "JSON",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(publicActivityPage),
        success: function (activityPageArray) {
            activityPageArray.content.forEach(function (activity, index, array) {
                $(jquery.publicActivity).append(createPublicActivityInformation(activity))
            });

            publicActivityPage.totalPages = activityPageArray.totalPages;
            if (publicActivityPage.pageNo < publicActivityPage.totalPages) {
                $(jquery.readMorePublicButton).css('visibility', 'visible')
            } else {
                $(jquery.readMorePublicButton).css('visibility', 'hidden')
            }
        },
        error: function (err) { alert("資料獲取失敗，請刷新網頁!") },
    })
}
function createPublicActivityInformation(activity) {
    let place = activity.place;
    if (!place) {
        place = "線上"
    }

    let activityInformation =
        `
    <tr style="height: 50px;">
        <td class="u-border-1 u-border-grey-40 u-table-cell"><a href="Activity/${activity.id}">${activity.title}</a></td>
        <td class="u-border-1 u-border-grey-40 u-table-cell">${activity.startTime}~${activity.endTime}</td>
        <td class="u-border-1 u-border-grey-40 u-table-cell"><a>${activity.numberLimit}</a></td>
        <td class="u-border-1 u-border-grey-40 u-table-cell">${place}</td>
    </tr>
    `
    return activityInformation
}
function readMorePublicActivities() {
    publicActivityPage.pageNo++;
    requestPublicActivities();
}
//===================================================================================
function requestAllActivities() {
    $.ajax({
        url: "ManageActivities/All",
        method: "POST",
        dataType: "JSON",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(allActivityPage),
        success: function (activityPageArray) {
            activityPageArray.content.forEach(function (activity, index, array) {
                $(jquery.allActivity).append(createAllActivityInformation(activity))
            });
            allActivityPage.totalPages = activityPageArray.totalPages;
            if (allActivityPage.pageNo < allActivityPage.totalPages) {
                $(jquery.readMoreAllButton).css('visibility', 'visible')
            } else {
                $(jquery.readMoreAllButton).css('visibility', 'hidden')

            }
        },
        error: function (err) { alert("資料獲取失敗，請刷新網頁!") },
    })
}
function createAllActivityInformation(activity) {
    let place = activity.place;
    if (!place) {
        place = "線上"
    }

    let activityInformation =
        `
    <tr style="height: 50px;">
        <td class="u-border-1 u-border-grey-40 u-table-cell"><a href="Activity/${activity.id}">${activity.title}</a></td>
        <td class="u-border-1 u-border-grey-40 u-table-cell">${activity.startTime}~${activity.endTime}</td>
        <td class="u-border-1 u-border-grey-40 u-table-cell"><a class="button"  onclock="selectReviewByActivitiesID(${activity.id})">${activityStatusCode[activity.statusCode]}</a></td>
        <td class="u-border-1 u-border-grey-40 u-table-cell">${place}</td>
    </tr>
    `
    return activityInformation
}
function readMoreAllActivities() {
    allActivityPage.pageNo++;
    requestAllActivities();
}
// =====================================================================================
function selectReviewByActivitiesID(id) {
    let activityBean = {
        activityId: id
    }
    $.ajax({
        url: `ManageActivities/Review/${id}`,
        method: "POST",
        dataType: "JSON",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(activityBean),
        success: function (reviewPageArray) {
            Swal.fire({
                width: "1100px",
                html: selectActivity(reviewPageArray),
                stopKeydownPropagation: false
            })
        },
        error: function (err) { alert("資料獲取失敗，請刷新網頁!") },
    });
}




function createAllActivityInformation(review) {
    let reviewArrayInformation =
        `
    <tr style="height: 50px;">
        <td class="u-border-1 u-border-grey-40 u-table-cell">${review.message}</td>
        <td class="u-border-1 u-border-grey-40 u-table-cell">${activityStatusCode[review.statusCode]}</td>
        <td class="u-border-1 u-border-grey-40 u-table-cell">${review.requestTime}</td>
    </tr>
    `
    return reviewArrayInformation
}
const jquery = {
    activityImage: ".activityImage",
    activityTitle: ".activityTitle",
    activityContent: ".activityContent",
    activityInformation: ".activityInformation",

}
let activitiesId;
$().ready(
    function () {
        let idIndexOf = window.location.href.split("/");
        console.log(idIndexOf)
        activitiesId = idIndexOf[idIndexOf.length - 1]
        console.log(activitiesId)
        if (activitiesId > 1) {
            requestActivity()
        } else {
            alert('錯誤導入方式!')
        }
    }
)
function requestActivity() {
    $.ajax({
        url: `Activity/Activity${activitiesId}`,
        method: "POST",
        dataType: "JSON",
        success: function (activity) {
            updateView(activity);
        },
        error: function (err) { alert("該活動已失效!") },
    })
}
function joinActivity() {
    console.log(`myActivities/join${activitiesId}`)
    $.ajax({
        url: `myActivities/join${activitiesId}`,
        method: "POST",
        dataType: "JSON",
        success: function (data) {
            console.log(data);
        },
        error: function (err) {
            alert("參加失敗!");
            console.log(err)
        },
    })
}
function updateView(activity) {
    $(jquery.activityImage).attr("src", activity.activityImage)
    $(jquery.activityTitle).html(activity.title)
    $(jquery.activityContent).html(activity.content)
    let place = "線上"
    if (activity.place) {
        place = `${activity.place} ${activity.address}`;
    }
    $(jquery.activityInformation).html(`
    可報名人數:${activity.numberLimit}<br>
    活動時間:${activity.startTime} ~ ${activity.endTime}<br>
    活動地點:${place}
    `)
}
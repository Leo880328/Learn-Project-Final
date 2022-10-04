const jquery = {
    activityTitle: ".activityTitle",
    activityImage: ".activityImage",
    activityContent: ".activityContent",
    activityInformation: ".activityInformation",

}

$().ready(
    function () {
        let idIndexOf = window.location.href.indexOf('-');
        let id = window.location.href.substring(idIndexOf + 1);
        if (id > 1) {
            requestActivity(id)
        } else {
            alert('錯誤導入方式!')
        }
    }
)
function requestActivity(id) {
    $.ajax({
        url: `Activity/Activity${id}`,
        method: "POST",
        dataType: "JSON",
        success: function (activity) {
            updateView(activity);
        },
        error: function (err) { alert("該活動已失效!") },
    })
}
function updateView(activity) {
    $(jquery.activityImage).attr("src", activity.activityImage)
    $(jquery.activityTitle).html(activity.title)
    $(jquery.activityContent).html(activity.content)
    $(jquery.activityInformation).html(`
    可報名人數:${activity.numberLimit}<br>
    活動時間:${activity.startTime} ~ ${activity.endTime}<br>
    活動地點:${activity.place} ${activity.address}
    `)
}
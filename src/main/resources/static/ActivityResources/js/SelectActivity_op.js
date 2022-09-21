$().ready(

    // 取直並將ActivityBean送出等待回應
    function () {
        selectAll()
    }

)
function selectAll() {
    let activityArray;
    $.ajax({
        url: "http://localhost:8080/HappyLearning/Activity.getAll",
        method: "GET",
        dataType: "JSON",
        success: function (res) {

            console.log(Array.isArray(res));
            activityArray = res;
            $("#hrml_content").empty();
            activityArray.forEach(function (activity, index, array) {

                $("#hrml_content").append(creatActivity(activity))
            });
            // 
        },
        error: function (err) { alert("資料獲取失敗，請刷新網頁!") },
    });
}

function creatActivity(ActivityBean) {
    let div = $(`
<form >
    <div class="preview">
        <div class="img_parent">
            <input class="data" name="id" type="text" value="${ActivityBean.id}" /> 
            <img class="activity_img" id="activity_img" src="${ActivityBean.imgPath}" alt="">
        </div>
        <div class="activity_text">
            <input class="title" name="title" type="text" value="${ActivityBean.title}" readonly>
            <textarea class="introduction" name="content" cols="30" required>${ActivityBean.content}</textarea>

        </div>
        <input class="activity_button" type="submit" name="request" value="修改" /> 
        <input class="activity_button" type="submit" name="request" onclick="if( !(confirm('確認刪除?') ) ) return false" value="刪除" />
    </div>
    <br> 
    <input class="activity_start_time" name="start_time" type="datetime-local" value="${ActivityBean.startTime}" readonly />~ 
    <input class="activity_end_time" name="end_time" type="datetime-local" value="${ActivityBean.endTime}" readonly />
</form>
    `);

    return div;
}

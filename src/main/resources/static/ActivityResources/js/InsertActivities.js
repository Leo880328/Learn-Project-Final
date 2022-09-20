
let activityBean = {
    id: "",
    title: "",
    content: "",
    start_time: "",
    end_time: "",
    imgPath: "",
    base64: ""
}

$().ready(
    // 取直並將activityBean送出等待回應
    $("#save").click(function () {
        activityBean.id = null;
        activityBean.title = $("#title");
        activityBean.content = $("#content");
        activityBean.start_time = $("#start_time");
        activityBean.tiend_timetle = $("#end_time");
        activityBean.imgPath = null;

        $.ajax({
            url: "/Activity_OP",
            method: "POST",
            dataType: "JSON",
            data: activityBean,
            success: function (res) { console.log(res) },
            error: function (err) { alert("上傳失敗") },
        });
    }),
    //將圖片檔轉成base64,並儲存到activityBean
    $("#uploadImg").change(function (e) {
        let files = e.target.files[0];
        imageToBase64(files).then(base64 => {
            activityBean.base64 = base64; // 把編碼後的字串return
        }).catch(err => {
            alert("圖片格式錯誤錯誤:" + err)
        });
    })
)

//取今日日期
function getTodayTime(hoursLater) {
    let date = new Date();
    let year = date.getFullYear();
    let month = date.getMonth() + 1;
    let day = date.getDate();
    let hours = date.getHours() + hoursLater;
    let minutes = '0';
    let today = [year, month, day, hours, minutes]
    let now = [];
    today.forEach(element => {
        if (element < 10) {
            element = '0' + element;
        }
        now.push(element)
    });
    let time = now[0] + '-' + now[1] + '-' + now[2] + 'T' + now[3] + ':' + now[4];
    return time
}

//自動調高
function auto_grow(element) {
    element.style.height = "240px";
    element.style.height = (element.scrollHeight) + "px";
}


//圖片預覽
function previewImg(element) {
    if (element.files[0]) {
        $("#activity_img").src = URL.createObjectURL(element.files[0]);
    }
}
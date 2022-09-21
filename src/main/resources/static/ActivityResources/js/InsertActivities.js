
let activitjson = {
    activityBean:
    {
        id: null,
        title: null,
        content: null,
        start_time: null,
        end_time: null,
        imgPath: null
    },
    base64FileBean:
    {
        fileName: null,
        base64: null,
        fileType: null
    }
}

$().ready(



    // 取直並將activityBean送出等待回應
    $("#save").click(function () {
        saveActivity();
    }),
    //將圖片檔轉成base64,並儲存到activityBean
    $("#uploadImg").change(function (e) {
        let file = e.target.files[0];
        updeBase64(file);

    })
)
function saveActivity() {
    activitjson.activityBean.id = null;
    activitjson.activityBean.title = $("#title").val();
    activitjson.activityBean.content = $("#content").val();
    activitjson.activityBean.start_time = $("#start_time").val();
    activitjson.activityBean.tiend_timetle = $("#end_time").val();
    activitjson.activityBean.imgPath = null;
    console.log(activityBean);
    $.ajax({
        url: "/Activity_OP",
        method: "POST",
        dataType: "JSON",
        data: activitjson,
        success: function (res) { console.log(res) },
        error: function (err) { alert("上傳失敗") },
    });
}

function updeBase64(file) {

    new Promise((resolve, reject) => {
        // 建立FileReader物件
        let reader = new FileReader()
        // 註冊onload事件，取得result則resolve (會是一個Base64字串)
        reader.onload = () => { resolve(reader.result) }
        // 註冊onerror事件，若發生error則reject
        reader.onerror = () => { reject(reader.error) }
        // 讀取檔案
        reader.readAsDataURL(file)
    }).then(base64 => {
        activitjson.base64FileBean.fileType = file.type; // 把編碼後的字串return
        activitjson.base64FileBean.base64 = base64; // 把編碼後的字串return
    }).catch(err => {
        alert("圖片格式錯誤錯誤:" + err)
    })
}

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
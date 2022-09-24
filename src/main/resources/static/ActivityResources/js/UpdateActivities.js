let activitjson = {
    activityBean:
    {
        id: null,
        title: null,
        content: null,
        startTime: null,
        endTime: null,
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
    // 取直並將ActivityBean送出等待回應
    function () {

        let url
        let idIndexOf = window.location.href.indexOf('-');
        let id = window.location.href.substring(idIndexOf + 1);
        if (id) {
            selectByID(id)
            activitjson.activityBean.id = id
        }
    },
)
function selectByID(id) {
    $.ajax({
        url: "http://localhost:8080/HappyLearning/ActivitySelect-" + id,
        method: "GET",
        dataType: "JSON",
        success: function (activity) {
            creatActivity(activity);
        },
        error: function (err) { alert("資料獲取失敗，請刷新網頁!") },
    });
}
function saveActivityBean() {
    activitjson.activityBean.title = $("#title").html();
    activitjson.activityBean.content = $("#content").html();
    activitjson.activityBean.startTime = $("#startTime").val();
    activitjson.activityBean.endTime = $("#endTime").val();
    console.log(activitjson.activityBean);


}
function saveActivity() {

    // $.ajax({
    //     url: "/Activity_OP",
    //     method: "POST",
    //     dataType: "JSON",
    //     data: activitjson,
    //     success: function (res) { console.log(res) },
    //     error: function (err) {
    //         Swal.fire({
    //             icon: 'error',
    //             title: '上傳失敗',
    //             text: err
    //         })
    //     },
    // });
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
        $('.u-image-1').attr('src', activitjson.base64FileBean.base64);
    }).catch(err => {
        Swal.fire({
            icon: 'error',
            title: '圖片格式錯誤錯誤',
            text: err
        })
    })
}
function creatActivity(activityBean) {
    $("#title").html(activityBean.title);
    $("#content").html(activityBean.content);
    if (activityBean.imgPath != 'null' && activityBean.imgPath != null) {

    }
    let startTime = new Date(activityBean.startTime)
    let endTime = new Date(activityBean.endTime)
    let activityTime = `活動時間:${startTime.getFullYear()}年${startTime.getMonth()}月${startTime.getDate()}日 ~ ${endTime.getFullYear()}年${endTime.getMonth()}月${endTime.getDate()}日`
    console.log(startTime.getFullYear());
    $("#activityTime").html(activityTime);

}
function changeVal(e) {
    Swal.fire({
        input: 'textarea',
        inputLabel: '標題',
        heightAuto: false,
        customClass: {
            popup: "swal-popup-changeVal",
            input: 'swal-textarea-1'

        },
        inputValue: e.innerHTML,
        inputPlaceholder: '請輸入內容',

        inputValidator: (value) => {
            e.innerHTML = value;
        },
        showCancelButton: true
    })


    console.log(e.innerHTML)
}
function changeH1title(e) {

    Swal.fire({
        title: '標題',
        input: 'text',
        width: '800px',
        inputValue: e.innerHTML,
        //        inputLabel: '請輸入標題',
        inputPlaceholder: '請輸入內容',
        showCancelButton: true,
        inputValidator: (value) => {
            if (!value) {
                return '請輸入標題!'
            } else {
                e.innerHTML = value;
            }
        }
    })

}
function changeimg(e) {
    $("body").append($(`<input type="file" id="avatar" style="display:hidden;"  accept="image/*">`));
    $("#avatar").click();
    $("#avatar").change(function (e) {
        updeBase64(e.target.files[0]);
        $("#avatar").remove();
    })

}
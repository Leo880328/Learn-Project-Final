'use strict'
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
        }
    },
)
function selectByID(id) {
    $.ajax({
        url: "http://localhost:8080/HappyLearning/ActivitySelect-" + id,
        method: "GET",
        dataType: "JSON",
        success: function (activity) {
            activitjson.activityBean = activity;
            activitjson.activityBean.id = id
            changeHtmlActivity();
        },
        error: function (err) { alert("資料獲取失敗，請刷新網頁!") },
    });
}
function saveActivityBean() {

    console.log(activitjson.activityBean);
    console.log(JSON.stringify(activitjson));
    $.ajax({
        url: "Activity_OP",
        method: "PUT",
        dataType: "JSON",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(activitjson),
        success: function (res) {
            $("body").append($(`<form action="ActivitiesOP" method="GET" id="onlyPost"></form>`))
            $("#onlyPost").submit()
        },
        error: function (err) {
            Swal.fire({
                icon: 'error',
                title: '上傳失敗',
                text: err
            })
        },
    });

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
function changeHtmlActivity() {
    $("#title").html(activitjson.activityBean.title);
    $("#content").html(activitjson.activityBean.content);
    if (activitjson.activityBean.imgPath != 'null' && activitjson.activityBean.imgPath > 0) {
        $("#imgPath").attr('src', activitjson.activityBean.imgPath)
    }
    let activityTime = `活動時間:${activitjson.activityBean.startTime} ~ ${activitjson.activityBean.endTime}`
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
            activitjson.activityBean.content = value;
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
                activitjson.activityBean.title = value
            }
        }
    })

}
function changeimg(e) {
    $("#avatar").click();
    $("#avatar").change(function (e) {
        updeBase64(e.target.files[0]);
    })

}
function changeTime(e) {
    let startTime;
    let endTime;
    Swal.fire({
        title: '<h2>請輸入時間<h2>',
        width: "690px",
        html: `
                <h4  id="activityTime"  class="u-text u-text-default u-text-4">
                    <div> 
                    <input type="datetime-local" id="startTime" value="${activitjson.activityBean.startTime}"> ~ <input type="datetime-local" id="endTime" value="${activitjson.activityBean.endTime}" >
                    </div>
                </h4>
                `,
        stopKeydownPropagation: false,

        preConfirm: () => {
            startTime = $(Swal.getPopup().querySelector('#startTime')).val();
            endTime = $(Swal.getPopup().querySelector('#endTime')).val();
            if (startTime < 1 || endTime < 1) {
                Swal.showValidationMessage(`請輸入時間!`)
            } else if (new Date(endTime) <= new Date(startTime)) {
                Swal.showValidationMessage(`結束時間必須大於開始時間`)
            } else if (activitjson.activityBean.id < 1 && new Date(startTime) < new Date()) {
                Swal.showValidationMessage(`開始時間必須比今天大`)
            } else {
                activitjson.activityBean.startTime = startTime.replace("T", " ");
                activitjson.activityBean.endTime = endTime.replace("T", " ");
                changeHtmlActivity();
            }

        }


    })
}

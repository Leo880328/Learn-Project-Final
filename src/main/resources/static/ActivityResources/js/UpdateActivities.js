'use strict'
let activityBean =
{
    id: null,
    title: null,
    content: null,
    startTime: null,
    endTime: null,
    imgPath: null
}


let placeholder = {
    title: "點擊輸入標題",
    content: "請點擊輸入內文"
}
$().ready(
    // 取直並將ActivityBean送出等待回應
    function () {
        let idIndexOf = window.location.href.indexOf('-');
        let id = window.location.href.substring(idIndexOf + 1);
        if (id > 1) {
            selectByID(id)
        }
    },
)
//更新畫面
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
        activityBean.imgPath = base64; // 把編碼後的字串return
        $('.activityImage').attr('src', base64);
    }).catch(err => {
        Swal.fire({
            icon: 'error',
            title: '圖片格式錯誤錯誤',
            text: err
        })
    })
}
function changeH1title() {
    let inputValue = null;
    if (activityBean.title != null) {
        inputValue = $('.activityTitle').html();
    }

    Swal.fire({
        title: '標題',
        input: 'text',
        width: '800px',
        inputValue: inputValue,
        inputPlaceholder: '請輸入內容',
        showCancelButton: true,
        inputValidator: (value) => {
            if (!value) {
                return '請輸入標題!'
            } else {
                activityBean.title = value;
                changeHtml()
            }
        }
    })

}
function changeVal() {
    let inputValue;
    if (activityBean.content != null) {
        inputValue = $('.activityContent').html()
    }
    Swal.fire({
        input: 'textarea',
        inputLabel: '標題',
        heightAuto: false,
        customClass: {
            popup: "swal-popup-changeVal",
            input: 'swal-textarea-1'

        },
        inputValue: inputValue,
        inputPlaceholder: '請輸入內容',

        inputValidator: (value) => {
            $('.activityContent').html(value);
            activityBean.content = value;
        },
        showCancelButton: true
    })
}
function changeimg() {
    $(".activityImgInput").click();
    $(".activityImgInput").change(function (e) {
        updeBase64(e.target.files[0]);
    })

}
function changeTime() {
    let startTime;
    let endTime;
    Swal.fire({
        title: '<h2>請輸入時間<h2>',
        width: "700px",
        html: `
                <h4  id="activityTime"  class="u-text u-text-default u-text-4">
                    <div> 
                    <input type="datetime-local" id="startTime" value="${activityBean.startTime}"> ~ <input type="datetime-local" id="endTime" value="${activityBean.endTime}" >
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
            } else if (activityBean.id < 1 && new Date(startTime) < new Date()) {
                Swal.showValidationMessage(`開始時間必須比今天大`)
            } else {
                activityBean.startTime = startTime.replace("T", " ");
                activityBean.endTime = endTime.replace("T", " ");
                changeHtml();
            }

        }


    })
}

//更新畫面
function changeHtml() {

    if (activityBean.title != null) {
        $(".activityTitle").html(activityBean.title);
    } else {
        $(".activityTitle").html(placeholder.title);
    }
    if (activityBean.content != null) {
        $(".activityContent").html(activityBean.content);
    } else {
        $(".activityContent").html(placeholder.content);
    }
    if (activityBean.imgPath != 'null' && activityBean.imgPath != null) {
        $(".activityImage").attr('src', activityBean.imgPath)
    }
    let activityTime = `活動時間:${activityBean.startTime} ~ ${activityBean.endTime}`
    $(".activityTime").html(activityTime);

}
//送出請求
function selectByID(id) {
    $.ajax({
        url: "http://localhost:8080/HappyLearning/ActivitySelect-" + id,
        method: "GET",
        dataType: "JSON",
        success: function (activity) {
            activityBean = activity;
            changeHtml();
        },
        error: function (err) { alert("資料獲取失敗，請刷新網頁!") },
    });
}
function saveActivityBean() {
    // let activityBean = activityBean
    if (!activityBean.title > 0) {
        Swal.fire({
            icon: 'error',
            title: '上傳失敗',
            text: "標題為空"
        })
    } else if (!activityBean.content > 0) {
        Swal.fire({
            icon: 'error',
            title: '上傳失敗',
            text: "內容為空"
        })
    } else if (!activityBean.startTime > 0 || !activityBean.endTime > 0) {
        Swal.fire({
            icon: 'error',
            title: '上傳失敗',
            text: "時間為空"
        })
    } else {
        let reqMethod = "PUT";
        if (!activityBean.id > 0) {
            reqMethod = "POST"
        }

        $.ajax({
            url: "Activity_OP",
            method: reqMethod,
            dataType: "JSON",
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(activityBean),
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



}
function delectActivity() {

    Swal.fire({
        icon: 'warning',
        title: '確定是否刪除',
        text: `請在下方輸入框中輸入: ${activityBean.id} 來確認刪除!`,
        input: 'text',
        showCancelButton: true,
        inputValidator: (value) => {
            if (value != activityBean.id) {
                return "驗證碼錯誤!"
            }
            $.ajax({
                url: "Activity_OP",
                type: 'DELETE',
                dataType: "JSON",
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(activityBean),
                success: function (res) {

                    Swal.fire({
                        icon: 'success',
                        title: '刪除成功',
                        text: '刪除成功，請去顯示頁面確認',
                        willClose: function () {
                            $("body").append($(`<form action="ActivitiesOP" method="GET" id="onlyPost"></form>`))
                            $("#onlyPost").submit()
                        }
                    })

                },
                error: function (err) {
                    Swal.fire({
                        icon: 'error',
                        title: '刪除失敗',
                        text: JSON.stringify(err)
                    })
                },
            });
        }
    })



}
'use strict'
let activityBean =
{
    id: null,
    title: null,
    content: null,

    previewImage: null,
    activityImage: null,

    startTime: null,
    endTime: null,
    numberLimit: null,
    place: null,
    address: null,
}
let jquery = {
    activityId: ".activityId",
    activityTitle: ".activityTitle",
    activityContent: ".activityContent",


    activityPreviewInput: ".activityPreviewInput",
    activityPreviewImage: ".activityPreviewImage",

    activityActivityInput: ".activityActivityInput",
    activityActivityImage: ".activityActivityImage",

    activityStartTime: ".activityStartTime",
    activityEndTime: ".activityEndTime",

    activityNumberLimit: ".activityNumberLimit",

    activitySelectPlace: ".activitySelectPlace",

    activityPlace: ".activityPlace",
    activityAddress: ".activityAddress",


    activityPlaceDiv: ".activityPlaceDiv",
    saveActivityButton: ".saveActivityButton"
}

let imgBase64 = null
$().ready(
    // 取直並將ActivityBean送出等待回應
    function () {
        listener();
        let idIndexOf = window.location.href.indexOf('-');
        let id = window.location.href.substring(idIndexOf + 1);
        if (id > 1) {
            selectByID(id)
        }
    },
)

function listener() {
    $(jquery.activityTitle).change(function () {
        activityBean.title = $(jquery.activityTitle).val();

    })
    $(jquery.activityContent).change(function () {
        activityBean.content = $(jquery.activityContent).val();
    })


    $(jquery.activityActivityInput).change(function (e) {
        updeBase64(e.target.files[0])
            .then(base64 => {
                if (base64) {
                    activityBean.activityImage = base64
                    $(jquery.activityActivityImage).attr('src', activityBean.activityImage)
                }
            }).catch(err => {
                errSwal("圖片格式錯誤錯誤", err)
            })
    })
    $(jquery.activityPreviewInput).change(function (e) {
        updeBase64(e.target.files[0])
            .then(base64 => {
                if (base64) {
                    activityBean.previewImage = base64;
                    $(jquery.activityPreviewImage).attr('src', activityBean.previewImage)
                }
            }).catch(err => {
                errSwal("圖片格式錯誤錯誤", err)
            })
    })

    //時間min
    let today = new Date().toISOString().split("T")[0];
    $(jquery.activityStartTime).attr("min", today + " 00:00")
    $(jquery.activityStartTime).change(function (e) {
        activityBean.startTime = $(jquery.activityStartTime).val()
        $(jquery.activityEndTime).val(null)
        $(jquery.activityEndTime).attr("min", $(jquery.activityStartTime).val())
        console.log($(jquery.activityEndTime))

    })
    $(jquery.activityEndTime).change(function (e) {
        activityBean.endTime = $(jquery.activityEndTime).val();
    })

    $(jquery.activityNumberLimit).attr("min", 0)
    $(jquery.activityNumberLimit).change(function () {
        activityBean.numberLimit = $(jquery.activityNumberLimit).val();
    })

    $(jquery.activitySelectPlace).change(
        function () {
            console.log($(jquery.activitySelectPlace).val())
            if ($(jquery.activitySelectPlace).val() == "on-line") {
                activityBean.place = "線上"
                $(jquery.activityPlaceDiv).css("display", "none")
            } else {
                $(jquery.activityPlaceDiv).css("display", "block")
            }
        }
    )
    $(jquery.activityPlace).change(function () {
        activityBean.place = $(jquery.activityPlace).val();
    })
    $(jquery.activityAddress).change(function () {
        activityBean.address = $(jquery.activityAddress).val();
    })
    $(jquery.saveActivityButton).click(function () {
        saveActivityBean()
    })


}
function errSwal(title, text) {
    Swal.fire({
        icon: 'error',
        title: title,
        text: text
    })
}

function updeBase64(file) {

    return new Promise((resolve, reject) => {
        // 建立FileReader物件
        let reader = new FileReader()
        // 註冊onload事件，取得result則resolve (會是一個Base64字串)
        reader.onload = () => { resolve(reader.result) }
        // 註冊onerror事件，若發生error則reject
        reader.onerror = () => { reject(reader.error) }
        // 讀取檔案
        reader.readAsDataURL(file)
    })

}

//更新畫面
function changeHtml() {


    if (activityBean.title) {
        $(jquery.activityTitle).html(activityBean.title);
    }
    if (activityBean.content) {
        $(jquery.activityContent).html(activityBean.content);
    }
    if (activityBean.previewImage) {
        $(jquery.activityPreviewImage).attr('src', activityBean.previewImage)
    }
    if (activityBean.activityImage) {
        $(jquery.activityActivityImage).attr('src', activityBean.activityImage)
    }


    if (activityBean.startTime) {
        $(jquery.activityStartTime).attr('value', activityBean.activityStartTime)
    }
    if (activityBean.endTime) {
        $(jquery.activityEndTime).attr('value', activityBean.endTime)
    }

    if (activityBean.numberLimit) {
        $(jquery.activityEndTime).attr('value', activityBean.numberLimit)
    }


    if (activityBean.place) {
        $(jquery.activityPlace).attr('value', activityBean.place)
    }
    if (activityBean.address) {
        $(jquery.activityAddress).attr('value', activityBean.address)
    }


}
function mouseEventBorder() {
    $(mouseSelection).mouseover(function () {
        $(this).css("background-color", "#333");
    })
    $(mouseSelection).mouseleave(
        function () {
            $(this).css("background-color", "white");
        }
    )
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
    console.log(activityBean);
    if (!activityBean.title) {
        Swal.fire({
            icon: 'error',
            title: '上傳失敗',
            text: "標題為空"
        })
    } else if (!activityBean.content) {
        Swal.fire({
            icon: 'error',
            title: '上傳失敗',
            text: "內容為空"
        })
    } else if (!activityBean.startTime || !activityBean.endTime) {
        Swal.fire({
            icon: 'error',
            title: '上傳失敗',
            text: "時間為空"
        })
    } else if (!activityBean.numberLimit) {
        Swal.fire({
            icon: 'error',
            title: '上傳失敗',
            text: "人數"
        })
    } else if ($(jquery.activitySelectPlace).val() != "on-line") {
        if (!activityBean.place || !activityBean.address) {
            Swal.fire({
                icon: 'error',
                title: '上傳失敗',
                text: "地區為空"
            })
        }
    } else {
        console.log(activityBean);
        // let reqMethod = "POST";
        // if (activityBean.id > 0) {
        //     reqMethod = "PUT"
        // }

        // $.ajax({
        //     url: "Activity_OP",
        //     method: reqMethod,
        //     dataType: "JSON",
        //     contentType: 'application/json; charset=utf-8',
        //     data: JSON.stringify(activityBean),
        //     success: function (res) {
        //         $("body").append($(`<form action="ActivitiesOP" method="GET" id="onlyPost"></form>`))
        //         $("#onlyPost").submit()
        //     },
        //     error: function (err) {
        //         Swal.fire({
        //             icon: 'error',
        //             title: '上傳失敗',
        //             text: err
        //         })
        //     },
        // });
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
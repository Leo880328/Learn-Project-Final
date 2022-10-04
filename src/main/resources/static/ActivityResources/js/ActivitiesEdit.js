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

    activityTitle: ".activityTitle",
    activityContent: ".activityContent",
    activityTime: ".activityTime",
    activityImagePath: ".activityImage",
    activityImgInput: ".activityImgInput",
}
let placeholder = {
    title: "點擊輸入標題",
    content: "請點擊輸入內文",
    startTime: '0000/00/00 00:00',
    endTime: '0000/00/00 00:00'
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
function changeHtml() {
    let startTime = '0000/00/00 00:00';
    let endTime = '0000/00/00 00:00';

    if (activityBean.title != null) {
        $(jquery.activityTitle).html(activityBean.title);
    } else {
        $(jquery.activityTitle).html(placeholder.title);
    }
    if (activityBean.content != null) {
        $(jquery.activityContent).html(activityBean.content);
    } else {
        $(jquery.activityContent).html(placeholder.content);
    }
    if (activityBean.imgPath != 'null' && activityBean.imgPath != null) {
        $(jquery.activityImagePath).attr('src', activityBean.imgPath)
    }
    if (activityBean.startTime != null) {
        placeholder.startTime = activityBean.startTime;
    }
    if (activityBean.endTime != null) {
        placeholder.endTime = activityBean.endTime;
    }
    let activityTime = `活動時間:${placeholder.startTime} ~ ${placeholder.endTime}`
    $(jquery.activityTime).html(activityTime);


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
    // let activityBean = activityBean
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
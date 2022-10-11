let pageRequest = {
    pageSize: 10,
    pageNo: 1,
    keyWord: null
}
let totalPages = 1;
$().ready(

    // 取直並將ActivityBean送出等待回應
    function () {
        selectAll()
    },


)
function selectAll() {
    $.ajax({
        url: "http://localhost:8080/HappyLearning/ActivitySelect",
        method: "POST",
        dataType: "JSON",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(pageRequest),
        success: function (activityArray) {
            totalPages = activityArray.totalPages;
            $(".totalPages").html(pageRequest.pageNo)

            //顯示更新
            $(".u-table-body").empty();
            activityArray.content.forEach(function (activity, index, array) {
                $(".u-table-body").append(creatActivity(activity))
            });
            //判斷是否還有資料
            if (activityArray.content.length < pageRequest.pageSize) {
                $(".u-table-body").append($(`
                <tr style="height: 75px; " >
                 <td class="u-border-1 u-border-grey-40 u-table-cell" >
                 <font color="#FF0000">後面已經沒有資料了!</font>
                 </td>
                 <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                </tr>
                
                `))
            }


            if (pageRequest.pageNo >= totalPages) {
                $(".pageNoIncrease").css('visibility', 'hidden')
            } else {
                $(".pageNoIncrease").css('visibility', 'visible')

            }
            if (pageRequest.pageNo <= 1) {
                $(".pageNoReduce").css('visibility', 'hidden')
            } else {
                $(".pageNoReduce").css('visibility', 'visible')

            }

            mouseEventBorder()


        },
        error: function (err) {
            alert("資料獲取失敗，請刷新網頁!")
        },
    })
}

function search() {
    pageRequest.keyWord = $("#searchBox").val();
    if (!$("#searchBox").val() > 0) {
        pageRequest.keyWord = null;
    }
    selectAll();
    pageRequest.keyWord = null;
}

//動畫
let eventJquery = {
    mouseSelection: ".mouseSelection"

}

function mouseEventBorder() {
    $(eventJquery.mouseSelection).mouseover(
        function () {
            $(this).css("background-color", "#D0D0D0");
        })
    $(eventJquery.mouseSelection).mouseleave(
        function () {
            $(this).css("background-color", "white");
        }
    )

}

function creatActivity(ActivityBean) {
    let div = $(`
    <tr style="height: 75px; cursor: pointer; "  class="mouseSelection" onclick=ActivityUpdate(${ActivityBean.id})>
    <td class="u-border-1 u-border-grey-40 u-table-cell">${ActivityBean.title}</td>
    <td class="u-border-1 u-border-grey-40 u-table-cell">${ActivityBean.endTime}</td>
    </tr>
    `);
    return div;
}
//換頁功能
function pageNoIncrease() {
    if (pageRequest.pageNo < totalPages) {
        pageRequest.pageNo++;
        selectAll()
    }
}
function pageNoReduce() {
    if (pageRequest.pageNo > 1) {
        pageRequest.pageNo--;
        selectAll()
    }
}

//更新按鈕
function ActivityUpdate(id) {
    $("body").append($(`<form action="ActivityOPUpdate-${id}" method="post" id="onlyPost"></form>`))
    $("#onlyPost").submit()
}
//新增按鈕
function ActivityInsert() {
    $("body").append($(`<form action="ActivityOPInsert" method="post" id="onlyPost"></form>`))
    $("#onlyPost").submit()
}
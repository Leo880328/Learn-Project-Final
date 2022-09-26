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
            $(".u-table-body").empty();
            activityArray.content.forEach(function (activity, index, array) {
                $(".u-table-body").append(creatActivity(activity))
            });
            if (activityArray.content.length < pageRequest.pageSize) {
                $(".u-table-body").append($(`
                <tr style="height: 75px; " >
                 <td class="u-border-1 u-border-grey-40 u-table-cell">後面已經沒有資料了!</td>
                 <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                </tr>
                
                `))
            }

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

function creatActivity(ActivityBean) {
    let div = $(`
    <tr style="height: 75px; " onclick=ActivityUpdate(${ActivityBean.id})>
    <td class="u-border-1 u-border-grey-40 u-table-cell">${ActivityBean.title}</td>
    <td class="u-border-1 u-border-grey-40 u-table-cell">${ActivityBean.endTime}</td>
    </tr>
    `);

    return div;
}
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
function ActivityUpdate(id) {
    $("body").append($(`<form action="ActivityOPUpdate-${id}" method="post" id="onlyPost"></form>`))
    $("#onlyPost").submit()
}
function ActivityInsert() {
    $("body").append($(`<form action="ActivityOPInsert" method="post" id="onlyPost"></form>`))
    $("#onlyPost").submit()
}
$().ready(

    // 取直並將ActivityBean送出等待回應
    function () {
        selectAll()
    },


)
function selectAll() {
    let activityArray;
    $.ajax({
        url: "http://localhost:8080/HappyLearning/ActivitySelect",
        method: "GET",
        dataType: "JSON",
        success: function (res) {

            console.log(Array.isArray(res));
            activityArray = res;
            $(".u-table-body").empty();
            activityArray.forEach(function (activity, index, array) {

                $(".u-table-body").append(creatActivity(activity))

            });


        },
        error: function (err) { alert("資料獲取失敗，請刷新網頁!") },
    })
    // .then(
    //     $(".u-table-entity").DataTable()
    // )
}


function creatActivity(ActivityBean) {
    let div = $(`
    <tr style="height: 75px; " onclick=ActivityUpdate(${ActivityBean.id})>
    <td class="u-border-1 u-border-grey-40 u-table-cell">${ActivityBean.id}</td>
    <td class="u-border-1 u-border-grey-40 u-table-cell">${ActivityBean.title}</td>
    </tr>
    `);

    return div;
}

function ActivityUpdate(id) {
    $("body").append($(`<form action="ActivityOPUpdate-${id}" method="post" id="onlyPost"></form>`))
    $("#onlyPost").submit()
}

function ActivityInsert() {
    $("body").append($(`<form action="ActivityOPInsert" method="post" id="onlyPost"></form>`))
    $("#onlyPost").submit()
}
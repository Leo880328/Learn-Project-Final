"use strict"

let pageRequest = {
  pageSize: 4,
  pageNo: 1
}
let totalPages = 1;

let jquery = {
  pageNoIncrease: ".pageNoIncrease",
  pageNoReduce: ".pageNoReduce",
  totalPages: ".totalPages",
  //要加入的class名稱
  activityJoin: ".activityJoin"
}

$().ready(
  // 取直並將ActivityBean送出等待回應
  function () {
    selectAll()
  }
)
function selectAll() {
  console.log(JSON.stringify(pageRequest));

  $.ajax({
    url: "Activity/all",
    method: "POST",
    dataType: "JSON",
    contentType: 'application/json; charset=utf-8',
    data: JSON.stringify(pageRequest),
    success: function (activityArray) {

      console.log(activityArray)

      totalPages = activityArray.totalPages;
      //寫入目前頁數
      //清空並創建activity

      activityArray.content.forEach(function (activity, index, array) {
        $(jquery.activityJoin).append(creatActivity(activity))
      });

      //判斷是否要隱藏下一頁按鈕
      if (pageRequest.pageNo >= totalPages) {
        $(jquery.pageNoIncrease).css('visibility', 'hidden')
      }
    },
    error: function (err) { alert("資料獲取失敗，請刷新網頁!") },
  })

}



function creatActivity(activityBean) {

  let activitytime = new Date(activityBean.startTime);
  activitytime = activitytime.setDate(activitytime.getDate() - 1);
  activitytime = new Date(activitytime)


  let startDay = `報名結束時間:<br>${activitytime.getFullYear()}/${activitytime.getMonth() + 1}/${activitytime.getDate()}`;

  let imgPath = '../assets/images/blog2.jpg';
  if (activityBean.imgPath != 'null' && activityBean.imgPath != null) {
    console.log(activityBean.imgPath)
    imgPath = activityBean.imgPath;
  }


  let div = $(`
    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
      <a href="#">
        <div class="blog-item activity">
          <div class="post-format" style="width: 270px;height:275px ;">
            <img src="${imgPath}" alt="img">
          </div>
          <div class="post-info">
              <div class="category-blog"><a href="#">地點:${activityBean.place}</a></div>
              <h3 class="post-title"><a href="#">${activityBean.title}</a></h3>
              <div class="main-info-post">
                <p class="des activityContent"></p>
              </div>
              <div class="author-view">
                <div class="author">
                  <h3 class="category-blog activityTime ">${startDay}</h3>
                </div>
              </div> 
          </div>
        </div>
      </a>
    </div>
  
    `);
  return div;

}




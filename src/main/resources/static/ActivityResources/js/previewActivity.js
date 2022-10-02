"use strict"

let pageRequest = {
  pageSize: 4,
  pageNo: 1
}
let totalPages = 1;

let jquery = {
  readMoreButton: ".readMoreButton",
  totalPages: ".totalPages",
  //要加入的class名稱
  activityJoin: ".activityJoin"
}


$().ready(
  // 取直並將ActivityBean送出等待回應
  function () {
    selectAll();
    readMoreActivities();
    listener();
  }
)
function listener() {
  $(jquery.readMoreButton).click(readMoreActivities);
}

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
      if (pageRequest.pageNo < totalPages) {
        $(jquery.readMoreButton).css('visibility', 'visible')
      } else {
        $(jquery.readMoreButton).css('visibility', 'hidden')
      }
    },
    error: function (err) { alert("資料獲取失敗，請刷新網頁!") },
  })

}

function creatActivity(activityBean) {

  let activitytime = new Date(activityBean.startTime);
  activitytime = activitytime.setDate(activitytime.getDate() - 1);
  activitytime = new Date(activitytime)


  let startDay = `報名結束時間:${activitytime.getFullYear()}/${activitytime.getMonth() + 1}/${activitytime.getDate()}`;

  let imgPath = '../assets/images/blog2.jpg';
  if (activityBean.imgPath != 'null' && activityBean.imgPath != null) {
    imgPath = activityBean.imgPath;
  }


  let div = $(`
  <li class="product-item  col-lg-3 col-md-4 col-sm-6 col-xs-6 col-ts-12 style-1">
  <div class="product-inner equal-element">
      <div class="product-top">
          <div class="flash"><span class="onnew"><span class="text">new
                  </span></span></div>
      </div>
      <div class="product-thumb preview-image">
          <div class="thumb-inner"><a href="#"><img
                      src="assets/images/product-item-1.jpg" alt="img"></a>

          </div>
      </div>
      <div class="product-info">
          <P>
          <h5 class=" product_title"><a href="#">${activityBean.title}</a>
          </h5>
          </P>
          <div class="group-info ">
              <div class="stars-rating text-align-left">
                  地點:${activityBean.place}
              </div>
              <div class="price text-align-left ">${startDay}
              </div>
          </div>
      </div>
  </div>
</li>
  
    `);
  return div;

}

function readMoreActivities() {
  pageRequest.pageNo++;
  selectAll();
}


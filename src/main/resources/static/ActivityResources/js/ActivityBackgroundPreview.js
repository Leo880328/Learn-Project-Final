const jquery = {
  activityImage: ".activityImage",
  activityTitle: ".activityTitle",
  activityContent: ".activityContent",
  activityInformation: ".activityInformation",
  activityJoin: ".activityJoin"
}
let activitiesId;
$().ready(
  function () {
    let idIndexOf = window.location.href.split("/");
    console.log(idIndexOf)
    activitiesId = idIndexOf[idIndexOf.length - 1]
    console.log(activitiesId)
    if (activitiesId > 1) {
      requestActivity()
    } else {
      alert('錯誤導入方式!')
    }
  }
)
let activityBean;


function requestActivity() {
  $.ajax({
    url: `Activity/Activity${activitiesId}`,
    method: "POST",
    dataType: "JSON",
    success: function (activity) {
      $(jquery.activityJoin).append(creatActivity(activity))
      updateView(activity);
      activityBean = activity;
      if (activityBean.previewImage) {
        $(".preview-image").attr('src', activityBean.previewImage);
      }
    },
    error: function (err) { alert("該活動已失效!") },
  })
}

function updateView(activity) {
  $(jquery.activityImage).attr("src", activity.activityImage)
  $(jquery.activityTitle).html(activity.title)
  $(jquery.activityContent).html(activity.content)
  let place = "線上"
  if (activity.place) {
    place = `${activity.place} ${activity.address}`;
  }
  $(jquery.activityInformation).html(`
  可報名人數: ${activity.numberLimit}<br>
  活動時間: ${activity.startTime} ~ ${activity.endTime}<br>
  活動地點: ${place}
  `)
}
function creatActivity(activityBean) {

  let activitytime = new Date(activityBean.startTime);
  activitytime = activitytime.setDate(activitytime.getDate() - 1);
  activitytime = new Date(activitytime)


  let startDay = `報名結束時間:${activitytime.getFullYear()}/${activitytime.getMonth() + 1}/${activitytime.getDate()}`;

  let imgPath = 'assets/images/product-item-1.jpg';



  let div = $(`
  <li class="product-item  col-lg-3 col-md-4 col-sm-6 col-xs-6 col-ts-12 style-1">
  <div class="product-inner equal-element">
      <div class="product-top">
          <div class="flash"><span class="onnew"><span class="text">new
                  </span></span></div>
      </div>
      <div class="product-thumb ">
      <div class="thumb-inner">
          <img src="${imgPath}" class="preview-image" alt="img">

          </div>
      </div>
      <div class="product-info">
          <P>
          <h5 class=" product_title">${activityBean.title}
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

function rviewSuccessful() {
  let requset = {
    activityId: activityBean.id,
    ActivityReviewBeanMessage: ""
  }
  Swal.fire({
    title: '確認審核成功?',
    text: "已經確認審核成功!",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: '是的,送出!',
    cancelButtonText: '取消'
  }).then((result) => {
    if (result.isConfirmed) {
      $.ajax({
        url: `ActivityOperator/RviewSuccessful`,
        method: "POST",
        dataType: "JSON",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(requset),
        success: function () {
          Swal.fire({
            icon: 'success',
            title: '已送出',
            text: '已提交活動審核成功結果!',
            willClose: () => {
              window.close();
            }
          })
        },
        error: function (err) { alert("提交活動審核結果失敗!") },
      })


    }
  })
}

function reviewFail() {
  let requset = {
    activityId: activityBean.id,
    ActivityReviewBeanMessage: ""
  }

  Swal.fire({
    icon: 'warning',
    title: '是否確定審核失敗?',
    input: 'textarea',
    inputLabel: '審核失敗原因',
    inputPlaceholder: '請輸入審核失敗原因...',
    inputAttributes: {
      'aria-label': 'Type your message here'
    },
    inputValidator: (value) => {
      if (!value) {
        return '必須說明原因!'
      } else {
        requset.ActivityReviewBeanMessage = value;
      }
    },
    showCancelButton: true
  }).then((result) => {
    if (result.isConfirmed) {
      $.ajax({
        url: `ActivityOperator/ReviewFail`,
        method: "POST",
        dataType: "JSON",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(requset),
        success: function () {
          Swal.fire({
            icon: 'success',
            title: '已送出',
            text: '已提交活動審核失敗結果!',
            willClose: () => {
              window.close();
            }
          })
        },
        error: function (err) { alert("提交活動審核結果失敗!") },
      })


    }
  })


}
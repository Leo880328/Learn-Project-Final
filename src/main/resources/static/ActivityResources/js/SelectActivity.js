let pageRequest = {
  pageSize: 2,
  pageNo: 1
}
let totalPages = 1;
$().ready(


  // 取直並將ActivityBean送出等待回應
  function () {

    selectAll()
  }



)
function selectAll() {
  console.log(JSON.stringify(pageRequest));

  $.ajax({
    url: "http://localhost:8080/HappyLearning/ActivitySelect",
    method: "POST",
    dataType: "JSON",
    contentType: 'application/json; charset=utf-8',
    data: JSON.stringify(pageRequest),
    success: function (activityArray) {

      console.log(activityArray)

      totalPages = activityArray.totalPages;
      $(".totalPages").html(pageRequest.pageNo)
      $("#join").empty();
      activityArray.content.forEach(function (activity, index, array) {
        $("#join").append(creatActivity(activity))
      });


    },
    error: function (err) { alert("資料獲取失敗，請刷新網頁!") },
  })
    .then(
      function () {
        $('a').click(function (event) {
          event.preventDefault();
        });
      }
    )
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

function creatActivity(ActivityBean) {
  let endTime = new Date(ActivityBean.endTime)
  let imgPath = 'ActivityResources/images/default-image.jpg';
  if (ActivityBean.imgPath != 'null' && ActivityBean.imgPath != null) {
    imgPath = ActivityBean.imgPath;
  }
  let div = $(`

    <tr >
    <td class="u-border-1 u-border-grey-40 u-table-cell">
    <div class="u-align-center u-container-style u-grey-10 u-group u-radius-10 u-shape-round u-group-4" data-animation-name="" data-animation-duration="0" data-animation-delay="0" data-animation-direction="">
            <div class="u-container-layout u-valign-middle u-container-layout-3">
              <div class="u-expanded-width u-list u-list-2">
                <div class="u-repeater u-repeater-2">
                  <div
                    class="u-align-left u-container-style u-list-item u-radius-10 u-repeater-item u-shape-round u-white u-list-item-1">
                    <div class="u-container-layout u-similar-container u-container-layout-4">
                      <img src="${imgPath}" alt="圖片讀取失敗" class="u-expanded-width u-image u-image-default u-image-1" data-image-width="2000" data-image-height="1333" src="${ActivityBean.imgPath}">
                      <h3 class="u-text u-text-default u-text-2">${ActivityBean.title}</h3>
                      <a onclick="selectByID(${ActivityBean.id})" 
                        class="u-active-none u-align-right u-border-2 u-border-hover-palette-1-dark-2 u-border-palette-1-base u-btn u-button-style u-hover-none u-none u-text-body-color u-btn-1">learnmore</a>
                      <h6 class="u-text u-text-default u-text-3">活動結束日期:${endTime.getFullYear()}年${endTime.getMonth()}月${endTime.getDate()}日</h6>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </td>
    </tr>
    `);

  return div;
}

//==============================
function selectByID(id) {
  $.ajax({
    url: "ActivitySelect-" + id,
    method: "GET",
    dataType: "JSON",
    success: function (activity) {
      Swal.fire({

        width: "1100px",
        html: selectActivity(activity),
        stopKeydownPropagation: false

      })
    },
    error: function (err) { alert("資料獲取失敗，請刷新網頁!") },
  });
}
function selectActivity(activityBean) {
  let imgPath = 'ActivityResources/images/default-image.jpg';
  if (activityBean.imgPath != 'null' && activityBean.imgPath != null) {
    imgPath = activityBean.imgPath;
  }
  let div = $(`
 
  <section class=" selectActivity u-align-center u-clearfix u-grey-10 u-section-2" id="sec-7815">
  <div class=" selectActivity u-align-left u-clearfix ">
    <div class=" selectActivity u-container-style u-group u-white u-group-1">
      <div class=" selectActivity u-container-layout u-container-layout-1">
            <div class=" selectActivity u-container-style u-grey-5 u-group u-group-2">
              <div class=" selectActivity u-container-layout u-container-layout-2">
                <h2 class=" selectActivity u-align-center u-text u-text-1" data-animation-name="" data-animation-duration="0" data-animation-delay="0" data-animation-direction="">${activityBean.title}</h2>
                <img class=" selectActivity u-image u-image-default u-image-1" src="${imgPath}" alt="" data-image-width="400" data-image-height="265">
                <div class=" selectActivity u-container-style u-grey-10 u-group u-group-3">
                  <div class=" selectActivity u-border-1 u-border-black u-border-no-left u-border-no-bottom u-border-no-right u-border-no-top u-container-style u-grey-10 u-group  u-container-layout-3">
                  <h4 class=" selectActivity u-text-default u-text u-text-2">活動時間:${activityBean.startTime} ~ ${activityBean.endTime}</h4>
                  </div>
                </div>
                <h4 class=" selectActivity u-align-left u-text u-text-2">${activityBean.content}
                </h4>
              </div>
            </div>
          </div>
        </div>
        </div>
      </section>
    `);

  return div;
}

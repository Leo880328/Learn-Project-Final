$().ready(

  // 取直並將ActivityBean送出等待回應
  function () {
	
    selectAll()
  }



)
function selectAll() {
  $.ajax({
    url: "http://localhost:8080/HappyLearning/ActivitySelect",
    method: "GET",
    dataType: "JSON",
    success: function (activityArray) {
      $("#join").empty();
      activityArray.forEach(function (activity, index, array) {
        $("#join").append(creatActivity(activity))
      });

      // 
    },
    error: function (err) { alert("資料獲取失敗，請刷新網頁!") },
  });
}
function creatActivity(ActivityBean) {
  let endTime = new Date(ActivityBean.endTime)
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
                      <img alt="" class="u-expanded-width u-image u-image-default u-image-1" data-image-width="2000" data-image-height="1333" src="${ActivityBean.imgPath}">
                      <h3 class="u-text u-text-default u-text-2">${ActivityBean.title}</h3>
                      <a href="/HappyLearning/Activitye-${ActivityBean.id}"
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

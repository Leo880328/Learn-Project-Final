$().ready(

  // 取直並將ActivityBean送出等待回應
  function () {
    let url
    let idIndexOf = window.location.href.indexOf('-');
    let id = window.location.href.substring(idIndexOf + 1);
    console.log(id)
    selectByID(id)
  }



)
function selectByID(id) {
  $.ajax({
    url: "http://localhost:8080/HappyLearning/ActivitySelect-" + id,
    method: "GET",
    dataType: "JSON",
    success: function (activity) {
      $("#sec-124f").empty();
      $("#sec-124f").append(creatActivity(activity))
    },
    error: function (err) { alert("資料獲取失敗，請刷新網頁!") },
  });
}
function creatActivity(ActivityBean) {
  let startTime = new Date(ActivityBean.startTime)
  let endTime = new Date(ActivityBean.endTime)
  let imgPath = 'ActivityResources/images/default-image.jpg';
  if (ActivityBean.imgPath != 'null' && ActivityBean.imgPath != null) {
    imgPath = ActivityBean.imgPath;
  }
  let div = $(`
 <div class="u-align-left u-clearfix u-sheet u-sheet-1">
        <div class="u-container-style u-group u-white u-group-1">
          <div class="u-container-layout u-container-layout-1">
            <div class="u-container-style u-grey-5 u-group u-group-2">
              <div class="u-container-layout u-container-layout-2">
                <h2 class="u-align-center u-text u-text-1" data-animation-name="" data-animation-duration="0" data-animation-delay="0" data-animation-direction="">${ActivityBean.title}</h2>
                <img class="u-image u-image-default u-image-1" src="${imgPath}" alt="圖片讀取失敗" data-image-width="400" data-image-height="265">
                <div class="u-container-style u-grey-10 u-group u-group-3">
                  <div class="u-container-layout u-container-layout-3"></div>
                </div>
                <h4 class="u-align-left u-text u-text-2">
                活動開始日期:${startTime.getFullYear()}年${startTime.getMonth()}月${startTime.getDate()}<br>
                活動結束日期:${endTime.getFullYear()}年${endTime.getMonth()}月${endTime.getDate()}<br>
                ${ActivityBean.content}
                </h4>
                <a href="Activities" class="u-btn u-btn-round u-button-style u-hover-palette-1-light-2 u-palette-1-base u-radius-2 u-btn-1">Back&nbsp;<span class="u-icon u-text-white"><svg class="u-svg-content" viewBox="0 0 512 512" x="0px" y="0px" style="width: 1em; height: 1em;"><path d="M506.134,241.843c-0.006-0.006-0.011-0.013-0.018-0.019l-104.504-104c-7.829-7.791-20.492-7.762-28.285,0.068 c-7.792,7.829-7.762,20.492,0.067,28.284L443.558,236H20c-11.046,0-20,8.954-20,20c0,11.046,8.954,20,20,20h423.557 l-70.162,69.824c-7.829,7.792-7.859,20.455-0.067,28.284c7.793,7.831,20.457,7.858,28.285,0.068l104.504-104 c0.006-.006,0.011-.013,0.018-.019C513.968,262.339,513.943,249.635,506.134,241.843z"></path></svg><img></span>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    `);

  return div;
}

let activitjson = {
    activityBean:
    {
        id: null,
        title: null,
        content: null,
        start_time: null,
        end_time: null,
        imgPath: null
    },
    base64FileBean:
    {
        fileName: null,
        base64: null,
        fileType: null
    }
}

$().ready(
    // 取直並將ActivityBean送出等待回應
    function () {

        let url
        let idIndexOf = window.location.href.indexOf('-');
        let id = window.location.href.substring(idIndexOf + 1);
        console.log(id)
        activitjson.activityBean.id = id
    },
)

function selectByID(id) {
    $.ajax({
        url: "http://localhost:8080/HappyLearning/ActivitySelect-" + id,
        method: "GET",
        dataType: "JSON",
        success: function (activity) {
            $(".u-group-3").empty();
            $(".u-group-3").append(creatActivity(activity))
        },
        error: function (err) { alert("資料獲取失敗，請刷新網頁!") },
    });
}
function saveActivityBean() {
    console.log($(".u-text-4").val())

}
function saveActivity() {
    activitjson.activityBean.title = $("#title").val();
    activitjson.activityBean.content = $("#content").val();
    activitjson.activityBean.start_time = $("#start_time").val();
    activitjson.activityBean.tiend_timetle = $("#end_time").val();
    console.log(activityBean);
    $.ajax({
        url: "/Activity_OP",
        method: "POST",
        dataType: "JSON",
        data: activitjson,
        success: function (res) { console.log(res) },
        error: function (err) { alert("上傳失敗") },
    });
}
function updeBase64(file) {

    new Promise((resolve, reject) => {
        // 建立FileReader物件
        let reader = new FileReader()
        // 註冊onload事件，取得result則resolve (會是一個Base64字串)
        reader.onload = () => { resolve(reader.result) }
        // 註冊onerror事件，若發生error則reject
        reader.onerror = () => { reject(reader.error) }
        // 讀取檔案
        reader.readAsDataURL(file)
    }).then(base64 => {
        activitjson.base64FileBean.fileType = file.type; // 把編碼後的字串return
        activitjson.base64FileBean.base64 = base64; // 把編碼後的字串return
    }).catch(err => {
        alert("圖片格式錯誤錯誤:" + err)
    })
}

function creatActivity(ActivityBean) {
    let startTime = new Date(ActivityBean.startTime)
    let endTime = new Date(ActivityBean.endTime)
    let imgPath = 'ActivityResources/images/default-image.jpg';
    if (ActivityBean.imgPath != 'null' && ActivityBean.imgPath != null) {
        imgPath = ActivityBean.imgPath;
    }
    let div = $(`
    <div class="u-container-layout u-container-layout-3">
    <h1 class="u-align-center u-custom-font u-font-lobster u-text u-text-3" data-animation-name="" data-animation-duration="0" data-animation-delay="0" data-animation-direction="">${ActivityBean.title}</h1>
    <img class="u-image u-image-default u-image-1" src="${imgPath}" alt="圖片讀取失敗" data-image-width="400" data-image-height="265">
    <div class="u-border-1 u-border-black u-border-no-left u-border-no-right u-border-no-top u-container-style u-grey-10 u-group u-group-4">
      <div class="u-container-layout u-container-layout-4">
        <a href="" class="u-active-none u-border-2 u-border-hover-palette-1-dark-2 u-btn u-button-style u-hover-none u-none u-text-hover-palette-1-dark-2 u-text-palette-1-base u-btn-1"><span class="u-icon"><svg class="u-svg-content" viewBox="0 0 42 42" x="0px" y="0px" style="width: 1em; height: 1em;"><polygon points="42,20 22,20 22,0 20,0 20,20 0,20 0,22 20,22 20,42 22,42 22,22 42,22 "></polygon></svg><img></span>&nbsp;上傳圖片
        </a>
      </div>
    </div>
    <div class="u-align-center u-container-style u-grey-10 u-group u-group-5">
      <div class="u-container-layout u-container-layout-5">
        <textarea class="u-text u-text-default u-text-4">
        ${ActivityBean.content}
        </textarea>
      </div>
    </div>
    <button onclick="saveActivityBean()" id="saveActivityBean" class="u-align-center u-btn u-btn-round u-button-style u-hover-palette-1-light-2 u-palette-1-base u-radius-2 u-btn-2">儲存&nbsp;​&nbsp;<span class="u-file-icon u-icon u-icon-2"><img src="ActivityResources/images/2874091.png" alt=""></span>
    </button>
  </div>
      `);

    return div;
}

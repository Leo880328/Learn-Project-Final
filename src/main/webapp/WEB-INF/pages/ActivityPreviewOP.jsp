<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="font-size: 16px;" lang="en">

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta charset="utf-8">
  <meta name="keywords" content="活動管理, 活動預覽">
  <meta name="description" content="">
  <title>OP活動預覽</title>
  <link rel="stylesheet" href="ActivityResources/css/nicepage.css" media="screen">
  <link rel="stylesheet" href="ActivityResources/css/OP活動預覽.css" media="screen">
  <link id="u-theme-google-font" rel="stylesheet" href="ActivityResources/css/u-theme-google-font.css">
  <link rel="stylesheet" href="ActivityResources/css/jqueryDataTables.css" media="screen">
  <script class="u-script" type="text/javascript" src="ActivityResources/js/jquery.js" defer=""></script>
  <script class="u-script" type="text/javascript" src="ActivityResources/js/nicepage.js" defer=""></script>


  <meta name="generator" content="Nicepage 4.18.5, nicepage.com">


  <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": ""
}</script>
  <meta name="theme-color" content="#478ac9">
  <meta property="og:title" content="OP活動預覽">
  <meta property="og:type" content="website">
</head>

<body class="u-body u-xl-mode" data-lang="en">


<jsp:include page="BackendHeader.jsp" />
  <section class="u-clearfix u-grey-10 u-section-1" id="sec-1faa">
      <div class="u-align-left u-clearfix u-sheet u-sheet-1">
        <div class="u-container-style u-group u-white u-group-1">
          <div class="u-container-layout u-container-layout-1">
            <div class="u-align-left u-container-style u-grey-10 u-group u-radius-10 u-shape-round u-group-2">
              <div class="u-container-layout u-valign-middle u-container-layout-2">
                <h1 class="u-align-center u-text u-text-default u-text-1">活動管理</h1>
              </div>
            </div>
            <div class="u-form u-form-1">
              <form  class="u-clearfix u-form-horizontal u-form-spacing-15 u-inner-form" style="padding: 15px" >
                <div class="u-form-group u-label-none u-form-group-1">
                  <label for="text-4a55" class="u-label">Input</label>
                  <input id="searchBox"  type="text" placeholder="搜尋條件" id="text-4a55" name="text" class="u-border-1 u-border-grey-30 u-input u-input-rectangle">
                </div>
                <div class="u-form-group u-form-submit u-label-none">
                  <a  class="u-btn u-btn-submit u-button-style">搜尋<br>
                  </a>
                  <input onclick="search()" type="submit" value="submit" class="u-form-control-hidden">
                </div>
<!--                 <div class="u-form-send-message u-form-send-success">Thank you! Your message has been sent.</div> -->
<!--                 <div class="u-form-send-error u-form-send-message">Unable to send your message. Please fix errors then try again.</div> -->
                <input type="hidden" value="" name="recaptchaResponse">
              </form>
            </div>
            <div class="u-container-style u-grey-5 u-group u-group-3">
              <div class="u-container-layout u-container-layout-3">
                <div class="u-container-style u-group u-white u-group-4">
                  <div class="u-container-layout u-container-layout-4">
                    <div class="u-expanded-width u-table u-table-responsive u-table-1">
                      <table class="u-table-entity">
                        <colgroup>
                          <col width="77%">
                          <col width="23%">
                        </colgroup>
                        <thead class="u-align-center u-grey-50 u-table-header u-table-header-1">
                          <tr style="height: 34px;">
                            <th class="u-border-1 u-border-grey-50 u-table-cell u-table-cell-1">標題</th>
                            <th class="u-border-1 u-border-grey-50 u-table-cell u-table-cell-2">結束時間</th>
                          </tr>
                        </thead>
                        <tbody class="u-align-center u-table-body">
                          <tr style="height: 76px;">
                            <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                            <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
                <div class="u-align-center u-clearfix u-group-elements u-group-elements-1">
                  <a onclick="pageNoIncrease()" class="pageNoIncrease u-btn u-btn-round u-button-style u-hover-palette-1-light-2 u-palette-1-base u-radius-2 u-btn-2">Next&nbsp;<span class="u-icon u-text-white"><svg class="u-svg-content" viewBox="0 0 512 512" x="0px" y="0px" style="width: 1em; height: 1em;"><path d="M506.134,241.843c-0.006-0.006-0.011-0.013-0.018-0.019l-104.504-104c-7.829-7.791-20.492-7.762-28.285,0.068 c-7.792,7.829-7.762,20.492,0.067,28.284L443.558,236H20c-11.046,0-20,8.954-20,20c0,11.046,8.954,20,20,20h423.557 l-70.162,69.824c-7.829,7.792-7.859,20.455-0.067,28.284c7.793,7.831,20.457,7.858,28.285,0.068l104.504-104 c0.006-.006,0.011-.013,0.018-.019C513.968,262.339,513.943,249.635,506.134,241.843z"></path></svg>
                  <img></span>
                  </a>
                  <a onclick="pageNoReduce()" class="pageNoReduce u-align-center u-btn u-btn-round u-button-style u-hover-palette-1-light-2 u-palette-1-base u-radius-2 u-btn-3"><span class="u-file-icon u-icon u-text-white"><img src="ActivityResources/images/545680-10.png" alt=""></span>&nbsp;Back
                  </a>
                  <h3 class="u-text u-text-default u-text-2 totalPages">1</h3>
                </div>
              </div>
            </div>
            <a onclick="ActivityInsert()" class="u-btn u-button-style u-hover-palette-1-dark-1 u-palette-1-base u-btn-4"><span class="u-file-icon u-icon u-text-white"><img src="ActivityResources/images/748113.png" alt=""></span>&nbsp;新增
            </a>
          </div>
        </div>
      </div>
    </section>

  <script async=false src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
  <script async=false src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
  <script async=false src="ActivityResources/js/SelectActivityOP.js"></script>
<script>

function tableForDataTable(){
	$(".u-table-entity").DataTable()
	
}
</script>

</body>

</html>
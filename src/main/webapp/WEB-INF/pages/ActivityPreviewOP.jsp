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
  <section class="u-clearfix u-grey-10 u-section-1" id="sec-f4b1">
    <div class="u-align-left u-clearfix u-sheet u-sheet-1">
      <div class="u-container-style u-group u-white u-group-1">
        <div class="u-container-layout u-container-layout-1">
          <div class="u-align-left u-container-style u-grey-10 u-group u-radius-10 u-shape-round u-group-2">
            <div class="u-container-layout u-valign-middle u-container-layout-2">
              <h1 class="u-align-center u-text u-text-default u-text-1">活動管理</h1>
            </div>
          </div>
          <div class="u-form u-form-1">
            <form action="https://forms.nicepagesrv.com/Form/Process"
              class="u-clearfix u-form-horizontal u-form-spacing-15 u-inner-form" style="padding: 15px" source="email">
              <div class="u-form-group u-form-select u-label-none u-form-group-1">
                <label for="select-e165" class="u-label">Dropdown</label>
                <div class="u-form-select-wrapper">
                  <select id="select-e165" name="select"
                    class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white">
                    <option value="列表">列表</option>
                    <option value="資料庫">資料庫</option>
                  </select>
                  <svg xmlns="http://www.w3.org/2000/svg" width="14" height="12" version="1" class="u-caret">
                    <path fill="currentColor" d="M4 8L0 4h8z"></path>
                  </svg>
                </div>
              </div>
              <div class="u-form-group u-label-none u-form-group-2">
                <label for="text-4a55" class="u-label">Input</label>
                <input type="text" placeholder="搜尋條件" id="text-4a55" name="text"
                  class="u-border-1 u-border-grey-30 u-input u-input-rectangle">
              </div>
              <div class="u-form-group u-form-submit u-label-none">
                <a href="#" class="u-btn u-btn-submit u-button-style">搜尋<br>
                </a>
                <input type="submit" value="submit" class="u-form-control-hidden">
              </div>
              <div class="u-form-send-message u-form-send-success">Thank you! Your message has been sent.</div>
              <div class="u-form-send-error u-form-send-message">Unable to send your message. Please fix errors then try
                again.</div>
              <input type="hidden" value="" name="recaptchaResponse">
              <input type="hidden" name="formServices" value="744998977b91ff36e4da222c40ba3bca">
            </form>
          </div>
          <h2 class="u-text u-text-default u-text-2">活動預覽</h2>
          <div class="u-container-style u-grey-5 u-group u-group-3">
            <div class="u-container-layout u-container-layout-3">
              <div class="u-container-style u-group u-white u-group-4">
                <div class="u-container-layout u-container-layout-4">
                  <div class="u-expanded-width u-table u-table-responsive u-table-1">
                    <table class="u-table-entity">
                      <colgroup>
                        <col width="18.4%">
                        <col width="81.6%">
                      </colgroup>
                      <thead class="u-align-center u-grey-50 u-table-header u-table-header-1">
                        <tr style="height: 34px;">
                          <th class="u-border-1 u-border-grey-50 u-table-cell u-table-cell-1">ID</th>
                          <th class="u-border-1 u-border-grey-50 u-table-cell u-table-cell-2">標題</th>
                        </tr>
                      </thead>
                      <tbody class="u-align-center u-table-body">
                        <tr style="height: 76px;">
                          <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                          <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                        </tr>
                        <tr style="height: 76px;">
                          <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                          <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                        </tr>
                        <tr style="height: 76px;">
                          <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                          <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                        </tr>
                        <tr style="height: 76px;">
                          <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                          <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                        </tr>
                        <tr style="height: 76px;">
                          <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                          <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                        </tr>
                        <tr style="height: 76px;">
                          <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                          <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                        </tr>
                        <tr style="height: 76px;">
                          <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                          <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                        </tr>
                        <tr style="height: 76px;">
                          <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                          <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                        </tr>
                        <tr style="height: 76px;">
                          <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                          <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                        </tr>
                        <tr style="height: 76px;">
                          <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                          <td class="u-border-1 u-border-grey-40 u-table-cell"></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
  <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
  <script>
    $().ready(

      $('.u-table-entity').DataTable()
    )
  </script>

</body>

</html>
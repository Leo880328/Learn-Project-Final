<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="fourth.bean.ActivityBean" %>

    <head>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta charset="utf-8">
      <meta name="keywords" content="活動編輯頁, 活動畫面">
      <meta name="description" content="">
      <title>活動編輯</title>
      <link rel="stylesheet" href="ActivityResources/css/nicepage.css" media="screen">
      <link rel="stylesheet" href="ActivityResources/css/活動編輯.css" media="screen">
      <link rel="stylesheet" href="ActivityResources/css/u-theme-google-font.css">
      <link rel="stylesheet" href="ActivityResources/css/u-page-google-font.css">
      <script class="u-script" type="text/javascript" src="ActivityResources/js/jquery.js" defer=""></script>
      <script class="u-script" type="text/javascript" src="ActivityResources/js/nicepage.js" defer=""></script>
      <meta name="generator" content="Nicepage 4.18.5, nicepage.com">



      <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": ""
}</script>
      <meta name="theme-color" content="#478ac9">
      <meta property="og:title" content="活動編輯">
      <meta property="og:type" content="website">
    </head>

    <body class="u-body u-xl-mode" data-lang="en">
      <jsp:include page="BackendHeader.jsp" />
      <section class="u-clearfix u-grey-10 u-section-1" id="sec-b050">
        <div class="u-align-left u-clearfix u-sheet u-sheet-1">
          <div class="u-container-style u-group u-white u-group-1">
            <div class="u-container-layout u-container-layout-1">
              <div class="u-align-left u-container-style u-grey-10 u-group u-radius-10 u-shape-round u-group-2">
                <div class="u-container-layout u-valign-middle u-container-layout-2">
                  <h1 class="u-align-center u-text u-text-default u-text-1">活動編輯</h1>
                </div>
              </div>
              <h2 class="u-text u-text-default u-text-2">活動畫面</h2>
              <div class="u-container-style u-grey-5 u-group u-group-3">
                <div class="u-container-layout u-container-layout-3">
                  <h1 id="title" title="點擊進行編輯" onclick="changeH1title(this)"
                    class="u-align-center u-custom-font u-font-lobster u-text u-text-3" data-animation-name=""
                    data-animation-duration="0" data-animation-delay="0" data-animation-direction="">請點擊輸入標題</h1>
                    <a onclick="delectActivity()" class="deleltButton u-active-none u-border-2 u-border-active-palette-2-dark-1 u-border-hover-palette-2-base u-border-palette-1-base u-btn u-button-style u-hover-none u-none u-text-hover-palette-2-base u-text-palette-1-base u-btn-1"><span class="u-file-icon u-icon"><img src="ActivityResources/images/484662.png" alt=""></span>&nbsp; <span class="u-icon u-icon-2"></span>&nbsp;刪除活動&nbsp; 
                </a>
                  <img id="imgPath" onclick="changeimg(this)" title="點擊進行編輯" class="u-image u-image-default u-image-1"
                    src="ActivityResources/images/default-image.jpg" alt="圖片讀取失敗" data-image-width="400" data-image-height="265">
                  <div
                    class="u-border-1 u-border-black u-border-no-left u-border-no-bottom u-border-no-right u-border-no-top u-container-style u-grey-10 u-group u-group-4">
                  
                      <h4 onclick="changeTime(this)" id="activityTime" title="點擊進行編輯" class="u-text u-text-default u-text-4">
                        活動時間:0000/00/00 00:00 ~ 0000/00/00 00:00
                      </h4>
                   
                  </div>
                  <div onclick="changeVal()" class="u-align-center u-container-style u-grey-10 u-group u-group-5">
                    <div class="u-container-layout u-container-layout-5">
                      <h4  id="content" title="點擊進行編輯" class="u-text u-text-default u-text-4" >請點擊輸入內文</h4>
                    </div>
                  </div>
                  <button onclick="saveActivityBean()" id="saveActivityBean"
                    class="u-align-center u-btn u-btn-round u-button-style u-hover-palette-1-light-2 u-palette-1-base u-radius-2 u-btn-2">儲存&nbsp;​&nbsp;<span
                      class="u-file-icon u-icon u-icon-2"><img src="ActivityResources/images/2874091.png" alt=""></span>
                  </button>
                  <input type="file" id="avatar" style="visibility:hidden;"  accept="image/*">
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>



      <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
      <script src="ActivityResources/js/UpdateActivities.js"></script>
    </body>

    </html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>後臺管理-預覽</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <base href="<%=request.getContextPath()%>/">
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />
    <link
        href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,300i,400,400i,700,700i&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/jquery-ui.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    <link rel="stylesheet" href="assets/css/chosen.min.css">
    <link rel="stylesheet" href="assets/css/pe-icon-7-stroke.css">
    <link rel="stylesheet" href="assets/css/magnific-popup.min.css">
    <link rel="stylesheet" href="assets/css/lightbox.min.css">
    <link rel="stylesheet" href="assets/js/fancybox/source/jquery.fancybox.css">
    <link rel="stylesheet" href="assets/css/jquery.scrollbar.min.css">
    <link rel="stylesheet" href="assets/css/mobile-menu.css">
    <link rel="stylesheet" href="assets/fonts/flaticon/flaticon.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="ActivityResources/css/Activity.css">
</head>

<body class="home" style="margin-top: 100px;">
    
   <hr>
    <div>
        <div>
            <div class="container" style="width: 870px; padding-bottom: 200px;">
                <div class="row ">
                    <div class="content-area content-blog " style="width: 870px; ">
                        <div class="site-main">
                            <div class="post-item">
                                <div class="post-infor">
                                    <div class="post-format" style="height: 450px;"><img class="activityImage"
                                            src="ActivityResources/images/default-image.jpg" alt="img"></div>
                                    <div class="category-blog">活動說明</div>
                                    <h3 class="post-title activityTitle">活動標題</h3>
                                    <div class="main-info-post activityContent">
                                        活動內容

                                    </div>
                                    <p class="activityInformation">
                                        活動時間:0000/00/00 10:00 ~ 0000/00/00 00:00<br>
                                        地點:台北市萬華區
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <div class="grid no-sidebar selectActivityMode previewActivity">
        <div>
            <div class="fullwidth-template">
                <div class="teamo-tabs  default ">
                    <div class="container">
                        <div class="tab-head">
                            <ul class="tab-link">
                                <li class="active">活動預覽樣式</li>
                            </ul>
                        </div>
                        <div class="tab-container">
                            <div id="bestseller" class="tab-panel active">
                                <div class="teamo-product">
                                    <ul class="row list-products auto-clear equal-container product-grid activityJoin">
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <div class="banner-wrapp rows-space-65">
        <div class="">
            <div class="banner">
				<div class="item-banner style17">
					<div>
						<div class=" justify-content-center"
							style="display: flex; justify-content: center; align-items: center;">
							<a style="margin-right:20px" onclick="rviewSuccessful()" class="button btn-view-collection ">審核成功</a>
							<a onclick="reviewFail()" class="button btn-view-collection ">審核失敗</a>
						</div>
					</div>
				</div>
			</div>
          </div>
		</div>

    <script src="assets/js/jquery-1.12.4.min.js"></script>
    <script src="assets/js/jquery.plugin-countdown.min.js"></script>
    <script src="assets/js/jquery-countdown.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/magnific-popup.min.js"></script>
    <script src="assets/js/isotope.min.js"></script>
    <script src="assets/js/jquery.scrollbar.min.js"></script>
    <script src="assets/js/jquery-ui.min.js"></script>
    <script src="assets/js/mobile-menu.js"></script>
    <script src="assets/js/chosen.min.js"></script>
    <script src="assets/js/slick.js"></script>
    <script src="assets/js/jquery.elevateZoom.min.js"></script>
    <script src="assets/js/jquery.actual.min.js"></script>
    <script src="assets/js/fancybox/source/jquery.fancybox.js"></script>
    <script src="assets/js/lightbox.min.js"></script>
    <script src="assets/js/owl.thumbs.min.js"></script>
    <script src="assets/js/jquery.scrollbar.min.js"></script>
    <script src='http://www.google.cn/maps/api/js?key=AIzaSyC3nDHy1dARR-Pa_2jjPCjvsOR4bcILYsM'></script>
    <script src="assets/js/frontend-plugin.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="ActivityResources/js/ActivityBackgroundPreview.js"></script>
    
</body>

</html>
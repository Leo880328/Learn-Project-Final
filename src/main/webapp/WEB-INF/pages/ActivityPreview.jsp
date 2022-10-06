<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>活動</title>
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
    <link rel="stylesheet" href="assets/css/jquery.scrollbar.min.css">
    <link rel="stylesheet" href="assets/css/mobile-menu.css">
    <link rel="stylesheet" href="assets/fonts/flaticon/flaticon.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="ActivityResources/css/Activity.css">
    <link rel="stylesheet" href="ActivityResources/css/activityPreview.css">

</head>

<body class="inblog-page">
<jsp:include page="Header.jsp"/>
    <!-- ===================================================================================================================== -->
    <div class="fullwidth-template announcementMode" style="margin-top: 100px;">
    </div>
    <!-- ===================================================================================================================== -->
    <div class="grid no-sidebar selectActivityMode previewActivity">
        <div>
            <div class="fullwidth-template">
                <div class="teamo-tabs  default ">
                    <div class="container">
                        <div class="tab-head">
                            <ul class="tab-link">
                                <li class="active">活動預覽</li>
                            </ul>
                        </div>
                        <div class="tab-container">
                            <div id="bestseller" class="tab-panel active">
                                <div class="teamo-product">
                                    <ul class="row list-products auto-clear equal-container product-grid activityJoin">
                                    </ul>
                                </div>
                                <div class="banner-wrapp rows-space-65">
                                    <div class="">
                                        <div class="banner">
                                            <div class="item-banner style17">
                                                <div>
                                                    <div class=" justify-content-center" style="display: flex;
                                                        justify-content: center; 
                                                        align-items: center; ">
                                                        <a
                                                            class="button btn-view-collection read-More-Button readMoreButton">查看更多活動</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ===================================================================================================================== -->
    <div class="banner-wrapp createOrAddActivityMode">
    </div>
    <!-- ===================================================================================================================== -->
    <div class="banner-wrapp rows-space-65 advertise">
    </div>
    <!-- ===================================================================================================================== -->


    <script>
        $(".announcementMode").load("ActivityResources/announcementMode.html");
        $(".createOrAddActivityMode").load("ActivityResources/createOrAddActivityMode.html");
        $(".advertiseMode").load("ActivityResources/advertiseMode.html");
    </script>
    <script src="ActivityResources/js/previewActivity.js"></script>
</body>

</html>
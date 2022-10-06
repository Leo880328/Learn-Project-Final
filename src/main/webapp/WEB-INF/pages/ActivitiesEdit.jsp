<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>活動編輯</title>
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
    <link rel="stylesheet" href="ActivityResources/css/ActivitiesEdit.css">
</head>

<body class="inblog-page">
<jsp:include page="Header.jsp"/>
    <div class="main-content main-content-checkout">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-trail breadcrumbs">
                        <ul class="trail-items breadcrumb">
                            <li class="trail-item trail-begin"><a href="index.html">Home</a></li>
                            <li class="trail-item trail-end active">管理活動 </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="checkout-wrapp" style="width: 80%; margin: auto;">
                <div class=" shipping-address-form-wrapp">
                    <div class=" shipping-address-form checkout-form">
                        <div class="">
                            <div class="shipping-address">
                                <h3 class="custom_blog_title">我的活動</h3>
                                <p class="form-row "><label class="text">活動圖片</label>
                                    <img class="activityActivityImage" src="ActivityResources\Images\default-image.jpg"
                                        alt="" style="height: 450px;width: 870px;;">
                                    <input type="file" class="activityActivityInput" accept=".jpg">
                                </p>
                                <p class="form-row "><label class="text ">活動標題</label>
                                    <input type="text" class="input-text activityTitle">
                                </p>
                                <br>

                                <p class="form-row ">
                                    <label class="text">活動內容</label>
                                    <textarea class="activityContent"
                                        style="min-width: 100%; min-height:400px"></textarea>
                                </p>
                                <p class="form-row "><label class="text">活動預覽圖片</label><img class="activityPreviewImage"
                                        src="ActivityResources\Images\default-image.jpg" alt=""
                                        style="height: 275px;width: 270px;;">
                                    <input type="file" class="activityPreviewInput" accept=".jpg">
                                </p>
                                <p class="form-row forn-row-col forn-row-col-1"><label class="text">活動形式</label>
                                    <select data-placeholder="United Kingdom" class=" activitySelectPlace"
                                        tabindex="1">
                                        <option value="on-line">線上活動</option>
                                        <option value="offline">線下活動</option>

                                    </select>
                                </p>
                                <br>
                                <div class="activityPlaceDiv" style="display: none;">
                                    <p class="form-row form-row-first" style="width: 27%;"><label
                                            class="text">縣市</label>
                                        <input type="text" class="input-text activityPlace">
                                    </p>
                                    <p class="form-row  form-row-last" style="width: 70%;"><label
                                            class="text">地址或網址</label>
                                        <input type="text" class="input-text activityAddress">
                                    </p>
                                </div>
                                <p class="form-row "><label class="text">可參加人數</label>
                                    <input type="number" class="input-text activityNumberLimit">
                                </p>
                                <p class="form-row form-row-first"><label class="text">活動開始時間</label><input
                                        type="datetime-local" class="input-text activityStartTime">
                                </p>
                                <p class="form-row form-row-last"><label class="text">活動結束時間</label><input
                                        type="datetime-local" class="input-text activityEndTime">
                                </p>
                            </div>
                        </div>
                    </div><a class="button button-payment saveActivityButton">送出</a>
                </div>
            </div>
        </div>
    </div>
    <script src="ActivityResources/js/ActivitiesEdit.js"></script>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>管理活動</title>
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
<jsp:include page="Header.jsp"/>
    <div>
        <div class="fullwidth-template">

            <div class="banner-wrapp createOrAddActivityMode">
            </div>

            <div class="teamo-tabs  default rows-space-40 ">
                <div class="container">
                    <div class="tab-head">
                        <ul class="tab-link">
                            <li class="active">
                                <a data-toggle="tab" aria-expanded="true" href="#bestseller">上架活動</a>
                            </li>
                            <li class="">
                                <a data-toggle="tab" aria-expanded="true" href="#top-rated">所有活動</a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-container">
                        <div id="bestseller" class="tab-panel active">
                            <div class="teamo-product">
                                <table class="u-table-entity">
                                    <colgroup>
                                        <col width="45.0%">
                                        <col width="30.0%">
                                        <col width="15.0%">
                                        <col width="10.0%">
                                    </colgroup>
                                    <thead class="u-align-center u-grey-50 u-table-header u-table-header-1">
                                        <tr style="height: 35px;">
                                            <th class="u-border-1 u-border-grey-50 u-table-cell u-table-cell-1">
                                                <h5>活動名稱</h5>
                                            </th>
                                            <th class="u-border-1 u-border-grey-50 u-table-cell u-table-cell-1">
                                                <h5>活動時間</h5>
                                            </th>
                                            <th class="u-border-1 u-border-grey-50 u-table-cell u-table-cell-1">
                                                <h5>人數限制</h5>
                                            </th>
                                            <th class="u-border-1 u-border-grey-50 u-table-cell u-table-cell-1">
                                                <h5>活動地點</h5>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody class="u-align-center u-table-body publicActivity">

                                        <!-- ============================================================================================ -->

                                    </tbody>
                                </table>
                                <div class="banner-wrapp rows-space-65">
                                    <div class="container">
                                        <div class="banner">
                                            <div class="item-banner style17">
                                                <div>
                                                    <div class=" justify-content-center" style="display: flex;
                                                        justify-content: center; 
                                                        align-items: center; ">
                                                        <a
                                                            class="button btn-view-collection read-More-Button readMorePublicButton">查看更多活動</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="top-rated" class="tab-panel">
                            <div class="teamo-product">
                                <table class="u-table-entity">
                                    <colgroup>
                                        <col width="45.0%">
                                        <col width="30.0%">
                                        <col width="15.0%">
                                        <col width="10.0%">
                                    </colgroup>
                                    <thead class="u-align-center u-grey-50 u-table-header u-table-header-1">
                                        <tr style="height: 35px;">
                                            <th class="u-border-1 u-border-grey-50 u-table-cell u-table-cell-1">
                                                <h5>活動名稱</h5>
                                            </th>
                                            <th class="u-border-1 u-border-grey-50 u-table-cell u-table-cell-1">
                                                <h5>活動時間</h5>
                                            </th>
                                            <th class="u-border-1 u-border-grey-50 u-table-cell u-table-cell-1">
                                                <h5>活動狀態</h5>
                                            </th>
                                            <th class="u-border-1 u-border-grey-50 u-table-cell u-table-cell-1">
                                                <h5>活動地點</h5>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody class="u-align-center u-table-body allActivity">
                                        <!-- ============================================================================================ -->

                                    </tbody>
                                </table>
                                <div class="banner-wrapp rows-space-65">
                                    <div class="container">
                                        <div class="banner">
                                            <div class="item-banner style17">
                                                <div>
                                                    <div class=" justify-content-center" style="display: flex;
                                                        justify-content: center; 
                                                        align-items: center; ">
                                                        <a
                                                            class="button btn-view-collection read-More-Button readMoreAllButton">查看更多活動</a>
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

            <div class="banner-wrapp rows-space-65 advertiseMode">
            </div>
        </div>
    </div>

    <script>
        $(".createOrAddActivityMode").load("ActivityResources/createOrAddActivityMode.html");
        $(".advertiseMode").load("ActivityResources/advertiseMode.html");
    </script>
    <script src="ActivityResources/js/manageActivitiesMode.js"></script>
</body>

</html>
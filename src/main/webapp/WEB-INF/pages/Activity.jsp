<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
		<link href="https://fonts.googleapis.com/css?family=Lato:300,300i,400,400i,700,700i&display=swap"
			rel="stylesheet">
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
		<jsp:include page="Header.jsp" />
		<br>
		<div>
			<div class="container" style="width: 870px; padding-bottom: 200px;">
				<div class="row ">
					<div class="content-area content-blog " style="width: 870px;">
						<div class="site-main">
							<div class="post-item">
								<div class="post-infor">
									<div class="post-format" style="height: 450px;">
										<img class="activityImage" src="ActivityResources/images/default-image.jpg" alt="img">
									</div>
									<div class="category-blog">活動說明</div>
									<h3 class="post-title activityTitle" style="text-align:center;">活動標題</h3>
									<div class="main-info-post activityContent">活動內容</div>
									<p class="activityInformation">
										活動時間:0000/00/00 10:00 ~ 0000/00/00 00:00<br> 地點:台北市萬華區
									</p>

								</div>
							</div>
						</div>
						<br>
						<div class=" justify-content-center"
							style="display: flex; justify-content: center; align-items: center;">
							<button class="button btn-view-collection joinActivity" onclick="joinActivity()">報名活動</button>
						</div>

					</div>
				</div>
			</div>

		</div>
		<script src="ActivityResources/js/Activity.js"></script>
		<script src="ActivityResources/js/GoogleCalendarAPI.js"></script>
		<script async defer src="https://apis.google.com/js/api.js" onload="gapiLoaded()"></script>
		<script async defer src="https://accounts.google.com/gsi/client" onload="gisLoaded()"></script>
	</body>

	</html>
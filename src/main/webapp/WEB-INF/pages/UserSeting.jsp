<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,fourth.*"%>
<%@ page import="fourth.bean.MemberBean"%>
<!DOCTYPE html>
<html>
<head>
<title>個人資料</title>
<script src="https://kit.fontawesome.com/6cda0c2d7d.js"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/images/favicon.png" />
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,300i,400,400i,700,700i&display=swap"
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
<link rel="stylesheet"
	href="assets/js/fancybox/source/jquery.fancybox.css">
<link rel="stylesheet" href="assets/css/jquery.scrollbar.min.css">
<link rel="stylesheet" href="assets/css/mobile-menu.css">
<link rel="stylesheet" href="assets/fonts/flaticon/flaticon.css">
<link rel="stylesheet" href="assets/css/style.css">
<style>
.teamo-google-maps {
	min-height: 360px;
}
</style>
</head>

<%
MemberBean memberBean = (MemberBean) request.getAttribute("user");
%>

<body class="inblog-page">
	<jsp:include page="Header.jsp" />


	<div class="main-content main-content-contact">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-trail breadcrumbs">
						<ul class="trail-items breadcrumb">
							<li class="trail-item trail-begin"><a href="index.html">Home</a></li>
							<li class="trail-item trail-end active">個人資料</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div
					class="content-area content-contact col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="site-main">
						<h3 class="custom_blog_title">個人資料</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="page-main-content">
			<div class="google-map">
				<div class="teamo-google-maps" id="teamo-google-maps" data-hue=""
					data-lightness="1" data-map-style="2" data-saturation="-99"
					data-longitude="-73.985130" data-latitude="40.758896"
					data-pin-icon="" data-zoom="14" data-map-type="ROADMAP"></div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="form-contact">
							<div class="col-lg-8 no-padding">
								<div class="form-message">
									<h2 class="title">我的檔案</h2>
									<form action="#" class="teamo-contact-fom">
										<div class="row">
											<div class="col-sm-6">
												<p>
													<span class="form-label">暱稱</span><span
														class="form-control-wrap "><input title="暱稱"
														type="text" name="nick" size="40"
														class="form-control form-control-name"
														value='<%=memberBean.getNick()%>'></span>
												</p>
											</div>
											<div class="col-sm-6">
												<p>
													<span class="form-label">帳號 </span><span
														class="form-control-wrap "><input title="帳號"
														type="text" name="account" size="40"
														class="form-control form-control-name"
														value='<%=memberBean.getAccount()%>'></span>
												</p>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-6">
												<p>
													<span class="form-label">姓名</span><span
														class="form-control-wrap "><input title="姓名"
														type="text" name="name" size="40"
														class="form-control form-control-name"
														value='<%=memberBean.getName()%>'></span>
												</p>
											</div>
											<div class="col-sm-6">
												<p>
													<span class="form-label">性別 </span><span
														class="form-control-wrap "><select name="sex"
														<%=memberBean.getSex()%>>
															<option <%=memberBean.getSex()%>></option>
															<option value="男生">男生</option>
															<option value="女生">女生</option>
													</select></span>
												</p>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-6">
												<p>
													<span class="form-label">身分</span><span
														class="form-control-wrap "><input
														title="your-phone" type="text" name="your-phone"
														class="form-control form-control-phone"></span>
												</p>
											</div>
											<div class="col-sm-6">
												<p>
													<span class="form-label">生日 </span><span
														class="form-control-wrap "><input title="生日"
														type="date" name="birthday" class="form-control "
														value='<%=memberBean.getBirthday()%>'></span>
												</p>
											</div>
										</div>
										<p>
											<span class="form-label">大頭貼 </span><span
												class="wpcf7-form-control-wrap "><img id="img_zoom"
											data-zoom-image="<%=memberBean.getImg()%>"
											src="<%=memberBean.getImg()%>" alt="img"><a
											href="#" class="btn-zoom open_qv"><i class="fa fa-search"
											aria-hidden="true"></i></a></span>
										</p>
										<p>
											<input type="submit" value="更改資料"
												class="form-control-submit button-submit">
										</p>
									</form>
								</div>
							</div>
							<div class="col-lg-4 no-padding">
								<div class="form-contact-information">
									<form action="#" class="teamo-contact-info">
										<h2 class="title"></h2>
										<div class="info">
											<div class="item phone">
												<span class="icon"></span><span class="text"><%=memberBean.getCellphone()%></span>
											</div>
											<div class="item email">
												<span class="icon"></span><span class="text"><%=memberBean.getEmail()%></span>
											</div>
											<div class="item address">
												<span class="icon"></span><span class="text"><%=memberBean.getJoinDate()%></span>
											</div>
											
											
											
										</div>
										<div class="socials">
											<a href="#" class="social-item" target="_blank"><span
												class="icon fa fa-facebook"></span></a><a href="#"
												class="social-item" target="_blank"><span
												class="icon fa fa-twitter-square"></span></a><a href="#"
												class="social-item" target="_blank"><span
												class="icon fa fa-instagram"></span></a>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- <footer class="footer style7">
        <div class="container">
            <div class="container-wapper">
                <div class="row">
                    <div class="box-footer col-xs-12 col-sm-4 col-md-4 col-lg-4 hidden-sm hidden-md hidden-lg">
                        <div class="teamo-newsletter style1">
                            <div class="newsletter-head">
                                <h3 class="title">Newsletter</h3>
                            </div>
                            <div class="newsletter-form-wrap">
                                <div class="list">Sign up for our free video course and <br />urban garden inspiration
                                </div><input type="email" class="input-text email email-newsletter"
                                    placeholder="Your email letter"><button
                                    class="button btn-submit submit-newsletter">SUBSCRIBE</button>
                            </div>
                        </div>
                    </div>
                    <div class="box-footer col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <div class="teamo-custommenu default">
                            <h2 class="widgettitle">Quick Menu</h2>
                            <ul class="menu">
                                <li class="menu-item"><a href="#">New arrivals</a></li>
                                <li class="menu-item"><a href="#">Life style</a></li>
                                <li class="menu-item"><a href="#">Cacti</a></li>
                                <li class="menu-item"><a href="#">Palms</a></li>
                                <li class="menu-item"><a href="#">Ferns</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="box-footer col-xs-12 col-sm-4 col-md-4 col-lg-4 hidden-xs">
                        <div class="teamo-newsletter style1">
                            <div class="newsletter-head">
                                <h3 class="title">Newsletter</h3>
                            </div>
                            <div class="newsletter-form-wrap">
                                <div class="list">Sign up for our free video course and <br />urban garden inspiration
                                </div><input type="email" class="input-text email email-newsletter"
                                    placeholder="Your email letter"><button
                                    class="button btn-submit submit-newsletter">SUBSCRIBE</button>
                            </div>
                        </div>
                    </div>
                    <div class="box-footer col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <div class="teamo-custommenu default">
                            <h2 class="widgettitle">Information</h2>
                            <ul class="menu">
                                <li class="menu-item"><a href="#">FAQs</a></li>
                                <li class="menu-item"><a href="#">Track Order</a></li>
                                <li class="menu-item"><a href="#">Delivery</a></li>
                                <li class="menu-item"><a href="#">Contact Us</a></li>
                                <li class="menu-item"><a href="#">Return</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="footer-end">
                    <div class="row">
                        <div class="col-sm-12 col-xs-12">
                            <div class="teamo-socials">
                                <ul class="socials">
                                    <li><a href="#" class="social-item" target="_blank"><i
                                                class="icon fa fa-facebook"></i></a></li>
                                    <li><a href="#" class="social-item" target="_blank"><i
                                                class="icon fa fa-twitter"></i></a></li>
                                    <li><a href="#" class="social-item" target="_blank"><i
                                                class="icon fa fa-instagram"></i></a></li>
                                </ul>
                            </div>
                            <div class="coppyright">Copyright © 2020 <a href="http://www.bootstrapmb.com/">Teamo</a>.
                                All rights reserved </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer> -->
	<div class="footer-device-mobile">
		<div class="wapper">
			<div class="footer-device-mobile-item device-home">
				<a href="index.html"><span class="icon"><i
						class="fa fa-home" aria-hidden="true"></i></span>Home </a>
			</div>
			<div class="footer-device-mobile-item device-home device-wishlist">
				<a href="#"><span class="icon"><i class="fa fa-heart"
						aria-hidden="true"></i></span>Wishlist </a>
			</div>
			<div class="footer-device-mobile-item device-home device-cart">
				<a href="#"><span class="icon"><i
						class="fa fa-shopping-basket" aria-hidden="true"></i><span
						class="count-icon">0 </span></span><span class="text">Cart</span></a>
			</div>
			<div class="footer-device-mobile-item device-home device-user">
				<a href="#"><span class="icon"><i class="fa fa-user"
						aria-hidden="true"></i></span>Account </a>
			</div>
		</div>
	</div>
	<a href="#" class="backtotop"><i class="fa fa-angle-double-up"></i></a>
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
	<script
		src='http://www.google.cn/maps/api/js?key=AIzaSyC3nDHy1dARR-Pa_2jjPCjvsOR4bcILYsM'></script>
	<script src="assets/js/frontend-plugin.js"></script>
</body>
<jsp:include page="Footer.jsp" />
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,fourth.bean.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <title>Teamo - Products List Fullwidth</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<style>
	.sortCss{
		margin-left:20px;
		background-color:white;
		width:30%;
	
	}
	
	
	</style>
		 

	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
     <script type="text/javascript">
     </script>
     
</head>

<body class="inblog-page">
 	<jsp:include page="Header.jsp" /> 
 	<br>
<!--     <div class="header-device-mobile"> -->
<!--         <div class="wapper"> -->
<!--             <div class="item mobile-logo"> -->
<!--                 <div class="logo"><a href="#"><img src="assets/images/logo.png" alt="img"></a></div> -->
<!--             </div> -->
<!--             <div class="item item mobile-search-box has-sub"><a href="#"><span class="icon"><i class="fa fa-search" -->
<!--                             aria-hidden="true"></i></span></a> -->
<!--                 <div class="block-sub"><a href="#" class="close"><i class="fa fa-times" aria-hidden="true"></i></a> -->
<!--                     <div class="header-searchform-box"> -->
<!--                         <form class="header-searchform"> -->
<!--                             <div class="searchform-wrap"><input type="text" class="search-input" -->
<!--                                     placeholder="Enter keywords to search..."><input type="submit" class="submit button" -->
<!--                                     value="Search"></div> -->
<!--                         </form> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <div class="item mobile-settings-box has-sub"><a href="#"><span class="icon"><i class="fa fa-cog" -->
<!--                             aria-hidden="true"></i></span></a> -->
<!--                 <div class="block-sub"><a href="#" class="close"><i class="fa fa-times" aria-hidden="true"></i></a> -->
<!--                     <div class="block-sub-item"> -->
<!--                         <h5 class="block-item-title">Currency</h5> -->
<!--                         <form class="currency-form teamo-language"> -->
<!--                             <ul class="teamo-language-wrap"> -->
<!--                                 <li class="active"><a href="#"><span>English(USD) </span></a></li> -->
<!--                                 <li><a href="#"><span>French(EUR) </span></a></li> -->
<!--                                 <li><a href="#"><span>Japanese(JPY) </span></a></li> -->
<!--                             </ul> -->
<!--                         </form> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <div class="item menu-bar"><a class=" mobile-navigation  menu-toggle" -->
<!--                     href="#"><span></span><span></span><span></span></a></div> -->
<!--         </div> -->
<!--     </div> -->
    <div class="main-content main-content-product no-sidebar">
        <div class="container">
            <div class="row">
                <div class="content-area  shop-grid-content full-width col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="site-main">
                        <div class="shop-top-control">
                            <div class="select-item select-form" style="width:327px"><span class="title">Sort</span>
                            	<select style="background-color:white;height:27px;width:144px" id="quSub" title="sort">
                                    <option value="數學">數學</option>
                                    <option value="英文">英文</option>
                                    <option value="國文">國文</option>
                                </select>
                            </div>
                            <div class="filter-choice select-form" style="width:527px"><span class="title">Sort by</span>
                            	<select style="background-color:white;height:27px;width:144px" id="quEdu" title="by" >
					                <option value="國中">國中</option>
					                <option value="高中">高中</option>
					                <option value="成人">成人</option>
                                </select>
                            </div>
							
							<form action="examUpload" method="post">
								<div>
									<button type="button" id="query"  onclick="examQuery()" style="font-size:15px">查詢</button>
<!-- 									<button id="submit" style="font-size:15px;background-color: #111;">上傳</button> -->
									<button id="submit" class="fa-solid fa-plus" style="font-size:15px;background-color: #111;height: 42px;">上傳</button>
								</div>
							</form>
							
                        </div>
                        <h3 class="custom_blog_title">考卷 </h3>
                        
                        
                        <ul id="table" class="row list-products auto-clear equal-container product-list">
 

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="footer style7">
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
    </footer>
    <div class="footer-device-mobile">
        <div class="wapper">
            <div class="footer-device-mobile-item device-home"><a href="index.html"><span class="icon"><i
                            class="fa fa-home" aria-hidden="true"></i></span>Home </a></div>
            <div class="footer-device-mobile-item device-home device-wishlist"><a href="#"><span class="icon"><i
                            class="fa fa-heart" aria-hidden="true"></i></span>Wishlist </a></div>
            <div class="footer-device-mobile-item device-home device-cart"><a href="#"><span class="icon"><i
                            class="fa fa-shopping-basket" aria-hidden="true"></i><span class="count-icon">0
                        </span></span><span class="text">Cart</span></a></div>
            <div class="footer-device-mobile-item device-home device-user"><a href="#"><span class="icon"><i
                            class="fa fa-user" aria-hidden="true"></i></span>Account </a></div>
        </div>
    </div><a href="#" class="backtotop"><i class="fa fa-angle-double-up"></i></a>
    
<!--     一進來就載入queryall -->
    <script type="text/javascript" src="kai/ExamFrontPageLoad.js"></script>
<!--     <script src="kai/examMenuPlugin.js"></script> -->
</body>



</html>








<!--     <script src="assets/js/jquery-1.12.4.min.js"></script> -->
<!--     <script src="assets/js/jquery.plugin-countdown.min.js"></script> -->
<!--     <script src="assets/js/jquery-countdown.min.js"></script> -->
<!--     <script src="assets/js/bootstrap.min.js"></script> -->
<!--     <script src="assets/js/owl.carousel.min.js"></script> -->
<!--     <script src="assets/js/magnific-popup.min.js"></script> -->
<!--     <script src="assets/js/isotope.min.js"></script> -->
<!--     <script src="assets/js/jquery.scrollbar.min.js"></script> -->
<!--     <script src="assets/js/jquery-ui.min.js"></script> -->
<!--     <script src="assets/js/mobile-menu.js"></script> -->
<!--     <script src="assets/js/chosen.min.js"></script> -->
<!--     <script src="assets/js/slick.js"></script> -->
<!--     <script src="assets/js/jquery.elevateZoom.min.js"></script> -->
<!--     <script src="assets/js/jquery.actual.min.js"></script> -->
<!--     <script src="assets/js/fancybox/source/jquery.fancybox.js"></script> -->
<!--     <script src="assets/js/lightbox.min.js"></script> -->
<!-- <!--     <script src="assets/js/owl.thumbs.min.js"></script> --> -->
<!--     <script src="assets/js/jquery.scrollbar.min.js"></script> -->
<!--     <script src='http://www.google.cn/maps/api/js?key=AIzaSyC3nDHy1dARR-Pa_2jjPCjvsOR4bcILYsM'></script> -->
<!--     <script src="assets/js/frontend-plugin.js"></script> -->
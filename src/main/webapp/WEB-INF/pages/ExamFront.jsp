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

		 
	</style>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
     <script type="text/javascript">
     </script>
</head>

<body class="inblog-page">
 	<jsp:include page="Header.jsp" /> 
    <div class="header-device-mobile">
        <div class="wapper">
            <div class="item mobile-logo">
                <div class="logo"><a href="#"><img src="assets/images/logo.png" alt="img"></a></div>
            </div>
            <div class="item item mobile-search-box has-sub"><a href="#"><span class="icon"><i class="fa fa-search"
                            aria-hidden="true"></i></span></a>
                <div class="block-sub"><a href="#" class="close"><i class="fa fa-times" aria-hidden="true"></i></a>
                    <div class="header-searchform-box">
                        <form class="header-searchform">
                            <div class="searchform-wrap"><input type="text" class="search-input"
                                    placeholder="Enter keywords to search..."><input type="submit" class="submit button"
                                    value="Search"></div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="item mobile-settings-box has-sub"><a href="#"><span class="icon"><i class="fa fa-cog"
                            aria-hidden="true"></i></span></a>
                <div class="block-sub"><a href="#" class="close"><i class="fa fa-times" aria-hidden="true"></i></a>
                    <div class="block-sub-item">
                        <h5 class="block-item-title">Currency</h5>
                        <form class="currency-form teamo-language">
                            <ul class="teamo-language-wrap">
                                <li class="active"><a href="#"><span>English(USD) </span></a></li>
                                <li><a href="#"><span>French(EUR) </span></a></li>
                                <li><a href="#"><span>Japanese(JPY) </span></a></li>
                            </ul>
                        </form>
                    </div>
                </div>
            </div>
            <div class="item menu-bar"><a class=" mobile-navigation  menu-toggle"
                    href="#"><span></span><span></span><span></span></a></div>
        </div>
    </div>
    <div class="main-content main-content-product no-sidebar">
        <div class="container">
            <div class="row">
                <div class="content-area  shop-grid-content full-width col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="site-main">
                        <div class="shop-top-control">
                            <form class="select-item select-form" style="width:40%"><span class="title">Sort</span><select title="sort"
                                    data-placeholder="12 Products/Page" class="chosen-select">
                                    <option value="1">12 Products/Page</option>
                                    <option value="2">9 Products/Page</option>
                                    <option value="3">10 Products/Page</option>
                                    <option value="4">8 Products/Page</option>
                                    <option value="5">6 Products/Page</option>
                                </select></form>
                            <form class="filter-choice select-form"><span class="title">Sort by</span><select title="by"
                                    data-placeholder="Price: Low to High" class="chosen-select">
                                    <option value="1">Default sorting</option>
                                    <option value="2">Sort by popularity</option>
                                    <option value="3">Sort by average rating</option>
                                    <option value="4">Sort by newness</option>
                                    <option value="5">Sort by price:low to high</option>
                                </select></form>
                            <div class="grid-view-mode">

                            </div>
                        </div>
                        <h3 class="custom_blog_title">List Products </h3>
                        <ul class="row list-products auto-clear equal-container product-list">
                            <li
                                class="product-item style-list col-lg-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-ts-12">
                                <div class="product-inner equal-element">
                                    <div class="product-top">
                                        <div class="flash"><span class="onnew"><span class="text">熱門</span></span>
                                        </div>
                                    </div>
                                    <div class="products-bottom-content">
                                        <div class="product-thumb">
                                            <div class="thumb-inner"><a href="#"><img
                                                        src="assets/images/product-item-4.jpg" alt="img"></a><a href="#"
                                                    class="button quick-wiew-button">Quick View</a></div>
                                        </div>
                                        <div class="product-info-left">
                                            <div class="yith-wcwl-add-to-wishlist">
                                                <div class="yith-wcwl-add-button"><a href="#">Add to Wishlist</a></div>
                                            </div>
                                            <h5 class="product-name product_title"><a href="#">European Pan Palm</a>
                                            </h5>
                                            <div class="stars-rating">
                                                <div class="star-rating"><span class="star-3"></span></div>
                                                <div class="count-star">(3) </div>
                                            </div>
                                            <ul class="product-attributes">
                                                <li>Material:</li>
                                                <li><a href="#">Plastic</a></li>
                                                <li><a href="#">Woody</a></li>
                                            </ul>
                                            <ul class="attributes-display">
                                                <li class="swatch-color">Color:</li>
                                                <li class="swatch-color"><a href="#">Black</a></li>
                                                <li class="swatch-color"><a href="#">White</a></li>
                                                <li class="swatch-color"><a href="#">Brown</a></li>
                                            </ul>
                                            <ul class="attributes-display">
                                                <li class="swatch-text-label">Pots Size:</li>
                                                <li class="swatch-text-label"><a href="#">XS</a></li>
                                                <li class="swatch-text-label"><a href="#">S</a></li>
                                                <li class="swatch-text-label"><a href="#">M</a></li>
                                                <li class="swatch-text-label"><a href="#">L</a></li>
                                                <li class="swatch-text-label"><a href="#">XL</a></li>
                                            </ul>
                                        </div>
                                        <div class="product-info-right">
                                            <div class="price">$45 </div>
                                            <div class="product-list-message"><i class="icon fa fa-truck"
                                                    aria-hidden="true"></i>UK Free Delivery </div>
                                            <form class="cart">
                                                <div class="single_variation_wrap">
                                                    <div class="quantity">
                                                        <div class="control"><a
                                                                class="btn-number qtyminus quantity-minus"
                                                                href="#">-</a><input type="text" data-step="1"
                                                                data-min="0" value="1" title="Qty" class="input-qty qty"
                                                                size="4"><a href="#"
                                                                class="btn-number qtyplus quantity-plus">+</a></div>
                                                    </div><button class="single_add_to_cart_button button">Add to
                                                        cart</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </li>

                        </ul>
                        <div class="pagination clearfix style2">
                            <div class="nav-link"><a href="#" class="page-numbers"><i class="icon fa fa-angle-left"
                                        aria-hidden="true"></i></a><a href="#" class="page-numbers">1</a><a href="#"
                                    class="page-numbers">2</a><a href="#" class="page-numbers current">3</a><a href="#"
                                    class="page-numbers"><i class="icon fa fa-angle-right" aria-hidden="true"></i></a>
                            </div>
                        </div>
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
</body>



</html>
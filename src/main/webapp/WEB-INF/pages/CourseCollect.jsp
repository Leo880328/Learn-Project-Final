<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,fourth.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的收藏</title>
</head>
<body class="productsgrid-page">
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
    <br>
    <div class="main-content main-content-product no-sidebar">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-trail breadcrumbs">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="content-area shop-grid-content full-width col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="site-main">
                        <h3 class="custom_blog_title">我的收藏 </h3>

                        <ul class="row list-products auto-clear equal-container product-grid">
                     <c:forEach var="collect" items="${cList}">
                            <li
                                class="product-item product-type-variable col-lg-3 col-md-4 col-sm-6 col-xs-6 col-ts-12 style-1">
                                <div class="product-inner equal-element">
                                    <div class="product-top"></div>
                                    <div class="product-thumb">
                                        <div class="thumb-inner"><a href="coursefront.details?courseId=${collect.courseBeans.courseId}">
                                        <img src="<c:out value="${collect.courseBeans.course_picture}"/>"
                                                    alt="img"></a>
<!--                                             <div class="thumb-group"> -->
<!--                                                 <div class="yith-wcwl-add-to-wishlist"> -->
<!--                                                     <div class="yith-wcwl-add-button"><a href="#">Add to Wishlist</a> -->
<!--                                                     </div> -->
<!--                                                 </div><a href="#" class="button quick-wiew-button">Quick View</a> -->
<!--                                                 <div class="loop-form-add-to-cart"><button -->
<!--                                                         class="single_add_to_cart_button button">Add to cart </button> -->
<!--                                                 </div> -->
<!--                                             </div> -->
                                        </div>
                                    </div>
                                    <div class="product-info">
                                        <h5 class="product-name product_title" style="font-size: 1.5em"><a href="coursefront.details?courseId=${collect.courseBeans.courseId}">
                                        <c:out value="${collect.collectName}"/></a></h5>
                                        <div class="group-info">
                                            <div class="stars-rating">
                                                <div class="star-rating"><span class="star-5"></span></div>
                                                <div class="count-star">(5) </div>
                                            </div>
                                            <div class="price"><ins>$ <c:out value="${collect.courseBeans.course_price}"/> </ins></div>
                                              <div class="bookmark" style="margin-right: -220px" onclick="delCollectById(${collect.id})">
                                              <i class="fa-solid fa-bookmark" style="font-size:22px;color:#65a15a"></i>
                                              </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
</c:forEach>
                        </ul>
<!--                         <div class="pagination clearfix style2"> -->
<!--                             <div class="nav-link"><a href="#" class="page-numbers"><i class="icon fa fa-angle-left" -->
<!--                                         aria-hidden="true"></i></a><a href="#" class="page-numbers">1</a><a href="#" -->
<!--                                     class="page-numbers">2</a><a href="#" class="page-numbers current">3</a><a href="#" -->
<!--                                     class="page-numbers"><i class="icon fa fa-angle-right" aria-hidden="true"></i></a> -->
<!--                             </div> -->
<!--                         </div> -->
                    </div>
                </div>
            </div>
        </div>
    </div>

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
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
    <jsp:include page="Footer.jsp" />
    <script src="xiang/coursefront.js"></script>
</body>
</html>
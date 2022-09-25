<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,fourth.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>課程列表</title>
</head>
<body class="inblog-page">
<jsp:include page="Header.jsp"/>


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
                <div class="col-lg-12">
                    <div class="breadcrumb-trail breadcrumbs">
<!--                         <ul class="trail-items breadcrumb"> -->
<!--                             <li class="trail-item trail-begin"><a href="index.html">首頁</a></li> -->
<!--                             <li class="trail-item trail-end active">課程列表 </li> -->
<!--                         </ul> -->
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="content-area  shop-grid-content full-width col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="site-main">
                        <div class="shop-top-control">
                            <form class="select-item select-form"><span class="title">Sort</span><select title="sort"
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
                                <div class="inner"><a href="coursefront2.list"
                                        class="modes-mode mode-list active"><span></span><span></span></a><a
                                        href="coursefront1.list"
                                        class="modes-mode mode-grid"><span></span><span></span><span></span><span></span></a>
                                </div>
                            </div>
                        </div>
                        <h3 class="custom_blog_title">所有課程 </h3>
                        <ul class="row list-products auto-clear equal-container product-list">
                        <c:forEach var="course" items="${list}">
                            <li
                                class="product-item style-list col-lg-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-ts-12">
                                <div class="product-inner equal-element">
                                    <div class="product-top">

                                    </div>
                                    <div class="products-bottom-content">
                                        <div class="product-thumb">
                                            <div class="thumb-inner"><a href="#"><img
                                                        src="<c:out value="${course.course_picture}"/>" alt="img"></a><a href="#"
                                                    class="button quick-wiew-button">Quick View</a></div>
                                        </div>
                                        <div class="product-info-left">
                                            <div class="yith-wcwl-add-to-wishlist">
                                                <div class="yith-wcwl-add-button"><a href="#">Add to Wishlist</a></div>
                                            </div>
                                            <h5 class="product-name product_title"><a href="coursefront.details?course_id=${course.course_id}"><c:out value="${course.course_name}"/></a>
                                            </h5>
                                            <div class="stars-rating">
                                                <div class="star-rating"><span class="star-3"></span></div>
                                                <div class="count-star">(3) </div>
                                            </div>
                                            <ul class="product-attributes">
                                                <li>課程編號:</li>
                                                <li><c:out value="${course.course_id}"/></li>
                                            </ul>
                                            <ul class="product-attributes">
                                                <li>課程講師:</li>
                                                <li><c:out value="${course.lecturer_name}"/></li>
                                            </ul>
                                            <ul class="attributes-display">
                                                <li class="swatch-color">已購買人數:</li>
                                                <li class="swatch-color"><c:out value="${course.enrollment}"/></li>

                                            </ul>
                                            <ul class="attributes-display">
                                                <li class="swatch-text-label">上架日期:</li>
                                                <li class="swatch-text-label"><c:out value="${course.course_date}"/></li>

                                            </ul>
                                        </div>
                                        <div class="product-info-right">
                                        <br>
                                            <div class="product-list-message">課程價格 </div>
                                            <div class="price">$ <c:out value="${course.course_price}"/></div>
                                            <form class="cart">
                                                <div class="single_variation_wrap">
                                                    <div class="quantity">
                                                        <div class="control"><a
                                                                class="btn-number qtyminus quantity-minus"
                                                                href="#">-</a><input type="text" data-step="1"
                                                                data-min="0" value="1" title="Qty" class="input-qty qty"
                                                                size="4"><a href="#"
                                                                class="btn-number qtyplus quantity-plus">+</a></div>
                                                    </div><button
                                                        class="single_add_to_cart_button button">加入購物車</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            </c:forEach>
                            </ul>
                            </div>


                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
<br><br>
<jsp:include page="Footer.jsp"/>

</body>
</html>
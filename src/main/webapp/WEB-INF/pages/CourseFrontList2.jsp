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

	<jsp:include page="Header.jsp" />


	<div class="header-device-mobile">
		<div class="wapper">
			<div class="item mobile-logo">
				<div class="logo">
					<a href="#"><img src="assets/images/logo.png" alt="img"></a>
				</div>
			</div>
			<div class="item item mobile-search-box has-sub">
				<a href="#"><span class="icon"><i class="fa fa-search"
						aria-hidden="true"></i></span></a>
				<div class="block-sub">
					<a href="#" class="close"><i class="fa fa-times"
						aria-hidden="true"></i></a>
					<div class="header-searchform-box">
						<form class="header-searchform">
							<div class="searchform-wrap">
								<input type="text" class="search-input"
									placeholder="Enter keywords to search..."><input
									type="submit" class="submit button" value="Search">
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="item mobile-settings-box has-sub">
				<a href="#"><span class="icon"><i class="fa fa-cog"
						aria-hidden="true"></i></span></a>
				<div class="block-sub">
					<a href="#" class="close"><i class="fa fa-times"
						aria-hidden="true"></i></a>
					<div class="block-sub-item">
						<h5 class="block-item-title">Currency</h5>
						<form class="currency-form teamo-language">
							<ul class="teamo-language-wrap">
								<li class="active"><a href="#"><span>English(USD)
									</span></a></li>
								<li><a href="#"><span>French(EUR) </span></a></li>
								<li><a href="#"><span>Japanese(JPY) </span></a></li>
							</ul>
						</form>
					</div>
				</div>
			</div>
			<div class="item menu-bar">
				<a class=" mobile-navigation  menu-toggle" href="#"><span></span><span></span><span></span></a>
			</div>
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
			<!--             <h3 class="custom_blog_title">所有課程 </h3> -->
			<div class="row">
				<div
					class="content-area  shop-grid-content full-width col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="site-main">
						<div class="shop-top-control">
							<div class="form-content">
								<div class="inner">
									<form action="coursefront.tqname" method="post">
										<input type="text" class="input" name="keyword" value=""
											placeholder="請輸入課程名稱" style="background-color: white">
										<button type="submit">
											<span class="icon-search"><i
												class="fa-solid fa-magnifying-glass"></i> </span>
										</button>
										<p>${errorMsgMap.QueryError}</p>
									</form>
								</div>
							</div>
							<div class="grid-view-mode">
								<!--                                 <div class="inner"><a href="coursefront2.list" -->
								<!--                                         class="modes-mode mode-list active"><span></span><span></span></a><a -->
								<!--                                         href="coursefront1.list" -->
								<!--                                         class="modes-mode mode-grid"><span></span><span></span><span></span><span></span></a> -->
								<!--                                 </div> -->

								<div class="inner">
									<a href="course.add" class="mode-list active"><i
										class="fa-solid fa-plus"></i>新增課程<span></span><span></span></a>
								</div>


							</div>
						</div>

						<ul
							class="row list-products auto-clear equal-container product-list">
							<c:choose>
								<c:when test="${queryResult != null }">
									<c:forEach var="course" items="${queryResult}">
										<c:if test="${course.course_status == 2}">
											<li
												class="product-item style-list col-lg-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-ts-12">
												<div class="product-inner equal-element">
													<div class="product-top"></div>
													<div class="products-bottom-content">
														<div class="product-thumb">
															<div class="thumb-inner">
																<a href="#"><img
																	src="<c:out value="${course.course_picture}"/>"
																	alt="img"></a>
															</div>
														</div>
														<div class="product-info-left">
															<div class="yith-wcwl-add-to-wishlist">
																<div class="yith-wcwl-add-button">
																	<a href="#">Add to Wishlist</a>
																</div>
															</div>
															<h5 class="product-name product_title">
																<c:if test="${course.course_status == 1}">
																	<c:out value="${course.course_name}" />
																</c:if>
																<c:if test="${course.course_status == 2}">
																	<a
																		href="coursefront.details?courseId=${course.courseId}">
																		<c:out value="${course.course_name}" />
																	</a>
																</c:if>
															</h5>
															<div class="stars-rating">
																<div class="star-rating">
																	<span class="star-5"></span>
																</div>
																<div class="count-star">(5)</div>
															</div>
															<ul class="product-attributes">
																<li>課程編號:</li>
																<li><c:out value="${course.courseId}" /></li>
															</ul>
															<ul class="product-attributes">
																<li>課程講師:</li>
																<li><c:out value="${course.lecturer_name}" /></li>
															</ul>
															<ul class="attributes-display">
																<li class="swatch-color">已購買人數:</li>
																<li class="swatch-color"><c:out
																		value="${course.enrollment}" /></li>

															</ul>
															<ul class="attributes-display">
																<li class="swatch-text-label">上架日期:</li>
																<li class="swatch-text-label"><c:out
																		value="${course.course_date}" /></li>

															</ul>
															<ul class="attributes-display">
																<li class="swatch-text-label">狀態:</li>
																<c:if test="${course.course_status == 1}">
																	<li class="swatch-text-label">未審核</li>
																</c:if>
																<c:if test="${course.course_status == 2}">
																	<li class="swatch-text-label">審核完成</li>
																</c:if>
															</ul>
														</div>
														<div class="product-info-right">
															<br>
															<div class="product-list-message">課程價格</div>
															<div class="price">
																$
																<c:out value="${course.course_price}" />
															</div>
															<form class="cart">
																<div class="single_variation_wrap">
																	<div class="quantity">
																		<div class="control">
																			<a class="btn-number qtyminus quantity-minus"
																				href="#">-</a><input type="text" data-step="1"
																				data-min="0" value="1" title="Qty"
																				class="input-qty qty" size="4"><a href="#"
																				class="btn-number qtyplus quantity-plus">+</a>
																		</div>
																	</div>
																	<c:if test="${course.course_status == 2}">
																		<button class="single_add_to_cart_button button">
																			加入購物車 <i class="fa-solid fa-cart-shopping"></i>
																		</button>
																	</c:if>
																</div>
															</form>
														</div>
													</div>
												</div>
											</li>
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach var="course" items="${list}">
										<c:if test="${course.course_status == 1}">
											<div>
												<h3 class="custom_blog_title">待審核課程</h3>
											</div>
											<li
												class="product-item style-list col-lg-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-ts-12">
												<div class="product-inner equal-element">
													<div class="product-top"></div>
													<div class="products-bottom-content">
														<div class="product-thumb">
															<div class="thumb-inner">
																<img src="<c:out value="${course.course_picture}"/>"
																	alt="img">
															</div>
														</div>
														<div class="product-info-left">
															<div class="yith-wcwl-add-to-wishlist">
																<div class="yith-wcwl-add-button">
																	<a href="#">Add to Wishlist</a>
																</div>
															</div>
															<h5 class="product-name product_title">
																<c:if test="${course.course_status == 1}">
																	<c:out value="${course.course_name}" />
																</c:if>
																<c:if test="${course.course_status == 2}">
																	<a
																		href="coursefront.details?courseId=${course.courseId}">
																		<c:out value="${course.course_name}" />
																	</a>
																</c:if>
															</h5>
															<br>
															<ul class="product-attributes">
																<li>課程編號:</li>
																<li><c:out value="${course.courseId}" /></li>
															</ul>
															<ul class="product-attributes">
																<li>課程講師:</li>
																<li><c:out value="${course.lecturer_name}" /></li>
															</ul>
															<ul class="attributes-display">
																<li class="swatch-color">已購買人數:</li>
																<li class="swatch-color"><c:out
																		value="${course.enrollment}" /></li>

															</ul>
															<ul class="attributes-display">
																<li class="swatch-text-label">上架日期:</li>
																<li class="swatch-text-label"><c:out
																		value="${course.course_date}" /></li>

															</ul>
															<ul class="attributes-display">
																<li class="swatch-text-label">狀態:</li>
																<c:if test="${course.course_status == 1}">
																	<li class="swatch-text-label" style="color:red">未審核</li>
																</c:if>
																<c:if test="${course.course_status == 2}">
																	<li class="swatch-text-label" >審核完成</li>
																</c:if>
															</ul>
														</div>
														<div class="product-info-right">
															<br>
															<div class="product-list-message">課程價格</div>
															<div class="price">
																$
																<c:out value="${course.course_price}" />
															</div>
															<div class="single_variation_wrap">
																<div class="quantity">
																	<div class="control">
																		<a class="btn-number qtyminus quantity-minus" href="#">-</a><input
																			type="text" data-step="1" data-min="0" value="1"
																			title="Qty" class="input-qty qty" size="4"><a
																			href="#" class="btn-number qtyplus quantity-plus">+</a>
																	</div>
																</div>
																<c:if test="${course.course_status == 1}">
																	<button
																				onclick="del(${course.courseId})"
																				class="single_add_to_cart_button button"
																				style="background-color: red">
																				  刪除課程  <i class="fa-solid fa-trash"></i>
																			</button>
																</c:if>
															</div>
														</div>
													</div>
												</div>
											</li>
										</c:if>
									</c:forEach>
									<c:forEach var="course" items="${list}">
										<c:if test="${course.course_status == 3}">
											<div>
												<h3 class="custom_blog_title">已駁回課程</h3>
											</div>
											<li
												class="product-item style-list col-lg-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-ts-12">
												<div class="product-inner equal-element">
													<div class="product-top"></div>
													<div class="products-bottom-content">
														<div class="product-thumb">
															<div class="thumb-inner">
																<a href="coursefront.show?courseId=${course.courseId}"><img
																	src="<c:out value="${course.course_picture}"/>"
																	alt="img"></a>
															</div>
														</div>
														<div class="product-info-left">
															<div class="yith-wcwl-add-to-wishlist">
																<div class="yith-wcwl-add-button">
																	<a href="#">Add to Wishlist</a>
																</div>
															</div>
															<h5 class="product-name product_title">
																<c:if
																	test="${course.course_status == 1 || course.course_status == 3}">
																	<a
																		href="coursefront.show?courseId=${course.courseId}">
																		<c:out value="${course.course_name}" />
																	</a>
																</c:if>
																<c:if test="${course.course_status == 2}">
																	<a
																		href="coursefront.details?courseId=${course.courseId}">
																		<c:out value="${course.course_name}" />
																	</a>
																</c:if>
															</h5>
															<div class="stars-rating">
																<c:if test="${course.course_status == 3}">
																</c:if>
															</div>
															<ul class="product-attributes">
																<li>課程編號:</li>
																<li><c:out value="${course.courseId}" /></li>
															</ul>
															<ul class="product-attributes">
																<li>課程講師:</li>
																<li><c:out value="${course.lecturer_name}" /></li>
															</ul>
															<ul class="attributes-display">
																<li class="swatch-color">已購買人數:</li>
																<li class="swatch-color"><c:out
																		value="${course.enrollment}" /></li>

															</ul>
															<ul class="attributes-display">
																<li class="swatch-text-label">上架日期:</li>
																<li class="swatch-text-label"><c:out
																		value="${course.course_date}" /></li>

															</ul>
															<ul class="attributes-display">
																<li class="swatch-text-label">狀態:</li>
																<c:if test="${course.course_status == 1}">
																	<li class="swatch-text-label" style="color:red">未審核</li>
																</c:if>
																<c:if test="${course.course_status == 2}">
																	<li class="swatch-text-label">審核完成</li>
																</c:if>
																<c:if test="${course.course_status == 3}">
																	<li class="swatch-text-label" style="color:red">已駁回</li>
																</c:if>
															</ul>
															<br>
															<ul class="attributes-display">
																<a href="coursefront.show?courseId=${course.courseId}">
																	<li class="swatch-text-label" style="color: red"><i
																		class="fa-solid fa-circle-info"></i></i></li>
																	<li class="swatch-text-label" style="color: red">可修改課程資訊並重新送出審核</li>
																</a>
															</ul>


														</div>
														<div class="product-info-right">
															<br>
															<div class="product-list-message">課程價格</div>
															<div class="price">
																$
																<c:out value="${course.course_price}" />
															</div>
																<div class="single_variation_wrap">
																	<div class="quantity">
																		<div class="control">
																			<a class="btn-number qtyminus quantity-minus"
																				href="#">-</a><input type="text" data-step="1"
																				data-min="0" value="1" title="Qty"
																				class="input-qty qty" size="4"><a href="#"
																				class="btn-number qtyplus quantity-plus">+</a>
																		</div>
																	</div>
																<button
																				onclick="del(${course.courseId})"
																				class="single_add_to_cart_button button"
																				style="background-color: red">
																				  刪除課程  <i class="fa-solid fa-trash"></i>
																			</button>
															</div>
														</div>
													</div>
												</div>
											</li>
										</c:if>
									</c:forEach>
									<div>
										<h3 class="custom_blog_title">已審核課程</h3>
									</div>
									<c:forEach var="course" items="${queryResult5}">
										<c:if test="${course.course_status == 2}">
											<li
												class="product-item style-list col-lg-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-ts-12">
												<div class="product-inner equal-element">
													<div class="product-top"></div>
													<div class="products-bottom-content">
														<div class="product-thumb">
															<div class="thumb-inner">
																<a href="#"><img
																	src="<c:out value="${course.course_picture}"/>"
																	alt="img"></a>
															</div>
														</div>
														<div class="product-info-left">
															<div class="yith-wcwl-add-to-wishlist">
																<div class="yith-wcwl-add-button">
																	<a href="#">Add to Wishlist</a>
																</div>
															</div>
															<h5 class="product-name product_title">
																<c:if test="${course.course_status == 1}">
																	<c:out value="${course.course_name}" />
																</c:if>
																<c:if test="${course.course_status == 2}">
																	<a
																		href="coursefront.details?courseId=${course.courseId}">
																		<c:out value="${course.course_name}" />
																	</a>
																</c:if>
															</h5>
															<div class="stars-rating">
																<div class="star-rating">
																	<span class="star-5"></span>
																</div>
																<div class="count-star">(5)</div>
															</div>
															<ul class="product-attributes">
																<li>課程編號:</li>
																<li><c:out value="${course.courseId}" /></li>
															</ul>
															<ul class="product-attributes">
																<li>課程講師:</li>
																<li><c:out value="${course.lecturer_name}" /></li>
															</ul>
															<ul class="attributes-display">
																<li class="swatch-color">已購買人數:</li>
																<li class="swatch-color"><c:out
																		value="${course.enrollment}" /></li>

															</ul>
															<ul class="attributes-display">
																<li class="swatch-text-label">上架日期:</li>
																<li class="swatch-text-label"><c:out
																		value="${course.course_date}" /></li>

															</ul>
															<ul class="attributes-display">
																<li class="swatch-text-label">狀態:</li>
																<c:if test="${course.course_status == 1}">
																	<li class="swatch-text-label" style="color:red">未審核</li>
																</c:if>
																<c:if test="${course.course_status == 2}">
																	<li class="swatch-text-label">審核完成</li>
																</c:if>
															</ul>
														</div>
														<div class="product-info-right">
															<br>
															<div class="product-list-message">課程價格</div>
															<div class="price">
																$
																<c:out value="${course.course_price}" />
															</div>
																<div class="single_variation_wrap">
																	<div class="quantity">
																		<div class="control">
																			<a class="btn-number qtyminus quantity-minus"
																				href="#">-</a><input type="text" data-step="1"
																				data-min="0" value="1" title="Qty"
																				class="input-qty qty" size="4"><a href="#"
																				class="btn-number qtyplus quantity-plus">+</a>
																		</div>
																	</div>
																	<c:if test="${course.course_status == 2}">
																		<button class="single_add_to_cart_button button">
																			加入購物車 <i class="fa-solid fa-cart-shopping"></i>
																		</button>
																		<br>
<%-- 																		<a href="coursefront.delete?courseId=${course.courseId}"> --%>
<!-- 																			<button -->
<!-- 																				onclick="if( !(confirm('確認刪除?') ) ) return false; alert('刪除成功!')" -->
<!-- 																				class="single_add_to_cart_button button" -->
<!-- 																				style="background-color: red"> -->
<!-- 																				  刪除課程  <i class="fa-solid fa-trash"></i> -->
<!-- 																			</button> -->
                                                                             <button
																				onclick="del(${course.courseId})"
																				class="single_add_to_cart_button button"
																				style="background-color: red">
																				  刪除課程  <i class="fa-solid fa-trash"></i>
																			</button>
<!-- 																		</a> -->
																	</c:if>
																</div>
														</div>
													</div>
												</div>
											</li>
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>

					<!--                        <div class="pagination clearfix style3"> -->
					<!--                             <div class="nav-link"><a href="#" class="page-numbers"><i class="icon fa fa-angle-left" -->
					<!--                                         aria-hidden="true"></i></a><a href="#" class="page-numbers current">1</a><a href="#" -->
					<!--                                     class="page-numbers">2</a><a href="#" class="page-numbers">3</a><a href="#" -->
					<!--                                     class="page-numbers"><i class="icon fa fa-angle-right" aria-hidden="true"></i></a> -->
					<!--                             </div> -->
					<!--                         </div> -->

				</div>

			</div>
		</div>
	</div>
	</div>
	</div>
	<br>
	<br>
	<jsp:include page="Footer.jsp" />

<script src="xiang/coursefront.js"></script>
<!-- <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script> -->
</body>
</html>
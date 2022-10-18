<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,fourth.*"%>
<%@ page import="fourth.bean.MemberBean"%>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="<%=request.getContextPath()%>/">
<link rel="shortcut icon" type="image/x-icon" href="backend/img/smalllogo.png" />
<title>課程詳情</title>
<style type="text/css">
.alb{
 margin: auto;
 width: 70%;
 
}

.font{
 font-size: 1.5em;
}

</style>

</head>
<jsp:include page="Header.jsp"/>
<body class="details-page">

	<div class="main-content main-content-details single no-sidebar">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-trail breadcrumbs">
						<ul class="trail-items breadcrumb">
							<c:if test="${sessionScope.user.status == 3 }">
								<li class="trail-item trail-begin"><a href="backendIndex">首頁</a></li>

							</c:if>
							<c:if test="${sessionScope.user.status != 3 }">
								<li class="trail-item trail-begin"><a href="Index">首頁</a></li>
							</c:if>

							<li class="trail-item"><a href="coursefront1.list">課程列表</a></li>
							<li class="trail-item trail-end active">課程詳情</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div
					class="content-area content-details full-width col-lg-9 col-md-8 col-sm-12 col-xs-12">
					<div class="site-main">
						<div class="details-product">
							<div class="details-thumd">
								<div
									class="image-preview-container image-thick-box image_preview_container">
									<img id="img_zoom" data-zoom-image="${cbean.course_picture}"
										src="${cbean.course_picture}" alt="img"><a href="#"
										class="btn-zoom open_qv"><i class="fa fa-search"
										aria-hidden="true"></i></a>
								</div>

							</div>
							<div class="details-infor">
								<h1>${cbean.course_name}</h1>
								<div class="stars-rating">
									<div class="star-rating">
										<span class="star-5"></span>
									</div>
									<div class="count-star">(7)</div>
								</div>
<br><br>
								<div class="product-details-description">
									<ul>
										<li class="font">課程時長:${cbean.course_duration}</li><br>
										<li class="font">已購買人數:${cbean.enrollment}</li><br>
										<li class="font">講師姓名:${cbean.lecturer_name}</li><br>
										<li class="font">講師信箱:${cbean.lecturer_email}</li><br>
<%-- 										<li class="font">上架日期:${cbean.course_date}</li><br> --%>
									</ul>
								</div>

								<div class="group-button">
									<div class="yith-wcwl-add-to-wishlist collect">
									</div>
									<div class="font">課程價格:</div><br>
									<div style="font-weight: bold;font-size: 2em">
										<span>$ ${cbean.course_price}</span>
								</div><br>
									<button class="single_add_to_cart_button button" onclick="add(${cbean.courseId})">加入購物車</button>

								</div>
							</div>
						</div>
						<div class="tab-details-product">
							<ul class="tab-link">
								<li class="active"><a data-toggle="tab"
									aria-expanded="true"><h3>課程簡介</h3></a></li>
							</ul>
							<div class="tab-container">
								<div id="product-descriptions" class="tab-panel active">
									<h5 style="text-align: center">
										<i class="fa-solid fa-star"></i> ${cbean.course_introduction}
									</h5>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="comments-area" style="width: 80%; margin: auto">
		<h3 class="custom_blog_title">
			課程評論 <span class="count"></span>
		</h3>
		<div class="comment-form">
			<form action="coursecomments.add?courseId=${cbean.courseId}"
				class="cmf" method="post">
				<c:if test="${sessionScope.user != null}">
					<p class="comment-reply-content">
						<input type="text" class="comm" placeholder="請寫下你的評論"
							name="comments" size="100"
							style="border-radius: 35px; border: solid 3px" oninput="aaaa()">
					</p>
			</form>
			<p style="text-align: right">
				<span class="controll"><i class="icon fa fa-file-image-o"
					aria-hidden="true"></i><i class="icon fa fa-paperclip"
					aria-hidden="true"></i><i class="icon fa fa-smile-o"
					aria-hidden="true"></i>
				<button type="button" onclick="commentsAdd()" class="make"
						disabled="disabled" style="background-color: #E0E0E0">發布評論</button></span>
			</p>

		</div>
		</c:if>
		<c:forEach var="com" items="${comments}">
			<ul class="comment-list">
				<li class="comment">
					<div class="comment-item">
						<div class="author-view">
							<div class="author">
								<div class="avt">
									<img src="<c:out value="${com.memberBean.img}"/>" alt="img">
								</div>
								<h1 class="name">
									<c:out value="${com.memberBean.nick}" />
								</h1>
							</div>
							<div class="date-reply-comment">
								<span class="date-comment"><c:out
										value="${com.commentsDate}" /> </span>
							</div>
							<c:if
								test="${sessionScope.user.userId == com.memberBean.userId || sessionScope.user.status == 3 }">
								<span><i class="fa-regular fa-trash-can"
									onclick="commentsDel(${com.commentsId})"
									style="font-size: 20px"></i></span>
							</c:if>
						</div>
						<div class="comment-body">
							<div class="comment-content">
								<p>
								<h5>
									<c:out value="${com.comments}" />
								</h5>

								</p>
							</div>
							<div class="comment-reply-link">
								<span class="like"><i class="icon fa fa-thumbs-o-up"
									aria-hidden="true"></i> </span><span class="dislike"><i
									class="icon fa fa-thumbs-o-down" aria-hidden="true"></i></span>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</c:forEach>
	</div>

	<br>
	<br>
	<hr>

	<div style="clear: left;"></div>
	<div class="related products product-grid">
		<h2 class="product-grid-title">你可能會喜歡</h2>

		<div class="alb owl-products owl-slick equal-container nav-center" 
			data-slick='{"autoplay":false, "autoplaySpeed":1000, "arrows":true, "dots":false, "infinite":true, "speed":300, "rows":1}'
			data-responsive='[{"breakpoint":"2000","settings":{"slidesToShow":3}},{"breakpoint":"1200","settings":{"slidesToShow":2}},{"breakpoint":"992","settings":{"slidesToShow":2}},{"breakpoint":"480","settings":{"slidesToShow":1}}]'>
			<c:forEach var="course" items="${list}">
				<div class="product-item style-1" >
					<div class="product-inner equal-element">
						<div class="product-top"></div>
						<div class="product-thumb">
							<div class="thumb-inner">

								<a href="coursefront.details?courseId=${course.courseId}"><img src="<c:out value="${course.course_picture}" />"
									alt="img"></a>

							</div>
						</div>
						<div class="product-info">
							<h5 class="product-name product_title">
								<a href="coursefront.details?courseId=${course.courseId}"><c:out value="${course.course_name}" /></a>
							</h5>
							<div class="group-info">
								<div class="stars-rating">
									<div class="star-rating">
										<span class="star-5"></span>
									</div>
									<div class="count-star">(5)</div>
								</div>
								<div class="price">
									<ins>$ <c:out value="${course.course_price}" /> </ins>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>
<br>
<jsp:include page="Footer.jsp"/>
<script src="wayne/cart.js"></script>
<script src="xiang/coursefront.js"></script>
<script src="xiang/coursecomments.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>
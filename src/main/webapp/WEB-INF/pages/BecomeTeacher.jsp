<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,fourth.*"%>
<%@ page import="fourth.bean.MemberBean"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Happy Learning</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<%
MemberBean memberBean = (MemberBean) request.getAttribute("user");
%>

<body class="details-page">
	<jsp:include page="Header.jsp" />
	<div class="main-content main-content-details single no-sidebar">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-trail breadcrumbs">
						<ul class="trail-items breadcrumb">

						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div
					class="content-area content-details full-width col-lg-9 col-md-8 col-sm-12 col-xs-12">
					<div class="site-main">
						<div class="details-product">
							<div class="">
								<h1 class="">申請成為老師</h1>
								<div class="price">
									<span class="form-label">信箱（此為你的驗證信箱，如需變更請至 個人資料）: </span><span
										class="form-control-wrap "><p><%=memberBean.getEmail()%></p></span>
								</div>

								<div class="availability">
									<p>
										<span class="form-label">姓名(全名) *</span><span
											class="form-control-wrap your-name"><input
											title="your-name" type="text" name="your-name" size="40"
											class="form-control form-control-name"></span>
									</p>
									<p>
										<span class="form-label">電話 *</span><span
											class="form-control-wrap your-phone"><input
											title="your-phone" type="text" name="your-phone"
											class="form-control form-control-phone"></span>
									</p>
									<p>
										<span class="form-label">學歷 *</span><span
											class="form-control-wrap your-name"><input
											title="your-name" type="text" name="your-name" size="40"
											class="form-control form-control-name"></span>
									</p>
									<p>
										<span class="form-label">自我介紹 * </span><span
											class="wpcf7-form-control-wrap your-message"><textarea
												title="your-message" name="your-message" cols="40" rows="9"
												class="form-control your-textarea"></textarea></span>
									</p>
								</div>
								<div class="product-details-description"></div>

								<div class="quantity-add-to-cart">
									<div class="quantity"></div>
									<button class="single_add_to_cart_button button">申請成為老師</button>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	</div>

</body>
<jsp:include page="Footer.jsp" />
</html>
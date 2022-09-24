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

<style>
#teamo-google-maps {
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
									<c:if
															test="<%=memberBean.getStatus() == 1%>">
										<button type="submit">
											<a href="becometeacher.controller">申請成為老師</a>
									</button>
									</c:if>
									<form action="updateMyUser" method="post"
										class="teamo-contact-fom">
										<div class="row">
											<div class="col-sm-6">
												<%
												if (memberBean.getNick() == null) {
													memberBean.setNick("");
												}
												if (memberBean.getName() == null) {
													memberBean.setName("");
												}
												if (memberBean.getCellphone() == null) {
													memberBean.setCellphone("");
												}
												%>
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
														class="form-control-wrap "><select name="sex">
															<option><%=memberBean.getSex()%></option>
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
														class="form-control-wrap "> <c:if
															test="<%=memberBean.getStatus() == 1%>">
															<p>
																<option value="1">學生</option>
															</p>
														</c:if> <c:if test="<%=memberBean.getStatus() == 2%>">
															<option value="2">老師</option>
														</c:if> <c:if test="<%=memberBean.getStatus() == 3%>">
															<option value="3">管理員</option>
														</c:if>
													</span>
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
												class="wpcf7-form-control-wrap "><img id="img"
												data-zoom-image="<%=memberBean.getImg()%>"
												src="<%=memberBean.getImg()%>" alt="img" width="250px"
												height="250px"><a href="#" class="btn-zoom open_qv"><i
													class="fa fa-search" aria-hidden="true"></i></a><input
												id="imgPath" type="hidden" name="img" title="大頭貼"
												value="<%=memberBean.getImg()%>"> <input
												onchange="previewImg(this)" type="file" title="大頭貼"></span>
										</p>
										<input type="hidden" title="密碼" name="password" maxlength="20"
											value='<%=memberBean.getPassword()%>' /> <input
											type="hidden" name="userId"
											value="<%=memberBean.getuserId()%>" /> <input type="hidden"
											name="joinDate" value="<%=memberBean.getJoinDate()%>" />



										<p>
											<input type="submit" value="更改資料"
												class="form-control-submit button-submit"
												onclick="if( !(confirm('確認更改?') ) ) return false;alert('更改成功')">
										</p>
										<!-- 									</form> -->
								</div>
							</div>
							<div class="col-lg-4 no-padding">
								<div class="form-contact-information">
									<div class="teamo-contact-info">
										<h2 class="title"></h2>
										<div class="info">

											<div class="item phone">
												<span class="icon"></span><span class="text"><input
													title="cellphone" type="text" name="cellphone" size="40"
													value='<%=memberBean.getCellphone()%>'></span>
											</div>
											<div class="item email">
												<span class="icon"></span><span class="text" id="text"><input
													title="email" type="text" name="email" size="40"
													value='<%=memberBean.getEmail()%>'></span>
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
	</div>
	<script>
		function previewImg(element) {

			let file = element.files[0];
			let img = element.parentElement.querySelector("#img");
			let imgPath = element.parentElement.querySelector("#imgPath");
			if (file) {
				img.src = URL.createObjectURL(file);
				imgPath.value = "images/" + file.name;
			}

		}
	</script>
</body>
<jsp:include page="Footer.jsp" />
</html>
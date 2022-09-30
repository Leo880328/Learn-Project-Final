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
									<c:if test="<%=memberBean.getStatus() == 1%>">
										<button type="submit">
											<a href="becometeacher.controller">申請成為老師</a>
										</button>
									</c:if>
									<form action="updateMyUser" method="post"
										class="teamo-contact-fom us" >
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
												if (memberBean.getSex() == null) {
													memberBean.setSex("");
												}
												%>
												<p>
													<span class="form-label">暱稱</span><span
														class="form-control-wrap "><input title="暱稱"
														id="nick" type="text" name="nick" size="40"
														class="form-control form-control-name"
														value='<%=memberBean.getNick()%>'></span>
												</p>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-6">
												<p>
													<span class="form-label">帳號 </span><span
														class="form-control-wrap "><input title="帳號"
														id="account" type="text" name="account" size="40"
														placeholder="*必填" class="form-control form-control-name"
														value='<%=memberBean.getAccount()%>'></span>
												</p>
											</div>
											<div class="col-sm-6">
												<p>
													<span class="form-label">密碼 </span><span
														class="form-control-wrap "><input type="text"
														title="密碼" name="password" maxlength="30"
														placeholder="*必填" value='<%=memberBean.getPassword()%>' /></span>
												</p>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-6">
												<p>
													<span class="form-label">姓名</span><span
														class="form-control-wrap "><input title="姓名"
														id="name" type="text" name="name" size="40"
														class="form-control form-control-name"
														value='<%=memberBean.getName()%>'></span>
												</p>
											</div>
											<div class="col-sm-6">
												<p>
													<span class="form-label">性別 </span><span
														class="form-control-wrap "><select name="sex"
														id="sex">
															<option><%=memberBean.getSex()%></option>
															<option value="男生">男生</option>
															<option value="女生">女生</option>
													</select></span>
												</p>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-6">
												<span class="form-label">身分</span><span
													class="form-control-wrap "> <c:if
														test="<%=memberBean.getStatus() == 1%>">
														<option class="form-control  value="1">學生</option>
													</c:if> <c:if test="<%=memberBean.getStatus() == 2%>">
														<option class="form-control value="2">老師</option>
													</c:if> <c:if test="<%=memberBean.getStatus() == 3%>">
														<option class="form-control value="3">管理員</option>
													</c:if> <c:if test="<%=memberBean.getStatus() == 4%>">
														<option class="form-control value="4">審核中</option>
													</c:if>
												</span>
											</div>
											<c:if test="<%=memberBean.getStatus() != 1%>">
												<div class="col-sm-6">
													<span class="form-label">學歷 </span><span
														class="form-control-wrap "><input title="學歷"
														id="education" type="hidden" name="education"
														class="form-control "
														value='<%=memberBean.getEducation()%>'><span
														class="form-control "><%=memberBean.getEducation()%></span></span>
												</div>
												<input type="hidden" name="userprofile" id="userprofile"
													value="<c:out value='<%=memberBean.getUserprofile()%>' />"
													class="form-control" placeholder="">
											</c:if>
										</div>
										<div class="row">
											<div class="col-sm-6">
												<p>
													<span class="form-label">生日 </span><span
														class="form-control-wrap "><input title="生日"
														id="birthday" type="date" name="birthday"
														class="form-control "
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
										<input type="hidden" name="userId"
											value="<%=memberBean.getuserId()%>" /> <input type="hidden"
											name="joinDate" value="<%=memberBean.getJoinDate()%>" /> <input
											type="hidden" name="status"
											value="<%=memberBean.getStatus()%>" /> <input title="學歷"
											id="education" type="hidden" name="education" size="40"
											placeholder="*必填(請輸入最高學歷)"
											class="form-control form-control-name">


										<p>
											<button type="button" onclick="checkNull(form)"
												class="form-control-submit button-submit">更改資料</button>
											<button type="button" class="btn btn-primary " id="correct">輸入完整資料</button>
										</p>
								</div>
							</div>
							<div class="col-lg-4 no-padding">
								<div class="form-contact-information">
									<div class="teamo-contact-info">
										<h2 class="title"></h2>
										<div class="info">

											<div class="item phone">
												<span class="icon"></span><span class="text"><input
													title="cellphone" type="text" name="cellphone"
													id="cellphone" size="40"
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
	<script type="text/javascript">
		function checkNull(form) {
			if (form.account.value == "") {
				
				Swal.fire({
                    icon: 'error',
                    title: '帳號必填',
                    text: '請輸入帳號',
                })
				
				return false;
			}
			if (form.password.value == "") {
				Swal.fire({
                    icon: 'error',
                    title: '密碼必填',
                    text: '請輸入密碼',
                })
				return false;
			}
			if (form.email.value == "") {
				Swal.fire({
                    icon: 'error',
                    title: '信箱必填',
                    text: '請輸入信箱',
                })
				return false;
			}
			Swal.fire({
				title: '確定要儲存嗎?',
				text: "",
				icon: 'submit',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '確定',
				cancelButtonText: '取消',
			}).then((result) => {
				if (result.isConfirmed) {
					Swal.fire({
						title: '儲存成功',
						willClose: function () {
							console.log($('.us'));
		                   $('.us').submit();
						}
					})
				}
			})
		}
	</script>
	<script>
		$(function() {

			$('#correct').click(function() {
				$('#nick').val("小華");
				$('#account').val("edward");
				$('#name').val("愛德華");
				$('#sex').val("男生");
				$('#birthday').val("1993-10-02");
				$('#cellphone').val("0912345678");
			})
		})
	</script>
</body>
<jsp:include page="Footer.jsp" />
</html>
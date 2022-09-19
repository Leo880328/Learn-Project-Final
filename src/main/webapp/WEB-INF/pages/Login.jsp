<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登入</title>
<script src="https://kit.fontawesome.com/6cda0c2d7d.js"
	crossorigin="anonymous"></script>
<link rel="shortcut icon" type="image/x-icon"
	href="assets/images/smalllogo.png" />
<link rel="shortcut icon" type="image/x-icon"
	href="assets/images/smalllogo.png" />
<style>
article {
	/* background-color: yellow; */
	border: 2px solid gray;
	padding: 5px 50px 5px 50px;
	margin: 20px 400px 10px 400px;
	line-height: 1.7;
	box-shadow: 5px 5px 5px gray;
}
</style>
</head>
<body>
		<jsp:include page="loginNav.jsp" />
	<article>
		<div class="main" align="center">
			<div class="row">
				<div class="content-area col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="site-main">
						<div class="login-item">
							<div class="sign1">
								<h5 class="title-login">登入</h5>
								<div>
									如果您還沒有註冊，請點擊<a href="register.controller">快速註冊</a>
								</div>
								<form method="post" action="checklogin.controller">
									<div class="social-account">
										<h6 class="title-social">其他登入方式</h6>
										<a href="#" class="mxh-item google"><i
											class="icon fa fa-google-square" aria-hidden="true"></i><span
											class="text">Google</span></a><a href="#"
											class="mxh-item twitter"><i class="icon fa fa-twitter"
											aria-hidden="true"></i><span class="text">TWITTER</span></a>
									</div>
									<br>
									<font face="微軟正黑體">或使用快樂學習帳號密碼登入</font>
									<div class=group>
										<label for="account"><i class="fa-solid fa-user"></i>
										</label> <input type="text" name="account" id="account"
											placeholder="請輸入帳號" autocomplete="off" value=account>
									</div>
									<div class=group>
										<label for="password"><i class="fa-solid fa-lock"></i>
										</label><input type="password" name="password" id="password"
											placeholder="請輸入密碼(大小寫有別)" autocomplete="off" value=password>
									</div>
									<div class=group>
										<p class="lost_password">
											<span class="inline"><input type="checkbox" id="cb1"><label
												for="cb1" class="label-text">Remember me</label></span>
										</p>
										<p>
											<a href="#" class="forgot-pw">忘記密碼?</a>
										</p>
									</div>
									<div class="button">
										<input type="submit" name="signin" id="signin" value="登入">
									</div>
									<br>
									<p>${errors.msg}</p>
								</form>

							</div>
						</div>
						<!-- --------------------------------------------------------------------------------------------------------------- -->
						<!-- 	<div class="row"> -->
						<!-- 		<div class="content-area col-lg-12 col-md-12 col-sm-12 col-xs-12"> -->
						<!-- 			<div class="site-main"> -->
						<!-- 				<h3 class="custom_blog_title"></h3> -->
						<!-- 				<div class="customer_login"> -->
						<!-- 					<div class="row"> -->
						<!-- 						<div class="col-lg-6 col-md-6 col-sm-12"> -->
						<!-- 							<div class="login-item"> -->
						<!-- 								<h5 class="title-login">登入</h5> -->
						<!-- 								<form method="post" action="checklogin.controller"> -->
						<!-- 									<div class="social-account"> -->
						<!-- 										<h6 class="title-social">其他登入方式</h6> -->
						<!-- 										<a href="#" class="mxh-item google"><i -->
						<!-- 											class="icon fa fa-google-square" aria-hidden="true"></i><span -->
						<!-- 											class="text">Google</span></a><a href="#" -->
						<!-- 											class="mxh-item twitter"><i class="icon fa fa-twitter" -->
						<!-- 											aria-hidden="true"></i><span class="text">TWITTER</span></a> -->
						<!-- 									</div> -->
						<!-- 									<div class=group> -->
						<!-- 										<label for="account"><i class="fa-solid fa-user"></i> -->
						<!-- 										</label> <input type="text" name="account" id="account" -->
						<!-- 											placeholder="請輸入帳號" autocomplete="off" value=account> -->
						<!-- 									</div> -->
						<!-- 									<div class=group> -->
						<!-- 										<label for="password"><i class="fa-solid fa-lock"></i> -->
						<!-- 										</label><input type="password" name="password" id="password" -->
						<!-- 											placeholder="請輸入密碼(大小寫有別)" autocomplete="off" value=password> -->
						<!-- 									</div> -->
						<!-- 									<div class=group> -->
						<!-- 										<input type="checkbox" name="remember me" id="remember me"><label>Remember -->
						<!-- 											me</label> -->
						<!-- 									</div> -->
						<!-- 									<div class="button"> -->
						<!-- 										<input type="submit" name="signin" id="signin" value="登入"> -->
						<!-- 									</div> -->
						<!-- 									<br> -->
						<%-- 									<p>${errors.msg}</p> --%>
						<!-- 								</form> -->
						<!-- 							</div> -->
						<!-- 						</div> -->
						<!-- 						<div class="col-lg-6 col-md-6 col-sm-12"> -->
						<!-- 							<div class="login-item"> -->
						<!-- 								<h5 class="title-login">註冊</h5> -->
						<!-- 								<form class="register"> -->
						<!-- 									<p class="form-row form-row-wide"> -->
						<!-- 										<label class="text">Your email</label><input title="email" -->
						<!-- 											type="email" class="input-text"> -->
						<!-- 									</p> -->
						<!-- 									<p class="form-row form-row-wide"> -->
						<!-- 										<label class="text">Username</label><input title="name" -->
						<!-- 											type="text" class="input-text"> -->
						<!-- 									</p> -->
						<!-- 									<p class="form-row form-row-wide"> -->
						<!-- 										<label class="text">Password</label><input title="pass" -->
						<!-- 											type="password" class="input-text"> -->
						<!-- 									</p> -->
						<!-- 									<p class="form-row"> -->
						<!-- 										<span class="inline"><input type="checkbox" id="cb2"><label -->
						<!-- 											for="cb2" class="label-text">I agree to <span>Terms -->
						<!-- 													& Conditions</span></label></span> -->
						<!-- 									</p> -->
						<!-- 									<p class=""> -->
						<!-- 										<input type="submit" class="button-submit" -->
						<!-- 											value="Register Now"> -->
						<!-- 									</p> -->
						<!-- 								</form> -->
						<!-- 							</div> -->
						<!-- 						</div> -->
					</div>
				</div>
			</div>
		</div>
		<!-- 	</div> -->
	</article>
</body>
</html>
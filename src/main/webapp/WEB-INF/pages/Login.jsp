<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>登入</title>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://kit.fontawesome.com/6cda0c2d7d.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.slim.min.js"
	integrity="sha256-w8CvhFs7iHNVUtnSP0YKEg00p9Ih13rlL9zGqvLdePA="
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
								<h2 class="title-login">登入</h2>
								<div>
									如果您還沒有註冊，請點擊
									<button type="button" class="btn btn-secondary ">
										<a href="register.controller">快速註冊</a>
									</button>

								</div>
								<form method="post" action="loginsuccess">
<!-- 																		<div class="social-account"> -->
<!-- 																			<h6 class="title-social">其他登入方式</h6> -->
<!-- 																			<a href="/HappyLearning/oauth2/authorization/google"> Login in with google</a> -->
<!-- 																			<div class="g-signin2" data-onsuccess="onSignIn"></div> -->
<!-- 																		</div>  -->

									<br> <font face="微軟正黑體">使用快樂學習帳號密碼登入</font>
									<div class=group>
										<label for="account"><i class="fa-solid fa-user"></i>
										</label> <input type="text" name="username" id="account"
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
<!-- 											<input type="text" name="email" id="email" -->
<!-- 												placeholder="請輸入email" autocomplete="off"> -->
												 <a href="forgetPassword.controller" class="forgot-pw">忘記密碼?</a>
<!-- 												 <a id="forgot" class="forgot-pw">忘記密碼?</a> -->
										</p>
									</div>
									<div class="">
										<input type="submit" class="btn btn-success" name="signin"
											id="signin" value="登入">
										<button type="button" class="btn btn-primary " id="correct">新會員登入</button>
<!-- 										<button type="button" class="btn btn-primary " id="winnie">老師登入</button> -->
<!-- 										<button type="button" class="btn btn-primary " id="tony">學生登入</button> -->


									</div>
									<br>
									<p>${errors.msg}</p>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</article>
</body>
<script>
	$(function() {
		$('#correct').click(function() {
			$('#account').val("edward");
			$('#password').val("edward");
		})
	})
</script>
<script>
	$(function() {
		$('#winnie').click(function() {
			$('#account').val("winnie");
			$('#password').val("winnie");
		})
		$('#tony').click(function() {
			$('#account').val("tony");
			$('#password').val("tony");
		})
	})
</script>

</html>
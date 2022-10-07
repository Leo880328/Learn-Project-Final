<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id"
	content="489628837861-ttr8bjl9ptu0br8oqnip94gg7fvgqp0f.apps.googleusercontent.com">
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
								<h2 class="title-login">忘記密碼</h2>
								<div>
									如果您還沒有註冊，請點擊
									<button type="button" class="btn btn-secondary">
										<a href="register.controller">快速註冊</a>
									</button>
								</div>
								<br>

								<div class=group>
									<p>
										<input type="text" name="email" id="email"
											placeholder="*請輸入email" autocomplete="off">
											<span
										id="msgEmail" style="color: red"> </span>
										<button type="button" id="forgot" class="forgot-pw">忘記密碼?</button>
									</p>

								</div>
								<div class="">
									如果已有帳號請按
									<button type="button" class="btn btn-info btn--raised">
										<a href="login.controller">登入</a>
									</button>
									回到登入畫面
								</div>
								<br>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</article>
</body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
	<!------------------------判斷是否帳號信箱存在--------------------->
	<script type="text/javascript">
		$('#forgot').on("click", function() {
			let email = $('#email').val();
			console.log(email)
			$('#msgEmail').text("");
			let member = {
				email : email,
			}
			fetch("forgotpassword",{
				method:'POST',
				headers:{
					'Content-Type':'application/json'
				},
				body:JSON.stringify(member) 
			}).then(resp=>resp.json())
			.then(res=>{
				console.log(res)
				if('1111'==res.email){
					
					$('#msgEmail').text('信箱已註冊');
				}
				if(res=='2222')
				  Swal.fire({
                      icon: 'success',
                      title: '請至信箱確認驗證信',
                      text: '註冊成功，即將前往登入畫面',
                  })
//                   .then(function(){
//                 	  location.href='login.controller';
//                   })
			})
		})
	</script>
</html>
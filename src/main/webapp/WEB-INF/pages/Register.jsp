<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員註冊</title>
<link rel="stylesheet" href="css/style.css">
<script src="https://kit.fontawesome.com/6cda0c2d7d.js"
	crossorigin="anonymous"></script>


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


	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<article>
		<div class="main" align="center">
			<div class="row">
				<div class="content-area col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="site-main">
						<div class="login-item">
							<div class="">
								<h2 class="title">註冊</h2>
								<!-- 								<form action="newRegister" method="post" -->
								<!-- 									modelAttribute="register" class="register-form" -->
								<!-- 									id="Register-form" onSubmit="return isValid(this);"> -->
								<input type="hidden" name="command" value="login">
								<div class=group>
								
									<i class="fa-solid fa-user"></i> <input
										type="text" name="account" id="account" placeholder="請輸入帳號"
										autocomplete="off" value="id" required><div>
										 <span
										style='color: red' ; id='msgAccount'></span></div>
								</div>

								<div class=group>
									<label for="password"><i class="fa-solid fa-lock"></i>
									</label><input type="password" name="password" id="password"
										placeholder="請輸入密碼(大小寫有別)" autocomplete="off" value="pwd">
									<span id="" style="color: red"> </span>
								</div>
								<div class=group>
									<label for="password"><i class="fa-solid fa-lock"></i>
									</label><input type="password" name="password1" id="password1"
										placeholder="重複輸入密碼" autocomplete="off" value="pwd"> <span
										id="message2" style="color: red"> </span>
								</div>
								<div>
									<label for="email"><i class="fa-solid fa-envelope"></i></label><input
										type="email" name="email" id="email" placeholder="請輸入電子信箱"
										autocomplete="off" value="email@gmail.com"><div><span
										id="msgEmail" style="color: red"> </span></div>
								</div>
								<p>
									<span>${errors.RegisterError}</span> <span>${errors.RegisterErrorAccount}</span>
								</p>
								<button type="button" name="submit" id="checkRegister"
									onclick="">註冊</button>
								<button type="button" class="btn btn-primary " id="correct">一鍵輸入</button>
								<!-- 								</form> -->
								<div>
									已有帳號
									<button type="button" class="btn btn-info btn--raised">
										<a href="login.controller">登入</a>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</article>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
	<!------------------------一鍵輸入---------------------- -->
	<script>
		$(function() {
			$('#correct').click(function() {
				$('#account').val("edward");
				$('#password').val("edward");
				$('#password1').val("edward");
				$('#email').val("wuyuhsi0422@gmail.com");
			})
		})
	</script>
	<!------------------------判斷是否帳號信箱存在--------------------->
	<script type="text/javascript">
		$('#checkRegister').on("click", function() {
			let account = $('#account').val();
			let password = $('#password').val();
			let email = $('#email').val();
			$('#msgAccount').text("");
			$('#msgEmail').text("");
			let member = {
				account : account,
				password : password,
				email : email,
			}
			console.log(member)
			fetch("newRegister",{
				method:'POST',
				headers:{
					'Content-Type':'application/json'
				},
				body:JSON.stringify(member) 
			}).then(resp=>resp.json())
			.then(res=>{
				console.log(res)
				if('1112'==res.account){
					
					$('#msgAccount').text('帳號已註冊');
				}
				if('1111'==res.email){
					
					$('#msgEmail').text('信箱已註冊');
				}
				if(res=='2222')
				  Swal.fire({
                      icon: 'success',
                      title: '註冊成功',
                      text: '註冊成功，即將前往登入畫面',
                  }).then(function(){
                	  location.href='login.controller';
                  })
			})
		})
	</script>
</body>
</html>
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
							<div class="sign1">
								<h2 class="title">註冊</h2>
								<form action="newRegister" method="post"
									modelAttribute="register" class="register-form"
									id="Register-form" onSubmit="return isValid(this);">
									<input type="hidden" name="command" value="login">
									<div class=group>
										<label for=""><i class="fa-solid fa-user"></i>
										</label> <input type="text" name="account" id="account"
											placeholder="請輸入帳號" autocomplete="off" value="id" required>
									</div>
									<div class=group>
										<label for="password"><i class="fa-solid fa-lock"></i>
										</label><input type="password" name="password" id="password"
											placeholder="請輸入密碼(大小寫有別)" autocomplete="off" value="pwd">
										<span id="message1" style="color: red"> </span>
									</div>
									<div class=group>
										<label for="password"><i class="fa-solid fa-lock"></i>
										</label><input type="password" name="password1" id="password1"
											placeholder="重複輸入密碼" autocomplete="off" value="pwd">
										<span id="message2" style="color: red"> </span>
									</div>
									<div>
										<label for="email"><i class="fa-solid fa-envelope"></i></label><input
											type="email" name="email" id="email" placeholder="請輸入電子信箱"
											autocomplete="off" value="email@gmail.com">
									</div>
									<p>
										<span>${errors.RegisterError}</span> <span>${errors.RegisterErrorAccount}</span>
									</p>
									<button type="button" name="signin" id="signin" value="註冊"
										onclick="register()">註冊</button>
									<button type="button" class="btn btn-primary " id="correct">一鍵輸入</button>
								</form>
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
	<script language="javascript">
		function isValid(form) {
			if (form.account.value == "") {
				alert("使用者名稱不能為空");
				return false;
			}
			if (form.password.value == "") {
				alert("密碼不能為空！");
				return false;
			} else if (form.password1.value == "") {
				alert("密碼不能為空！");
				return false;
			} else if (form.email.value == "") {
				alert("電子信箱不能為空！");
				return false;
			}
			return true;
		}
	</script>
	<script>
		$(function() {
			$('#correct').click(function() {
				$('#account').val("edward");
				$('#password').val("test123");
				$('#password1').val("test123");
				$('#email').val("ch570981400@gmail.com");
			})
		})
	</script>
	<script type="text/javascript">
		
        //檢查信箱 非空/不能有中文/序列4以上含有'@' 觸發：onblur onsubmit
        $('#email').on('blur', function(){
         checkAccount()
        })
        function checkAccount(){
          let account = $('#email').val()
                  if(typeof account === "string"){
                      if (account ==null || account ==""){
                  var msg = "信箱必須填寫";  
                  $('#sp4').text(msg);  
                  return false
              }else{
              if (account.indexOf("@") > 4){ 
                   var eng =new RegExp("[a-zA-z]"); //要改成有中文不行
                   if(eng.test(account)){
                      var msg="OK";
                      $('#sp4').text(msg);  
                  return true
                  }else{
                  var msg ="請輸入英文字母";
                  $('#sp4').text(msg);  
                  return false
              }
              }else{
                  var msg ="請輸入有效信箱";
                  $('#sp4').text(msg);  
                  return false
              }
          }
      }else{
          var msg ="請輸入有效信箱";
          $('#sp4').text(msg);  
                  return false
      } 
      }
		
		
		
		        //檢查密碼 判斷 非空/不能有中文/須為8-16個字 觸發:onblur onsubmit
        $('#password').on('blur',
        function(){
            checkPassword()
        }
        )
        function checkPassword(){
            let password = $('#password').val()
                    if(typeof password === "string"){
                        if (password ==null || password ==""){
                    var msg = "密碼必須填寫";  
                    $('#sp5').text(msg);  
                    return false
                }else{
                     var eng =new RegExp("[a-zA-z]"); //要改成有中文不行
                     if(eng.test(password)){
                         if(password.length <=7 || password.length >=17){
                             var msg="密碼須為6至16字含英文數字";  
                             $('#sp5').text(msg);  
                    return false                    
                            }else{
                                var msg="OK ";
                                $('#sp5').text(msg);  
                    return true
                            }
                    }else{
                    var msg ="密碼須為6至16字含英文數字";
                    $('#sp5').text(msg);  
                    return false
                }
        
            }
        } else{
            var msg="密碼須為6至16字含英文數字";  
            $('#sp5').text(msg);  
                    return false   
        }
        }
        </script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>

	<script type="text/javascript">
	function register() {

		Swal.fire({
			title: '確定要儲存嗎?"',
			text: "",
			icon: 'warning',
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
						console.log($('.'));
	                   $('.anu').submit();
					}
				})
			}
		})
	}
        </script>
</body>
</html>
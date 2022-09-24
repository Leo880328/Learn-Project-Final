<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="fourth.bean.MemberBean"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:if test="${mb != null}">
                        修改會員
                    </c:if> <c:if test="${mb == null}">
                        新增會員
                    </c:if></title>
<link rel="shortcut icon" type="image/x-icon"
	href="assets/images/smalllogo.png" />
<style>
.tb {
	margin-left: 300px;
}
</style>
</head>
<body data-ma-theme="green">
	<jsp:include page="BackendHeader.jsp" />
	<jsp:include page="Style.jsp" />
	<%
	String action = "";
	%>
	<c:if test="${mb != null}">
		<%
		action = "updateUser";
		%>
	</c:if>
	<c:if test="${mb == null}">
		<%
		action = "insertNewUser";
		%>
	</c:if>

	<main class="main">

		<section class="content">
			<div class="content__inner content__inner--sm">
				<header class="content__title">
					<h1>
						<h2>
							<c:if test="${mb != null}">
                                    修改會員
                                </c:if>
							<c:if test="${mb == null}">
                                    新增會員
                                </c:if>
						</h2>
					</h1>
					<small></small>
					<div class="actions">
						<a href="" class="actions__item zmdi zmdi-trending-up"></a><a
							href="" class="actions__item zmdi zmdi-check-all"></a>
						<div class="dropdown actions__item">
							<i data-toggle="dropdown" class="zmdi zmdi-more-vert"></i>
							<div class="dropdown-menu dropdown-menu-right">
								<a href="" class="dropdown-item">Refresh</a><a href=""
									class="dropdown-item">Manage Widgets</a><a href=""
									class="dropdown-item">Settings</a>
							</div>
						</div>
					</div>
				</header>


				<form action="<%=action%>" method="post"
					onSubmit="return checkNull(this)">
					<c:if test="${mb != null}">
						<input type="hidden" name="userId" value="${mb.userId}" />
					</c:if>

					<div class="card new-contact">
						<div class="new-contact__header" >
						<input onchange="previewImg(this)" class="zmdi zmdi-camera  "
							type="file" id="imgin">
							<a href="" ></a><img
								src="${mb.img}" id="img" alt="" title="" width="200"
								height="150" class="new-contact__img"> <input id="imgPath"
								type="hidden" name="img" title="大頭貼" value="${mb.img}">
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>暱稱 </label><input type="text"
											value="<c:out value='${mb.nick}' />" name="nick"
											placeholder="請輸入最多10個字" maxlength="10" id="nick"
											class="form-control"><i class="form-group__bar"></i>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>姓名 </label><input type="text" name="name"
											value="<c:out value='${mb.name}' />" id="name"
											class="form-control" placeholder="請輸入全名"><i
											class="form-group__bar"></i>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>帳號</label><input type="text" name="account"
											value="<c:out value='${mb.account}' />" title="帳號"
											id="account" class="form-control" placeholder="*必填"><i
											class="form-group__bar"></i>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>密碼</label><input type="text" title="密碼" name="password"
											id="password" value="<c:out value='${mb.password}' />"
											class="form-control" placeholder="*必填"><font color="red"><span
											id="sp5" class="msg" ></span></font><i class="form-group__bar"></i>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Email </label><input type="text" title="電子郵件"
											value="<c:out value='${mb.email}' />" id="email" name="email"
											class="form-control" placeholder="*必填"><font color="red"><span
											id="sp4" class="msg"></span></font><i class="form-group__bar"></i>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>性別</label><select name="sex" id="sex"
											class="form-control">
											<option>${mb.sex}</option>
											<option value="男生"
												<c:if test="${mb.sex=='男生'}">
                                                    </c:if>>男生</option>
											<option value="女生"
												<c:if test="${mb.sex=='女生'}">
                                                    </c:if>>女生</option>
										</select><i class="form-group__bar"></i>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>聯絡電話 </label><input type="text" name="cellphone"
											size="20" id="cellphone"
											value="<c:out value='${mb.cellphone}' />"
											class="form-control" placeholder=""><i
											class="form-group__bar"></i>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>生日 </label><input type="date" name="birthday"
											id="birthday" value="<c:out value='${mb.birthday}' />"
											class="form-control" placeholder=""><i
											class="form-group__bar"></i>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>身分 </label><select class="form-control" name="status"
											title="身分" id="status">
											<c:if test="${mb.status==null}">
												<option>請選擇</option>
												<option value="1">學生</option>
												<option value="2">老師</option>
												<option value="3">管理員</option>
											</c:if>
											<c:if test="${mb.status=='1'}">
												<option value="1">學生</option>
												<option value="2">老師</option>
												<option value="3">管理員</option>
											</c:if>
											<c:if test="${mb.status=='2'}">
												<option value="2">老師</option>
												<option value="1">學生</option>
												<option value="3">管理員</option>
											</c:if>
											<c:if test="${mb.status=='3'}">
												<option value="3">管理員</option>
												<option value="1">學生</option>
												<option value="2">老師</option>
											</c:if>
										</select><i class="form-group__bar"></i>
									</div>
								</div>
<!-- 								<div class="col-md-6"> -->
<!-- 									<div class="form-group"> -->
<!-- 										<label>申請成為老師 </label><input type="button" value="申請表單" -->
<!-- 											class="form-control" placeholder="i.e. John"><i -->
<!-- 											class="form-group__bar"></i> -->
<!-- 									</div> -->
<!-- 								</div> -->
							</div>
							<div class="form-group">
								<label>加入時間</label><input type="date" name="joinDate"
									id="joinDate" value="<c:out value='${mb.joinDate}' />"
									class="form-control" placeholder=""><i
									class="form-group__bar"></i>
							</div>
							<div class="form-group">
								<label>自我介紹</label>
								<textarea class="form-control textarea-autosize"></textarea>
								<i class="form-group__bar"></i>
							</div>
							<div class="clearfix"></div>
							<div class="mt-5 text-center">
								<a href="" class="btn btn-primary">清空</a>
								<button type="button" class="btn btn-primary " id="correct">一鍵輸入</button>
						<a href="memberList"><input type="submit" name="return"
							value="儲存"></a>
							<a href="memberList"><input type="button" name="return" class="btn btn-outline-success"
			value="返回會員列表"></a>
							</div>
				</form>
				<br>
				<div>
				</div>
			</div>

		</section>
	</main>
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
	<script>
		$(function() {
			
			$('#correct').click(function() {
				$('#nick').val("smalllucy");
				$('#account').val("lucy");
				$('#password').val("lucy");
				$('#status').val("1");
				$('#name').val("Lucu Wang");
				$('#sex').val("女生");
				$('#birthday').val("1999-03-02");
				$('#cellphone').val("0922404678");
				$('#email').val("lucy@gmail.com");
				$('#joinDate').val("2022-09-27");
			})
		})
	</script>


	<script type="text/javascript">
		function checkNull(form) {
			if (form.account.value == "") {
				alert("【 " + form.account.title + " 】" + "不能為空!!!");
				return false;
			}
			if (form.password.value == "") {
				alert("【 " + form.password.title + " 】" + "不能為空!!!");
				return false;
			}
			if (form.email.value == "") {
				alert("【 " + form.email.title + " 】" + "不能為空!!!");
				return false;
			}

		}
	</script>
	<script type="text/javascript">
		
        //檢查信箱 非空/不能有中文/序列4以上含有'@' 觸發：onblur onsubmit
        $('#email').on('blur', function(){
         checkAccount()
        })
        function checkAccount(){
          let account = $('#account').val()
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
</body>
</html>
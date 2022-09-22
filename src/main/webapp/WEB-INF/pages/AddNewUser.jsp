<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="fourth.bean.MemberBean"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增使用者</title>
<link rel="shortcut icon" type="image/x-icon"
	href="assets/images/smalllogo.png" />
<style>
.tb {
	margin-left: 300px;
}
</style>
</head>
<body>
	<jsp:include page="BackendHeader.jsp" />
	<jsp:include page="Style.jsp" />
	<br>
	<br>
	<br>
	<%-- 	<c:if test="${sessionScope.user == null}"><% request.getRequestDispatcher("/Login.jsp").forward(request, response); %></c:if> --%>
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
	<header>
		<br> <br>
		<div align="center">
			<h2>
				<c:if test="${mb != null}">
                        修改會員
                    </c:if>
				<c:if test="${mb == null}">
                        新增會員
                    </c:if>
			</h2>
		</div>
	</header>
	<hr>
	<form action="<%=action%>" method="post"
		onSubmit="return checkNull(this)">
		<table class="tb" cellspacing="2" cellpadding="1" border="50"
			width="60%">

			<c:if test="${mb != null}">
				<input type="hidden" name="userId" value="${mb.userId}" />
			</c:if>
			<tr>
				<td>暱稱:</td>
				<td><input type="text" title="暱稱" name="nick" size="10"
					id="nick" maxlength="10" value="<c:out value='${mb.nick}' />" />(請輸入0~10個字)</td>
			</tr>
			<tr>
				<td>帳號:</td>
				<td><input type="text" title="帳號" name="account" maxlength="10"
					id="account" value="<c:out value='${mb.account}' />" /></td>
			</tr>
			<tr>
				<td>密碼:</td>
				<td><input type="text" title="密碼" name="password" id="password"
					maxlength="20" value="<c:out value='${mb.password}' />" /><span
					id="sp5" class="msg"></span></td>
			</tr>
			<tr>
				<td>身分:</td>
				<td><select name="status" title="身分" id="status">
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
				</select></td>
			</tr>
			<tr>
				<td>姓名:</td>
				<td><input type="text" title="姓名" name="name" maxlength="10"
					id="name" value="<c:out value='${mb.name}' />" /></td>
			</tr>
			<tr>
				<td>大頭貼:</td>
				<td><img src="${mb.img}" id="img" alt="" title="" width="200"
					height="150"> <input id="imgPath" type="hidden" name="img"
					title="大頭貼" value="${mb.img}"> <input
					onchange="previewImg(this)" type="file" title="大頭貼" id="imgin"></td>
			</tr>
			<tr>
				<td>性別:</td>
				<td><select name="sex" id="sex">
						<option>${mb.sex}</option>
						<option value="男生" <c:if test="${mb.sex=='男生'}"></c:if>>男生</option>
						<option value="女生" <c:if test="${mb.sex=='女生'}"></c:if>>女生</option>
				</select></td>
			</tr>
			<tr>
				<td>生日:</td>
				<td><input type="date" title="生日" name="birthday" id="birthday"
					value="<c:out value='${mb.birthday}' />" /></td>
			</tr>
			<tr>
				<td>聯絡電話:</td>
				<td><input type="text" title="聯絡電話" name="cellphone" size="20"
					id="cellphone" value="<c:out value='${mb.cellphone}' />" /></td>
			</tr>
			<tr>
				<td>電子郵件:</td>
				<td><input type="text" title="電子郵件" name="email" size="40"
					id="email" maxlength="50" value="<c:out value='${mb.email}' />" /><span
					id="sp4" class="msg"></span></td>
			</tr>
			<tr>
				<td>加入時間:</td>
				<td><input type="date" title="加入時間" name="joinDate" size="50"
					id="joinDate" maxlength="20"
					value="<c:out value='${mb.joinDate}' />" /></td>
			</tr>

		</table>
		<div align="center">
			<button type="button" class="btn btn-primary " id="correct">一鍵輸入</button>
		</div>
		<br>
		<div align="center">
			<input type="submit" value="儲存" />
		</div>
	</form>
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
				$('#status').val("2");
				$('#name').val("Lucu Wang");
				$('#imgin').val("images/user000.png");
				$('#sex').val("女生");
				$('#birthday').val("1999-03-02");
				$('#cellphone').val("0922404678");
				$('#email').val("lucy@gmail.com");
				$('#joinDate').val("2022-09-21");
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
                             var msg="密碼須為8至16字含英文數字";  
                             $('#sp5').text(msg);  
                    return false                    
                            }else{
                                var msg="OK ";
                                $('#sp5').text(msg);  
                    return true
                            }
                    }else{
                    var msg ="密碼須為8至16字含英文數字";
                    $('#sp5').text(msg);  
                    return false
                }
        
            }
        } else{
            var msg="密碼須為8至16字含英文數字";  
            $('#sp5').text(msg);  
                    return false   
        }
        }
        </script>
</body>
</html>
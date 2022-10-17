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
			<!-- 			<form action="becometeacher" method="post"> -->
			<div class="row">
				<div
					class="content-area content-details full-width col-lg-9 col-md-8 col-sm-12 col-xs-12">
					<div class="site-main">
						<div class="details-product">
							<div class="">
								<h1 class="">申請成為老師</h1>
								<div class="price">
									<span class="form-label">信箱（此為你的驗證信箱，如需變更請至 個人資料）: </span><span
										class="form-control form-control-name"><%=memberBean.getEmail()%></span>
								</div>
								<div class="availability">
									<p>
										<span class="form-label">姓名(全名) *</span><span
											class="form-control-wrap your-name"><input
											placeholder="*必填" title="姓名" type="text" name="name"
											id="name" size="40" class="form-control form-control-name"></span>
											<span id="msgName" style="color: red"> </span>
									</p>
									<p>
										<span class="form-label">電話 *</span><span
											class="form-control-wrap your-phone"><input
											id="cellphone" title="電話" type="text" name="cellphone"
											placeholder="*必填" class="form-control form-control-phone"></span>
											<span id="msgCellphone" style="color: red"> </span>
									</p>
									<p>
										<span class="form-label">學歷 *</span><span
											class="form-control-wrap your-name"><input title="學歷"
											id="education" type="text" name="education" size="40"
											placeholder="*必填(請輸入最高學歷)"
											class="form-control form-control-name"></span>
											<span id="msgEducation" style="color: red"> </span>
									</p>
									<p>
										<span class="form-label">自我介紹 * </span><span
											class="wpcf7-form-control-wrap your-message"><textarea
												id="userprofile" title="自我介紹" name="userprofile" cols="40"
												rows="9" placeholder="*必填"
												class="form-control your-textarea"></textarea></span>
									</p>
								</div>

								<input type="hidden" name="userId" id="userId"
									value="<%=memberBean.getuserId()%>" /> <input id="imgPath"
									type="hidden" name="img" title="大頭貼"
									value="<%=memberBean.getImg()%>"> <input type="hidden"
									value="<%=memberBean.getNick()%>" name="nick"
									placeholder="請輸入最多10個字" maxlength="10" id="nick"
									class="form-control"> <input type="hidden"
									name="account" value="<%=memberBean.getAccount()%>" title="帳號"
									id="account" class="form-control" placeholder="*必填"> <input
									type="hidden" name="birthday" id="birthday"
									value="<%=memberBean.getBirthday()%>" class="form-control"
									placeholder=""> <input type="hidden" title="電子郵件"
									value="<%=memberBean.getEmail()%>" id="email" name="email"
									class="form-control"> <input type="hidden" title="密碼"
									id="password" name="password" maxlength="20" placeholder="*必填"
									value='<%=memberBean.getPassword()%>' /> <input type="hidden"
									name="joinDate" id="joinDate"
									value="<%=memberBean.getJoinDate()%>" /> <input type="hidden"
									name="sex" id="sex" value="<%=memberBean.getSex()%>" /> <input
									type="hidden" name="status" id="status" value="<%=memberBean.getStatus()%>" />
									<input type="hidden" name="reason" id="reason" value="<%=memberBean.getReason()%>"  />
									
							</div>

							<div class="product-details-description"></div>

							<div class="quantity-add-to-cart">
								<button class="single_add_to_cart_button button" type="button"
									id="checkTeacher" onclick="">申請成為老師</button>
								<button type="button" class="btn btn-primary " id="correct">輸入完整資料</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- 		</form> -->
	</div>
	</div>

</body>

<script type="text/javascript">
		$('#checkTeacher').on("click", function() {
			
			let userId = $('#userId').val();
			let nick = $('#nick').val();
			let account = $('#account').val();
			let password = $('#password').val();
			let status = $('#status').val();
			let name = $('#name').val();
			let img = $('#imgPath').val();
			let sex = $('#sex').val();
			let birthday = $('#birthday').val();
			let cellphone = $('#cellphone').val();
			let email = $('#email').val();
			let joinDate = $('#joinDate').val();
			let education = $('#education').val();
			let userprofile = $('#userprofile').val();
			let reason = $('#reason').val();
			console.log(userId)
			console.log(nick)
			console.log(account)
			console.log(password)
			console.log(status)
			console.log(name)
			console.log(img)
			console.log(sex)
			console.log(birthday)
			console.log(cellphone)
			console.log(email)
			console.log(joinDate)
			console.log(education)
			console.log(userprofile)
			console.log(reason)
			$('#msgName').text("");
			$('#msgCellphone').text("");
			$('#msgEducation').text("");
			let member = {
					userId : userId,
					nick : nick,
					account : account,
					password : password,
					status : status,
					name : name,
					img : img,
					sex : sex,
					birthday : birthday,
					cellphone : cellphone,
					email : email,
					joinDate : joinDate,
					education : education,
					userprofile : userprofile,
					reason : reason,
			}
			fetch("becometeacher",{
				method:'POST',
				headers:{
					'Content-Type':'application/json'
				},
				body:JSON.stringify(member) 
			}).then(resp=>resp.json())
			.then(res=>{
				console.log(res)
				if('1111'==res.name){
					
					$('#msgName').text('請填入姓名');
					 
				}
				if('1112'==res.cellphone){
					
					$('#msgCellphone').text('請填入電話');
					 
				}
				if('1113'==res.education){
					
					$('#msgEducation').text('請填入學歷');
					 
				}
// 				if('1114'==res.userProfile){
					
// 					$('#msgUserProfile').text('請簡單描述一下自己');
// 				}
				if(res=='3000')
				  Swal.fire({
                      icon: 'success',
                      title: '申請成功',
                      text: '請等待管理員審核',
                  }).then(function(){
                	  location.href='user.controller';
                  })
			})
		})
	</script>
<!---------------------一鍵輸入--------------------------->
<script>
	$(function() {

		$('#correct').click(function() {
			$('#name').val("愛德華");
			$('#cellphone').val("0912345678");
			$('#education').val("資策會EEIT49");
			$('#userprofile').val("我和藹可親，性格開朗，樂於交友，酷愛音樂，愛好體育鍛煉，追求積極健康的高雅生活情趣。並且能與時俱進，不斷提高自己的文化素養，加強道德 修養，內強素質，外樹形象，用自己的人格魅力教育我的學生，搞好我的教學工作 。");
		})
	})
</script>
<!-------------------------F------------------------------>
<jsp:include page="Footer.jsp" />
</html>
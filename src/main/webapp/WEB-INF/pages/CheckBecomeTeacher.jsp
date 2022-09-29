<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="fourth.bean.MemberBean"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>審核會員</title>
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

	<main class="main">
		<section class="content">
			<div class="content__inner content__inner--sm">
				<header class="content__title">
					<h2>審核會員</h2>
					<small>(確認是否資料完整)</small>
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


				<form action="updateUser" method="post"
					onSubmit="return checkNull(this)">
					<c:if test="${mb != null}">
						<input type="hidden" name="userId" value="${mb.userId}" />
					</c:if>

					<div class="card new-contact">
						<div class="new-contact__header">
							<input onchange="previewImg(this)" class="zmdi zmdi-camera  "
								type="hidden" id="imgin"> <a href=""></a><img
								src="${mb.img}" id="img" alt="" title="" width="200"
								height="150" class="new-contact__img"> <input id="imgPath"
								type="hidden" name="img" title="大頭貼" value="${mb.img}">
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>暱稱 </label><input type="hidden"
											value="<c:out value='${mb.nick}' />" name="nick"
											placeholder="請輸入最多10個字" maxlength="10" id="nick"
											class="form-control"><span class="form-control ">${mb.nick}</span><i
											class="form-group__bar"></i>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>姓名 </label><input type="hidden" name="name"
											value="<c:out value='${mb.name}' />" id="name"
											class="form-control" placeholder="請輸入全名"><span
											class="form-control ">${mb.name}</span><i
											class="form-group__bar"></i>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>帳號</label><input type="hidden" name="account"
											value="<c:out value='${mb.account}' />" title="帳號"
											id="account" class="form-control" placeholder="*必填"><span
											class="form-control ">${mb.account}</span><i
											class="form-group__bar"></i>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Email </label><input type="hidden" title="電子郵件"
											value="<c:out value='${mb.email}' />" id="email" name="email"
											class="form-control" placeholder="*必填"><span
											class="form-control ">${mb.email}</span><i
											class="form-group__bar"></i>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>性別</label><span class="form-control ">${mb.sex}</span>
										<input type="hidden" name="sex" value="${mb.sex}" /> <i
											class="form-group__bar"></i>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>聯絡電話 </label><input type="hidden" name="cellphone"
											size="20" id="cellphone"
											value="<c:out value='${mb.cellphone}' />"
											class="form-control" placeholder=""><span
											class="form-control ">${mb.cellphone}</span><i
											class="form-group__bar"></i>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>生日 </label><input type="hidden" name="birthday"
											id="birthday" value="<c:out value='${mb.birthday}' />"
											class="form-control" placeholder=""><span
											class="form-control ">${mb.birthday}</span><i
											class="form-group__bar"></i>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>審核 </label><select class="form-control" name="status"
											title="身分" id="status">
											<c:if test="${mb.status==4}">
												<option>未審核</option>
												<option value="1">駁回</option>
												<option value="2">審核通過</option>
											</c:if>
										</select><i class="form-group__bar"></i>
									</div>
								</div>
								<c:if test="${mb.status !='1'}">
									<div class="col-md-6">
										<div class="form-group">
											<label>學歷 </label><input type="hidden" name="education"
												size="50" id="education"
												value="<c:out value='${mb.education}' />"
												class="form-control" placeholder=""><span
												class="form-control ">${mb.education}</span><i
												class="form-group__bar"></i>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>駁回原因</label><input
										type="text"	class="form-control"  name="reason"  />
										</div>
									</div>
								</c:if>
							</div>
							<div class="form-group">
								<label>加入時間</label><input type="hidden" name="joinDate"
									id="joinDate" value="<c:out value='${mb.joinDate}' />"
									class="form-control" placeholder=""><span
									class="form-control ">${mb.joinDate}</span><i
									class="form-group__bar"></i>
							</div>
							<div class="form-group">
								<label>自我介紹</label> <input type="hidden" name="userprofile"
									id="userprofile" value="<c:out value='${mb.userprofile}' />"
									class="form-control" placeholder=""><span
									class="form-control ">${mb.userprofile}</span> <i
									class="form-group__bar"></i> <input type="hidden" title="密碼"
									name="password" maxlength="20" placeholder="*必填"
									value='${mb.password}' />
							</div>
							<div class="clearfix"></div>
							<div class="mt-5 text-center">
								<a href="memberList"><input type="submit" name="return"
									value="儲存"></a> <a href="memberList"><input
									type="button" name="return" class="btn btn-outline-success"
									value="返回會員列表"></a>
							</div>
				</form>
				<br>
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
</body>
</html>
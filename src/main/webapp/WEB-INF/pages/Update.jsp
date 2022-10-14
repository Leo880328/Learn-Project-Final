<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page import="java.util.*,fourth.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon"
	href="images/smalllogo.png" />
<style>
.tb {
	border-collapse: collapse;
	width: 850px;
	word-wrap: break-word;
	table-layout: fixed;
	background-color: white;
	border-radius: 20px;
}
.th{
   width: 200px;
   background-color: #65a15a;
   color:white;
   border:solid 0.5px white;
   text-align: center;
   font-weight: bold;
}
</style>
<title>課程資料修改</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
</head>

<body>
	<c:if test="${sessionScope.user.status == 3}">
		<jsp:include page="BackendHeader.jsp" />
		<jsp:include page="Style.jsp" />
	</c:if>
	<c:if test="${sessionScope.user.status == 2}">
		<jsp:include page="Header.jsp" />
	</c:if>
	<br>
	<br>
	<br>
	<center>
		<h1>課程資料修改</h1>
	</center>
	<c:if test="${sessionScope.user.status == 3}">
	<form action="course.update" class="cfu" method="post">
	</c:if>
	<c:if test="${sessionScope.user.status == 2}">
	<form action="coursefront.update" class="cfu" method="post">
	</c:if>
		<c:choose>
			<c:when test="${bean.course_status == 1}">
				<table class=tb align='center'>

					
					<input type="hidden" name="courseId" value="${bean.courseId}">
					<input type="hidden" name="user_id" value="${bean.user_id}">

					<tr>
						<td class="th" style="border-radius:20px 0 0 0">課程名稱:</td>
						<td><input type="hidden" name="course_name" size="30"
							maxlength="30" value="${bean.course_name}">${bean.course_name}</td>
					</tr>
					<tr>
						<td class="th">科目名稱:</td>
						<td><input type="hidden" name="subject_id" id="subject_id"
							value="${bean.coursesub.subject_id}"> <c:if
								test="${bean.coursesub.subject_id == '1'}">數學</c:if> <c:if
								test="${bean.coursesub.subject_id == '2'}">英文</c:if> <c:if
								test="${bean.coursesub.subject_id == '3'}">多益</c:if></td>
					</tr>
					<tr>
						<td class="th">開課班別代碼:</td>
						<td><input type="hidden" name="education_id"
							id="education_id" value="${bean.courseedu.education_id}">
							<c:if test="${bean.courseedu.education_id == '1'}">國中</c:if> <c:if
								test="${bean.courseedu.education_id == '2'}">高中</c:if> <c:if
								test="${bean.courseedu.education_id == '3'}">成人</c:if></td>
					</tr>
					<tr>
						<td class="th">課程簡介:</td>
						<td><input type="hidden" cols="20" rows="4"
							name="course_introduction" title="課程簡介"
							value="${bean.course_introduction}">${bean.course_introduction}</td>
					</tr>
					<tr>
						<td class="th">課程價格:</td>
						<td><input type="hidden" name="course_price" size="5"
							title="課程價格" value="${bean.course_price}">${bean.course_price}</td>
					</tr>
					<tr>
						<td class="th">課程時數:</td>
						<td><input type="hidden" name="course_duration" size="15"
							title="課程時數" value="${bean.course_duration}">${bean.course_duration}</td>
					</tr>



					<tr>
						<td class="th">課程上架日期:</td>
						<td><input type="hidden" name="course_date" title="開課日期"
							value="${bean.course_date}">${bean.course_date}</td>
						<input type="hidden" name="enrollment" size="3" title="報名人數"
							value="${bean.enrollment}">
					</tr>
					<tr>
						<td class="th">講師姓名:</td>
						<td><input type="hidden" name="lecturer_name" size="5"
							title="講師姓名" value="${bean.lecturer_name}">${bean.lecturer_name}</td>
					</tr>
					<tr>
						<td class="th">講師信箱:</td>
						<td><input type="hidden" name="lecturer_email" size="30"
							title="講師信箱" value="${bean.lecturer_email}">${bean.lecturer_email}</td>
					</tr>
					<tr>
						<td class="th">課程封面圖片:</td>
						<td><img src="${bean.course_picture}" id="img" alt=""
							title="" width="200" height="150"> <input id="imgPath"
							type="hidden" name="course_picture" title="課程封面圖片"
							value="${bean.course_picture}"> <!--      <input onchange="previewImg(this)" type="file" title="課程封面圖片">  -->
						</td>
					</tr>
					<tr>
						<td class="th" style="border-radius:0 0 0 20px">課程狀態:</td>
						<c:if test="${bean.course_status == 1}">
							<td><select name="course_status" id="course_status"
								oninput="reason()" style="border: solid 1px">
									<option value="1">待審核</option>
									<option value="2">審核通過</option>
									<option value="3">駁回</option>
							</select></td>
						</c:if>
						<c:if test="${bean.course_status == 2}">
							<td><select name="course_status" id="course_status"
								disabled="disabled">
									<option value="2">審核完成</option>
							</select></td>
						</c:if>
					</tr>
					<tr class="reason"></tr>
				</table>
			</c:when>
			<c:otherwise>
				<table class="tb" align='center'>


					<input type="hidden" name="courseId" value="${bean.courseId}">

					<input type="hidden" style="border: solid 1px" name="user_id" value="${bean.user_id}">
					
					<tr>
						<td class="th" style="border-radius:20px 0 0 0">課程名稱:</td>
						<td><input type="text" style="border: solid 1px" name="course_name" size="30"
							maxlength="30" value="${bean.course_name}"></td>
					</tr>
					<tr>
						<td class="th">科目名稱:</td>
						<td><select name="subject_id" id="subject_id" style="border: solid 1px">
								<c:if test="${bean.coursesub.subject_id == '1'}">
									<option value="1">數學</option>
									<option value="2">英文</option>
									<option value="3">多益</option>
								</c:if>
								<c:if test="${bean.coursesub.subject_id == '2'}">
									<option value="2">英文</option>
									<option value="1">數學</option>
									<option value="3">多益</option>
								</c:if>
								<c:if test="${bean.coursesub.subject_id == '3'}">
									<option value="3">多益</option>
									<option value="2">英文</option>
									<option value="1">數學</option>
								</c:if>
						</select></td>
					</tr>
					<tr>
						<td class="th">開課班別代碼:</td>
						<td>
							<select name="education_id" id="education_id" style="border: solid 1px">
								<c:if test="${bean.courseedu.education_id == '1'}">
									<option value="1">國中</option>
									<option value="2">高中</option>
									<option value="3">成人</option>
								</c:if>
								<c:if test="${bean.courseedu.education_id == '2'}">
									<option value="2">高中</option>
									<option value="1">國中</option>
									<option value="3">成人</option>
								</c:if>
								<c:if test="${bean.courseedu.education_id == '3'}">
									<option value="3">成人</option>
									<option value="1">國中</option>
									<option value="2">高中</option>
								</c:if>
						</select>
						</td>
					</tr>
					<tr>
						<td class="th">課程簡介:</td>
						<td><textarea cols="20" rows="4" name="course_introduction"
								title="課程簡介" style="border: solid 1px">${bean.course_introduction}</textarea></td>
					</tr>
					<tr>
						<td class="th">課程價格:</td>
						<td><input type="text" style="border: solid 1px" name="course_price" size="5"
							title="課程價格" value="${bean.course_price}"></td>
					</tr>
					<tr>
						<td class="th">課程時數:</td>
						<td><input type="text" style="border: solid 1px" name="course_duration" size="15"
							title="課程時數" value="${bean.course_duration}"></td>
					</tr>
					<tr>
						<td class="th">已購買人數:</td>
						<td><input type="text" style="border: solid 1px" name="enrollment" size="3"
							title="報名人數" value="${bean.enrollment}"></td>
					</tr>
					<tr>
						<td class="th">課程上架日期:</td>
						<td><input type="date" style="border: solid 1px" name="course_date" title="開課日期"
							value="${bean.course_date}"></td>
					</tr>
					<tr>
						<td class="th">講師姓名:</td>
						<td><input type="text" style="border: solid 1px" name="lecturer_name" size="5"
							title="講師姓名" value="${bean.lecturer_name}"></td>
					</tr>
					<tr>
						<td class="th">講師信箱:</td>
						<td><input type="text" style="border: solid 1px" name="lecturer_email" size="30"
							title="講師信箱" value="${bean.lecturer_email}"></td>
					</tr>
					<tr>
						<td class="th">課程封面圖片:</td>
						<td><img src="${bean.course_picture}" id="img" alt=""
							title="" width="200" height="150"> <input id="imgPath"
							type="hidden" name="course_picture" title="課程封面圖片"
							value="${bean.course_picture}"> <input
							onchange="previewImg(this)" type="file" title="課程封面圖片"></td>
					</tr>
					<tr>
						<td class="th" style="border-radius:0 0 0 20px">課程狀態:</td>
						<c:if test="${bean.course_status == 1}">
							<td><select name="course_status" id="course_status" style="border: solid 1px">
									<option value="1">待審核</option>
									<option value="2">審核通過</option>
									<option value="3">駁回</option>
							</select></td>
						</c:if>
						<c:if test="${bean.course_status == 2}">
							<td><input type="hidden" name="course_status"
								id="course_status" value="2" style="border: solid 1px">審核完成</td>
						</c:if>
					</tr>


				</table>
			</c:otherwise>
		</c:choose>

	</form>
		<br>
		<br>
		<div style="text-align:center">
		<button onclick="checkUpdate()">送出</button>
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
	<script src="xiang/courseback.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,fourth.*"%>

<!DOCTYPE html>

<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>


<html>
<head>
<meta charset=UTF-8">
<title>課程資料新增</title>
<link rel="shortcut icon" type="image/x-icon" href="images/smalllogo.png" />
<style>
.tb {
	border-collapse: collapse;
 	width: 850px; 
	/*自動斷行*/
	word-wrap: break-word;
	table-layout: fixed;
	background-color:	#F0FFF0;
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
	<div style="text-align: center">
		<h1>課程資料</h1>
	</div>

	<c:if test="${sessionScope.user.status == 3}">
	<form action="course.insert" method="post" class="cfi">
	<form id="main">
	</c:if>
	<c:if test="${sessionScope.user.status == 2}">
	<form action="coursefront.insert" method="post" class="cfi">
	</c:if>
<!-- 	<form id="main"> -->
		<table class=tb align='center'>

			<input type="hidden" name="user_id" id="user_id" size="3"
				title="使用者名稱">

			<tr>
				<th class="th" style="border-radius:20px 0 0 0">課程名稱:</th>
				<td><input type="text" style="background-color: white" name="course_name" id="course_name"
					size="30" maxlength="30" title="課程名稱">
				<div class="messages1"></div></td> 

			</tr>
			<tr>
				<th class="th">科目名稱:</th>
				<td><select name="subject_id" id="subject_id" style="background-color: white">
						<option value="0">請選擇科目</option>
						<option value="1">數學</option>
						<option value="2">英文</option>
						<option value="3">多益</option>
				</select>
				<div class="messages2"></div></td>
			</tr>
			<tr>
				<th class="th">開課班別:</th>
				<td><select name="education_id" id="education_id" style="background-color: white">
						<option value="0">請選擇教育程度</option>
						<option value="1">國中</option>
						<option value="2">高中</option>
						<option value="3">成人</option>
				</select>
				<div class="messages3"></div></td>
			</tr>
			<tr>
				<th class="th">課程簡介:</th>
				<td><textarea cols="7" rows="3" name="course_introduction"
						id="course_introduction" title="課程簡介" style="background-color: white"></textarea>
						<div class="messages4"></div></td>
			</tr>
			<tr>
				<th class="th">課程價格:</th>
				<td><input type="text" name="course_price" id="course_price"
					size="5" title="課程價格" style="background-color: white">
					<div class="messages5"></div></td>
			</tr>
			<tr>
				<th class="th">課程時數:</th>
				<td><input type="text" name="course_duration"
					id="course_duration" size="10" title="課程時數" style="background-color: white">
					<div class="messages6"></div></td>
			</tr>


			<input type="hidden" name="enrollment" id="enrollment" size="3"
				title="購買人數" value="0">
			<input type="hidden" name="course_status" id="course_status" size="3"
				title="課程狀態" value="1">

			<tr>
				<th class="th">課程上架日期:</th>
				<td><input type="date" name="course_date" id="course_date"
					title="課程上架日期" style="background-color: white">
					<div class="messages7"></div></td>
			</tr>
			<tr>
				<th class="th">講師姓名:</th>
				<td><input type="text" name="lecturer_name" id="lecturer_name"
					size="5" title="講師姓名" style="background-color: white">
					<div class="messages8"></div></td>
			</tr>
			<tr>
				<th class="th">講師信箱:</th>
				<td><input type="text" name="lecturer_email"
					id="lecturer_email" size="50" title="講師信箱" style="background-color: white">
					<div class="messages9"></div></td>

			</tr>
			<tr>
				<th class="th"  style="border-radius:0 0 0 20px">課程封面圖片:</th>
				<td><input type="file" name="course_picture" title="課程封面圖片">
				<div class="messages10"></div></td>
			</tr>
		</table>



		<!--    <script type="text/javascript">
  		function checkNull(form){
			for(i=0;i<form.length;i++){
 				if(form.elements[i].value == ""){ 
					alert("【 "+ form.elements[i].title+" 】" + "不能為空!!!");
 					form.elements[i].focus();	//當前元素獲取焦點
 					return false;
 				}
			}
  	  	}
   	</script>  -->


		<br> <br>




		</form>

		<div style="text-align: center">
			    <button type="button" onclick="check()">送出</button>


			<button type="button" id="correct" style="background-color: blue">一鍵輸入</button>

<!-- 				<button type="reset" value="reset">清除   <i class="fa-solid fa-trash-can"></i></button> -->
		</div>

	<script src="https://kit.fontawesome.com/9d965cf88e.js" crossorigin="anonymous"></script>
	<script src="xiang/courseback.js"></script>
	<script	src="//cdnjs.cloudflare.com/ajax/libs/validate.js/0.12.0/validate.min.js"></script>
</body>
</html>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page import="java.util.*,fourth.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="images/smalllogo.png" />
<style>
.tb{
   	border-collapse: collapse;
   	width: 850px; 	
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
<title>課程資料修改</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
</head>

<body>
<c:if test="${sessionScope.user.status == 3}">
<jsp:include page="BackendHeader.jsp"/>
<jsp:include page="Style.jsp" />
</c:if>
<c:if test="${sessionScope.user.status == 2}">
<jsp:include page="Header.jsp"/>
</c:if>
<br><br>
<div style="text-align: center">
<h1>課程資料修改</h1>
</div>
<br>

<form action="coursefront.update" class="cfu" method="post">
<table class=tb align='center'>


   <input type="hidden" name="courseId" value="${bean.courseId}">
   <input type="hidden" name="user_id" value="${bean.user_id}">
<tr>
    <th class="th"  style="border-radius:20px 0 0 0">課程名稱:</th>
    <td><input type="text" style="background-color: white" name="course_name" size="30" maxlength="30" value="${bean.course_name}"></td>
</tr>
<tr>
    <th class="th">科目名稱:</th>
    <td>
    <select name="subject_id" id="subject_id" style="background-color: white">
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
				</select>
				</td>
</tr>
<tr>
    <th class="th">開課班別代碼:</th>
    <td>
             <select name="education_id" id="education_id" style="background-color: white">
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
    <th class="th">課程簡介:</th>
    <td><textarea style="background-color: white" cols="20" rows="4" name="course_introduction" title="課程簡介" >${bean.course_introduction}</textarea></td>
</tr>
<tr>
    <th class="th">課程價格:</th>
    <td><input type="text" style="background-color: white" name="course_price" size="5" title="課程價格" value="${bean.course_price}"></td>
</tr>
<tr>
    <th class="th">課程時數:</th>
    <td><input type="text" style="background-color: white" name="course_duration" size="15" title="課程時數" value="${bean.course_duration}"></td>
</tr>

    <input type="hidden" name="enrollment" size="3" title="報名人數" value="0">

<tr>
    <th class="th">課程上架日期:</th>
    <td><input type="date" style="background-color: white" name="course_date" title="開課日期" value="${bean.course_date}"></td>
</tr>
<tr>
    <th class="th">講師姓名:</th>
    <td><input type="text" style="background-color: white" name="lecturer_name" size="5" title="講師姓名" value="${bean.lecturer_name}"></td>
</tr>
<tr>
    <th class="th">講師信箱:</th>
    <td><input type="text" style="background-color: white" name="lecturer_email" size="30" title="講師信箱" value="${bean.lecturer_email}"></td>
</tr>
<tr>
    <th class="th">課程封面圖片:</th>
    <td><img src="${bean.course_picture}" id ="img" alt="" title="" width="200" height="150">
     <input id="imgPath" type="hidden" name="course_picture" title="課程封面圖片" value="${bean.course_picture}">
     <input onchange="previewImg(this)" type="file" title="課程封面圖片"> 
    </td>
</tr>
			<tr>
				<th class="th" style="border-radius: 0 0 0 20px">課程狀態:</th>
				<td style="color:red;font-weight: bold">已駁回</td>
				<input type="hidden" name="course_status" id="course_status" size="3" title="課程狀態" value="1">
			</tr>

		</table>

</form>
<div style="text-align: center">
<br><br>
<button onclick="checkUpdate()" style="background-color: red">重新送出審核</button>
</div>




<script>
function previewImg(element) {

    let file = element.files[0];
    let img = element.parentElement.querySelector("#img");
    let imgPath = element.parentElement.querySelector("#imgPath");
    if (file) {
     img.src = URL.createObjectURL(file);
     imgPath.value = "images/"+file.name;
    }
   
}
</script>
<script src="xiang/coursefront.js"></script>
</body>
</html>
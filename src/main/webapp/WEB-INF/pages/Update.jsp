<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page import="java.util.*,fourth.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
.tb{
   	border-collapse: collapse;
   	width: 850px; 	
   	word-wrap: break-word;
   	table-layout: fixed;
   	background-color: white;
   	border-radius: 20px;
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
<br><br><br>
<center>
<h1>課程資料修改</h1>
</center>
<form action="course.update" method="post">
<c:choose>
<c:when test="${bean.course_status == 1}">
<table class=tb align='center'>

<tr>
   <input type="hidden" name="course_id" value="${bean.course_id}">
</tr>       

    <td><input type="hidden" name="user_id" value="${bean.user_id}"></td>

<tr>
    <td>課程名稱:</td>
    <td><input type="hidden" name="course_name" size="30" maxlength="30" value="${bean.course_name}">${bean.course_name}</td>
</tr>
<tr>
    <td>科目名稱:</td>
    <td>
    <input type="hidden" name="subject_id" id="subject_id" value="${bean.coursesub.subject_id}">
						<c:if test="${bean.coursesub.subject_id == '1'}">數學</c:if>
						<c:if test="${bean.coursesub.subject_id == '2'}">英文</c:if>
						<c:if test="${bean.coursesub.subject_id == '3'}">多益</c:if>
				</td>
</tr>
<tr>
    <td>開課班別代碼:</td>
    <td>
             <input type="hidden" name="education_id" id="education_id" value="${bean.courseedu.education_id}">
						<c:if test="${bean.courseedu.education_id == '1'}">國中</c:if>
						<c:if test="${bean.courseedu.education_id == '2'}">高中</c:if>
						<c:if test="${bean.courseedu.education_id == '3'}">成人</c:if>
				</td>
</tr>
<tr>
    <td>課程簡介:</td>
    <td><input type="hidden" cols="20" rows="4" name="course_introduction" title="課程簡介" value="${bean.course_introduction}">${bean.course_introduction}</td>
</tr>
<tr>
    <td>課程價格:</td>
    <td><input type="hidden" name="course_price" size="5" title="課程價格" value="${bean.course_price}">${bean.course_price}</td>
</tr>
<tr>
    <td>課程時數:</td>
    <td><input type="hidden" name="course_duration" size="15" title="課程時數" value="${bean.course_duration}">${bean.course_duration}</td>
</tr>

 

<tr>
    <td>課程上架日期:</td>
    <td><input type="hidden" name="course_date" title="開課日期" value="${bean.course_date}">${bean.course_date}</td>
    <input type="hidden" name="enrollment" size="3" title="報名人數" value="${bean.enrollment}">
</tr>
<tr>
    <td>講師姓名:</td>
    <td><input type="hidden" name="lecturer_name" size="5" title="講師姓名" value="${bean.lecturer_name}">${bean.lecturer_name}</td>
</tr>
<tr>
    <td>講師信箱:</td>
    <td><input type="hidden" name="lecturer_email" size="30" title="講師信箱" value="${bean.lecturer_email}">${bean.lecturer_email}</td>
</tr>
<tr>
    <td>課程封面圖片:</td>
    <td><img src="${bean.course_picture}" id ="img" alt="" title="" width="200" height="150">
     <input id="imgPath" type="hidden" name="course_picture" title="課程封面圖片" value="${bean.course_picture}">
<!--      <input onchange="previewImg(this)" type="file" title="課程封面圖片">  -->
    </td>
</tr>
<tr>
				<td>課程狀態:</td>
						<c:if test="${bean.course_status == 1}">
				<td><select name="course_status" id="course_status" >
							<option value="1">待審核</option>
							<option value="2">審核通過</option>
							<option value="3">駁回</option>
				</select></td>
						</c:if>
						<c:if test="${bean.course_status == 2}">
							<td><select name="course_status" id="course_status" disabled="disabled">
							<option value="2">審核完成</option>
				</select></td>
						</c:if>
			</tr>

</table>
</c:when>
<c:otherwise>
<table class=tb align='center'>


   <input type="hidden" name="course_id" value="${bean.course_id}">
      
<tr>
    <td>使用者名稱:</td>
    <td><input type="text" name="user_id" value="${bean.user_id}"></td>
</tr>
<tr>
    <td>課程名稱:</td>
    <td><input type="text" name="course_name" size="30" maxlength="30" value="${bean.course_name}"></td>
</tr>
<tr>
    <td>科目名稱:</td>
    <td>
    <select name="subject_id" id="subject_id">
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
    <td>開課班別代碼:</td>
    <td>
<%--     <input type="text" name="education_id" size="10" maxlength="10" title="開課班別代碼" value="${bean.courseedu.education_id}"> --%>
             <select name="education_id" id="education_id">
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
    <td>課程簡介:</td>
    <td><textarea cols="20" rows="4" name="course_introduction" title="課程簡介" >${bean.course_introduction}</textarea></td>
</tr>
<tr>
    <td>課程價格:</td>
    <td><input type="text" name="course_price" size="5" title="課程價格" value="${bean.course_price}"></td>
</tr>
<tr>
    <td>課程時數:</td>
    <td><input type="text" name="course_duration" size="15" title="課程時數" value="${bean.course_duration}"></td>
</tr>
<tr>
    <td>已購買人數:</td>
    <td><input type="text" name="enrollment" size="3" title="報名人數" value="${bean.enrollment}"></td>
</tr>
<tr>
    <td>課程上架日期:</td>
    <td><input type="date" name="course_date" title="開課日期" value="${bean.course_date}"></td>
</tr>
<tr>
    <td>講師姓名:</td>
    <td><input type="text" name="lecturer_name" size="5" title="講師姓名" value="${bean.lecturer_name}"></td>
</tr>
<tr>
    <td>講師信箱:</td>
    <td><input type="text" name="lecturer_email" size="30" title="講師信箱" value="${bean.lecturer_email}"></td>
</tr>
<tr>
    <td>課程封面圖片:</td>
    <td><img src="${bean.course_picture}" id ="img" alt="" title="" width="200" height="150">
     <input id="imgPath" type="hidden" name="course_picture" title="課程封面圖片" value="${bean.course_picture}">
     <input onchange="previewImg(this)" type="file" title="課程封面圖片"> 
    </td>
</tr>
<tr>
				<td>課程狀態:</td>
						<c:if test="${bean.course_status == 1}">
				<td><select  name="course_status" id="course_status">
							<option value="1">待審核</option>
							<option value="2">審核通過</option>
							<option value="3">駁回</option>
				</select></td>
						</c:if>
						<c:if test="${bean.course_status == 2}">
							<td>
							<input type="hidden" name="course_status" id="course_status" value="2">審核完成
							
				</td>
						</c:if>
			</tr>

</table>
</c:otherwise>
</c:choose>


<center>
<br><br>
<c:if test="${bean.course_status == 1}">
<input onclick="if( !(confirm('確定送出審核結果嗎?') ) ) return false; alert('已送出!')" type="submit" name="submit"  value="送出">
</c:if>
<c:if test="${bean.course_status == 2}">
<input onclick="if( !(confirm('確定要修改嗎?') ) ) return false; alert('修改成功!')" type="submit" name="submit"  value="確定">
</c:if>
</center>


</form>

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

</body>
</html>
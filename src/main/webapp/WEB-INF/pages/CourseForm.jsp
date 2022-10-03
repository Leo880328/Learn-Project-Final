
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,fourth.*"%>

<!DOCTYPE html>

<% 
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>


<html>
<head>
<meta charset=UTF-8">
<title>課程資料新增</title>
<link rel="shortcut icon" type="image/x-icon" href="images/smalllogo.png" />
<style>
.tb{
   	border-collapse: collapse;
   	width: 850px; 	
   	/*自動斷行*/
   	word-wrap: break-word;
   	table-layout: fixed;
   	background-color: white;
   	border-radius: 20px;

   }
</style>
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
<h1>課程資料</h1>
</center>

<c:if test="${sessionScope.user.status == 3}">
<form action="course.insert" method="post" class="cfi">
</c:if>
<c:if test="${sessionScope.user.status == 2}">
<form action="coursefront.insert" method="post" class="cfi">
</c:if>
<table class=tb align='center'>
<!-- <tr> -->
<!--     <td>使用者名稱:</td> -->
    <input type="hidden" name="user_id" id="user_id" size="3" title="使用者名稱">
<!-- </tr> -->
<tr>
    <td>課程名稱:</td>
    <td><input type="text" name="course_name" id="course_name" size="30" maxlength="30" title="課程名稱"></td>

</tr>
<tr>
    <td>科目名稱:</td>
    <td><!-- <input type="text" name="subject_id" size="2" maxlength="5" title="科目名稱代碼"> -->

    <select name="subject_id" id="subject_id">
    <option>請選擇科目</option>
    <option value="1">數學</option>
    <option value="2">英文</option>
    <option value="3">多益</option>
</select></td>
</tr>
<tr>
    <td>開課班別:</td>
    <td><!-- <input type="text" name="education_id" size="2" maxlength="10" title="開課班別代碼"> -->

  <select name="education_id" id="education_id">
    <option>請選擇教育程度</option>
    <option value="1">國中</option>
    <option value="2">高中</option>
    <option value="3">成人</option>
</select></td>
</tr>
<tr>
    <td>課程簡介:</td>

    <td><textarea cols="10" rows="3" name="course_introduction" id="course_introduction" title="課程簡介" ></textarea></td>
</tr>
<tr>
    <td>課程價格:</td>
    <td><input type="text" name="course_price" id="course_price" size="5" title="課程價格"></td>
</tr>
<tr>
    <td>課程時數:</td>
    <td><input type="text" name="course_duration" id="course_duration" size="10" title="課程時數"></td>
</tr>


  <input type="hidden" name="enrollment" id="enrollment" size="3" title="購買人數" value="0">
  <input type="hidden" name="course_status" id="course_status" size="3" title="課程狀態" value="1">
  
<tr>
    <td>課程上架日期:</td>
    <td><input type="date" name="course_date" id="course_date" title="課程上架日期"></td>
</tr>
<tr>
    <td>講師姓名:</td>
    <td><input type="text" name="lecturer_name" id="lecturer_name" size="5" title="講師姓名"></td>
</tr>
<tr>
    <td>講師信箱:</td>
    <td><input type="text" name="lecturer_email" id="lecturer_email" size="50" title="講師信箱"></td>

</tr>
<tr>
    <td>課程封面圖片:</td>
    <td><input  type="file" name="course_picture" title="課程封面圖片"></td>
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
 	

<br/>
<br/>


<!-- <input type="submit" name="submit" value="確定" onclick="if( !(confirm('確認新增?') ) ) return false;alert('新增完成 ! 請等待管理員審核')"> -->


</form>

<center>
    <button onclick="checkAdd()" >送出</button>
    
    <button type="button" id="correct" style="background-color:blue">一鍵輸入</button>

<!-- 	<button type="reset" value="reset">清除   <i class="fa-solid fa-trash-can"></i></button> -->
</center>

		
<script src="https://kit.fontawesome.com/9d965cf88e.js" crossorigin="anonymous"></script>
<script src="xiang/courseback.js"></script>

</body>
</html>
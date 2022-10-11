<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,fourth.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>課程功能列表</title>
<link rel="shortcut icon" type="image/x-icon"
	href="images/smalllogo.png" />
<style>
 .tb { 
 	border-collapse: collapse;  
  	margin-left:285px; 
	width: 1230px;
 	/*自動斷行*/ 
 	word-wrap: break-word;
  	table-layout: fixed; 
   	background-color: white; 
   border-radius: 20px;  
 } 

#delete{
	background-color: #FF0000;
	border-radius: 10px;
}
.st{
    background-color:#D0D0D0;
	border-radius: 10px;
}
.nst{
    background-color:#4A4AFF;
	border-radius: 10px;
}
}
</style>


</head>
<body>
	<jsp:include page="BackendHeader.jsp" />
	<jsp:include page="Style.jsp" />
<br><br><br><br>
	<div align="center">
	
         <form action="course.qname" method="post">
			<label> 課程名稱 : <input type="text" name="keyword" size="9" style="background-color: white">
 			</label> <input type="submit" name="query" value="查詢">
 		</form>

		<form action="course.qid" method="post">
		<label> 課程編號 : <input type="text" name="keyword" size="9" style="background-color: white"></label> <input
				type="submit" name="query" value="查詢">
		</form>
		<div align="center">
			<p>${errorMsgMap.QueryError}</p>
		</div>
		
	</div>

	<table class='tb'  border='1'>
		<tr>
			<td align="center">課程編號</td>
			<td align="center">課程圖片</td>
			<td align="center">課程名稱</td>
			<td align="center">課程分類</td>
			<td align="center">開課班別</td>
<!-- 			<td align="center">課程時長</td> -->
			<td align="center">課程價格</td>
			<td align="center">已購買人數</td>
<!-- 			<td align="center">上架日期</td> -->
			<td align="center">講師姓名</td>
			<td align="center">審核狀態</td>
<!-- 			<td align="center">課程資訊</td> -->
			<td align="center">修改功能</td>
			<td align="center">刪除功能</td>
		</tr>

		<c:forEach var="course" items="${list}">
			<tr>
				<td><h4><center><c:out value="${course.courseId}" /></center></h4></td>
				<td><img src="<c:out value="${course.course_picture}" />" alt="" title="" width="150" height="150"></td>
				<td><c:out value="${course.course_name}" /></td>
				<c:if test="${course.coursesub.subject_id == '1'}"><td><center>數學</center></td></c:if>
				<c:if test="${course.coursesub.subject_id == '2'}"><td><center>英文</center></td></c:if>
				<c:if test="${course.coursesub.subject_id == '3'}"><td><center>多益</center></td></c:if>
				<c:if test="${course.courseedu.education_id == '1'}"><td><center>國中</center></td></c:if>
				<c:if test="${course.courseedu.education_id == '2'}"><td><center>高中</center></td></c:if>
				<c:if test="${course.courseedu.education_id == '3'}"><td><center>成人</center></td></c:if>
<%-- 				<td><c:out value="${course.course_duration}" /></td> --%>
				<td><center>$<c:out value="${course.course_price}" /></center></td>
				<td><center><c:out value="${course.enrollment}" /></td>
<%-- 				<td><c:out value="${course.course_date}" /></center></td> --%>
				<td><center><c:out value="${course.lecturer_name}" /></center></td>
				<c:if test="${course.course_status == 1}">
				<td><center><button class="nst"><i class="fa-solid fa-triangle-exclamation"></i>未審核</button></center></td>
				</c:if>
				<c:if test="${course.course_status == 2}">
				<td><center><button class="st">審核完成</button></center></td>
				</c:if>
				<c:if test="${course.course_status == 3}">
				<td><center><button style="background-color:#000000;
				border-radius: 10px" ><i class="fa-solid fa-reply"></i>已駁回</button></center></td>
				</c:if>
<!-- 				<td> -->
<%-- 					request.setAttribute("bean", courseBean); <a --%>
<%-- 					href="course.details?courseId=${course.courseId}"><input --%>
<!-- 						type="submit" name="details" value="查看詳情"></a> -->
<!-- 				</td> -->
                <c:if test="${course.course_status == 2}">
				<td>
					<a href="course.show?courseId=${course.courseId}"><button
						type="submit" name="update" value="修改課程" style="border-radius: 10px">修改課程</button></a>
				</td>
				</c:if>
				<c:if test="${course.course_status == 1}">
				<td>
					<a href="course.show?courseId=${course.courseId}"><button
						type="submit" name="update" value="審核課程" style="border-radius: 10px">審核課程</button></a>
				</td>
				</c:if>
				<c:if test="${course.course_status == 2}">

<%-- 				<td><a href="course.delete?courseId=${course.courseId}"><button --%>
<!-- 							onclick="if( !(confirm('確認刪除?') ) ) return false; alert('刪除成功!')" -->
<!-- 							id='delete' type="submit" name="delete" value="刪除課程"> <i class="fa-solid fa-trash"></i>  刪除</button></a></td> -->
				<td><button onclick="del(${course.courseId})"

							id='delete' type="submit" name="delete" value="刪除課程"> <i class="fa-solid fa-trash"></i>  刪除</button></td>
				</c:if>
			</tr>

		</c:forEach>


	</table>
	<br><br>
	<div align="center">
		<center><a href="course.add"><input type="submit" name="addcourse"
			value="新增課程"></a></center>
	</div>
<script src="xiang/courseback.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


</body>
</html>
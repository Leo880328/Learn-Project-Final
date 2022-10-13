<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page import="java.util.List"%>
<%@ page import="fourth.bean.CourseBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢結果</title>
<link rel="shortcut icon" type="image/x-icon" href="images/smalllogo.png" />
<style>
.tb{
   	border-collapse: collapse;
   	margin-left:285px;
   	width: 1200px; 	
   	/*自動斷行*/
   	word-wrap: break-word; 
   	table-layout: fixed; 
   	background-color: white;
   	border-radius: 20px;
   }
   #delete{
	background-color: #FF0000;
}

</style>
</head>
<body>
<jsp:include page="BackendHeader.jsp"/>
<jsp:include page="Style.jsp" />
<br><br><br>
<center><h2>查詢結果</h2></center>
<table class='tb' align='center' border='1' cellspacing='0'>
<br>
		<tr>
		   <td align="center">課程編號</td>
			<td align="center">課程圖片</td>
			<td align="center">課程名稱</td>
			<td align="center">課程分類</td>
			<td align="center">開課班別</td>
<!-- 			<td align="center">課程時長</td> -->
			<td align="center">課程價格</td>
			<td align="center">已購買人數</td>
			<td align="center">上架日期</td>
			<td align="center">講師姓名</td>
<!-- 			<td align="center">課程資訊</td> -->
			<td align="center">修改功能</td>
			<td align="center">刪除功能</td>
			
		</tr>
		
	<c:forEach var="course" items="${queryResult}">	
		
		<tr>
				<td><h4><center><c:out value="${course.course_id}" /></center></h4></td>
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
				<td><c:out value="${course.course_date}" /></center></td>
				<td><center><c:out value="${course.lecturer_name}" /></center></td>
<!-- 				<td> -->
<%-- 					request.setAttribute("bean", courseBean); <a --%>
<%-- 					href="course.details?course_id=${course.course_id}"><input --%>
<!-- 						type="submit" name="details" value="查看詳情"></a> -->
<!-- 				</td> -->
				<td>
					<%--request.setAttribute("bean", courseBean); --%> <a
					href="course.show?course_id=${course.course_id}"><input
						type="submit" name="update" value="修改"></a>
				</td>
				<td><a
					href="course.delete?course_id=${course.course_id}"><button
							onclick="if( !(confirm('確認刪除?') ) ) return false; alert('刪除成功!')"
							id='delete' type="submit" name="delete" value="刪除課程">刪除</button></a></td>
			</tr>
		

	</c:forEach>	
	</table>
	<br><br>
	<center><a href="course.list"><input type="submit" name="return" value="返回課程列表"></a></center>
	
</body>
</html>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page import="fourth.dao.CourseDao"%>
<%@ page import="java.util.List"%>
<%@ page import="fourth.bean.CourseBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢結果</title>
<style>
.tb{
   	border-collapse: collapse;
   	width: 1000px; 	
   	/*自動斷行*/
   	word-wrap: break-word;
   	table-layout: fixed;
   	background-color: white;
   	border-radius: 20px;
   }
</style>
</head>
<body>
<jsp:include page="BackendHeader.jsp"/>
<jsp:include page="Style.jsp" />
<br><br><br>
<center><h2>查詢結果</h2></center>
<table class='tb' align='center' border='1' cellspacing='0'>

		    <td>課程編號</td>
		    <td>課程圖片</td>
			<td>課程名稱</td>
<!-- 			<td>課程簡述</td> -->
			<td>課程時長</td>
			<td>課程價格</td>
			<td>已購買人數</td>
			<td>上架日期</td>
			<td>講師姓名</td>
			<td>課程資訊</td>
			
		</tr>
  		<!--  
         CourseBean courseBean = (CourseBean) request.getAttribute("queryId");
          %>-->
		
		<tr>
		    
			<td><h4><center>${queryId.course_id}</center></h4></td>
		    <td><img src="${queryId.course_picture}"alt="" title="" width="250" height="200"></td>
			<td>${queryId.course_name}</td>
<%-- 			<td><%=courseBean.getCourse_introduction() %></td> --%>
			<td>${queryId.course_duration}</td>
			<td><center>${queryId.course_price}</center></td>
			<td><center>${queryId.enrollment}</center></td>
			<td>${queryId.course_date}</td>
			<td><center>${queryId.lecturer_name}</center></td>
			<td>
				<%--request.setAttribute("bean", courseBean); --%> <a
				href="course.details?action=details&course_id=${queryId.course_id}"><input
					type="submit" name="details" value="查看詳情"></a>
			</td>
		</tr>

	
</form>		
</table>
	<br><br>
	<center><a href="course.list"><input type="submit" name="return" value="返回課程列表"></a></center>
</body>
</html>
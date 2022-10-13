<%@page import="org.springframework.ui.Model"%>
<%@page
	import="org.eclipse.jdt.internal.compiler.env.IUpdatableModule.UpdateKind"%>
<%@page import="fourth.dao.ColumnDAO1"%>
<%@page import="java.util.*"%>
<%@page import="fourth.bean.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="fourth.dao.ColumnDAO1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%
response.setContentType("text/html;charset=UTF-8");
response.setCharacterEncoding("UTF-8");
request.setCharacterEncoding("UTF-8");

response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>專欄</title>
<style>
.listname {
	text-align: center
}

#id1{
	display: inline;
}
.tb{
border-collapse: collapse;
	width: 75%;
    word-wrap: break-word;
    table-layout: fixed;
    background-color: white;
    border-radius: 20px;
   margin-left:280px;
}
.btn{
margin-left: 275px;
}
.title{
margin-left: 750px;
}
</style>
</head>



<body>
	<jsp:include page="BackendHeader.jsp" /> 
 	<jsp:include page="Style.jsp" /> 


		
		<br><br><br><br>
<div class="title">

			<h1>數學列表</h1>
		
			<form action="searchAction" method="get" enctype="multipart/form-data">
			<input type="text" name="search"> 
			<input style="border-radius: 10px" type="submit" name="searchno" value="查詢">
	        </form>
            <p>${errors.name }</p>
 </div>        
 
<div class="btn">
   		<a href="ColumnAdd">
			<button style="border-radius: 10px" >新增專欄</button>
			</a>
   	
         <form id="id1" action="searchEnglish" method="post">
         <input style="border-radius: 10px" type="submit" name="searchEnglish" value="英文">
         </form>
         
          <form id="id1" action="searchToeic" method="post">
         <input style="border-radius: 10px" type="submit" name="searchToeic" value="多益">
         </form>
         
          <form id="id1" action="searchMath" method="post">
         <input style="border-radius: 10px" type="submit" name="searchMath" value="數學">
         </form>
</div>  	


		<table class="tb"border="1">

<thead>

			<tr>
				<th>文章編號</th>
				<th>發表日期</th>
				<th>使用者編號</th>
				<th>作者名稱</th>
				<th>權限</th>
				<th>科目</th>
				<th>標題</th>
				<th>編輯</th>
				<th>細節</th>
				<th>刪除</th>
			</tr>
</thead>
		<c:forEach var="c" items="${Math}">
					<tr>
						<td><c:out value="${c.article_no}"></c:out></td>
						<td><c:out value="${c.publish_time }"></c:out></td>
						<td><c:out value="${c.user_id}"></c:out></td>
						<td><c:out value="${c.author}"></c:out></td>
						<td><c:out value="${c.role}"></c:out></td>
						<td><c:out value="${c.subject}"></c:out></td>
						<td><c:out value="${c.title}"></c:out></td>
						
					
									
						<td>
								<button style="border-radius: 10px;background-color: #0080FF">
									<a href="more1?article_no=${c.article_no}"> 編輯文章 </a>
								</button>
							</td>


						<form action="more?article_no=${c.article_no }"
							method="get">
							<td><input  style="border-radius:10px;background-color: #5CADAD" type="submit" name="more" value="細節"> <input
								type="hidden" name="article_no" value="${c.article_no }"></td>
						</form>

						<form action="ColumnDelete?article_no=${c.article_no }"
							method="post" enctype="multipart/form-data">
							<td><input  style="border-radius:10px;  background-color: #FF0000;" type="submit" name="delete" value="刪除"></td> <input
								type="hidden" name="article_no" value="${c.article_no }">
						</form>

					</tr>
				</c:forEach>

		</table>


</body>
</html>
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
</style>
</head>



<body>
	<jsp:include page="BackendHeader.jsp" /> 
 	<jsp:include page="Style.jsp" /> 


		<center>
		<br><br><br><br>
			<h1>數學列表</h1>
		</center>
 <center>		
			
		

			<form action="searchAction" method="get" enctype="multipart/form-data">
			<input type="text" name="search"> 
			<input type="submit" name="searchno" value="查詢">
	        </form>
            <p>${errors.name }</p>
   </center>           
 
   	<center>
   		<a href="ColumnAdd">
			<button >新增專欄</button>
			</a>
   	
         <form id="id1" action="searchEnglish" method="post">
         <input type="submit" name="searchEnglish" value="英文">
         </form>
         
          <form id="id1" action="searchToeic" method="post">
         <input type="submit" name="searchToeic" value="多益">
         </form>
         
          <form id="id1" action="searchMath" method="post">
         <input type="submit" name="searchMath" value="數學">
         </form>
   	</center>


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
				<th></th>
				<th></th>
				<th></th>
			</tr>
</thead>
			<c:choose>
				<c:when test="${column != null }">
					<c:set var="col" value="${column }" />
					<td>${col.article_no }</td>
					<td>${col.publish_time }</td>
					<td>${col.user_id}</td>
					<td>${col.author }</td>
					<td>${col.role }</td>
					<td>${col.subject }</td>
					<td>${col.title }</td>
					<td>${col.contents }</td>	
				</c:when>

				<c:otherwise>
					<%
					List<ColumnBean> selectAllColumns = (List<ColumnBean>) request.getAttribute("Math");

					for (ColumnBean c : selectAllColumns) {
					%>
					<tr>

						<td><%=c.getArticle_no()%></td>
						<td><%=c.getPublish_time()%></td>
						<td><%=c.getUser_id()%></td>
						<td><%=c.getAuthor()%></td>
						<td><%=c.getRole()%></td>
						<td><%=c.getSubject() %></td>
						<td><%=c.getTitle() %></td>
						
						<td>			
						<a href="Update?article_no=<%=c.getArticle_no()%>&publish_time=<%=c.getPublish_time()%>&user_id=<%=c.getUser_id()%>&author=<%=c.getAuthor()%>&role=<%=c.getRole()%>&subject=<%=c.getSubject()%>&title=<%=c.getTitle()%>&contents=<%=c.getContents()%>"><button
									name="edit" value="edit">編輯</button></a>
						</td>


						<form action="more?article_no=<%=c.getArticle_no()%>"
							method="get">
							<td><input type="submit" name="more" value="更多"> <input
								type="hidden" name="article_no" value="<%=c.getArticle_no()%>"></td>
						</form>

						<form action="ColumnDelete?article_no=<%=c.getArticle_no()%>"
							method="post" enctype="multipart/form-data">
							<td><input type="submit" name="delete" value="刪除"></td> <input
								type="hidden" name="article_no" value="<%=c.getArticle_no()%>">
						</form>

					</tr>
					<%
					}
					%>
				</c:otherwise>
			</c:choose>
		</table>


</body>
</html>
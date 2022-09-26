<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="fourth.bean.MemberBean"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員後台</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>

<link rel="shortcut icon" type="image/x-icon"
	href="assets/images/smalllogo.png" />
<style>
.tb {
	border-collapse: collapse;
	margin-left: 300px;
	width: 1600px;
	/*自動斷行*/
	word-wrap: break-word;
	table-layout: fixed;
}
</style>

</head>
<body>
	<jsp:include page="BackendHeader.jsp" />
	<jsp:include page="Style.jsp" />
	<br>
	<%-- 	<c:if test="${sessionScope.user == null}"> --%>
	<%-- 		<% --%>
	<!-- 	// request.getRequestDispatcher("/Login.jsp").forward(request, -->
	<!-- 	response); -->
	<%-- 		%> --%>
	<%-- 	</c:if> --%>
	<br>
	<br>
	<br>
	<br>
	<div align="center">
		<button type="submit">
			<a href="addNewUser">新增會員</a>
		</button>
	</div>
	<br>
	<div align="center">
		<form action="queryAccount" method="post">
			<label> 帳號查詢 : <input type="text" name="keyword_account">
			</label> <input type="submit" name="query" value="查詢">
			<p>${errorMsgMap.QueryError}</p>
		</form>
	</div>
	<hr>
	<div>
		<h3>會員清單</h3>
	</div>
	<table class='tb' border='1' id="member">
		<thead>
			<tr>
				<th>ID</th>
				<th>暱稱</th>
				<th>帳號</th>
				<!-- <th>密碼</th> -->
				<th>身分</th>
				<th>姓名</th>
				<th>大頭貼</th>
				<th>性別</th>
				<th>生日</th>
				<th>手機號碼</th>
				<th>信箱</th>
				<th>註冊日期</th>
				<th>Actions</th>
			</tr>
		</thead>
		<c:forEach var="mb" items="${listMembers}">

			<tbody>

				<tr>
					<td><c:out value="${mb.userId}" /></td>
					<td><c:out value="${mb.nick}" /></td>
					<td><c:out value="${mb.account}" /></td>
					<!-- <td><c:out value="${mb.password}" /></td> -->
					<td><c:choose>
							<c:when test="${mb.status==4}">
             		 						(學生)待審核
       							</c:when>
							<c:when test="${mb.status==1}">
             		 						學生
       							</c:when>
							<c:when test="${mb.status==2}">
              								老師
       							</c:when>
							<c:otherwise>
              						管理員
       							</c:otherwise>
						</c:choose><c:if test="${mb.status==4}">
							<a class="btn btn-primary"
								href="checkteacher?userId=${mb.userId} ">審核</a>
						</c:if></td>
					<td><c:out value="${mb.name}" /></td>
					<td><img src="${mb.img}" width="150" height="100"></td>
					<td><c:out value="${mb.sex}" /></td>
					<td width="150px"><c:out value="${mb.birthday}" /></td>
					<td width="159px"><c:out value="${mb.cellphone}" /></td>
					<td width="200px"><c:out value="${mb.email}" /></td>
					<td class="td1"><c:out value="${mb.joinDate}" /></td>
					<td><a class="btn btn-warning"
						href="showEditUser?userId=${mb.userId} ">修改</a> <a
						class="btn btn-danger btn--raised"
						onclick="if( !(confirm('確認刪除?') ) ) return false ;alert(刪除成功)""
						href="deleteUser?userId=${mb.userId} ">刪除</a></td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#member').DataTable();
		});
	</script>
</body>
</html>
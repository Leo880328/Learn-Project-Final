<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,fourth.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
<script>
	$(function(){
			
			//$('#order').DataTable();
	})
</script>
</head>
<body >
	<div style="width: 1500px;" class="container">
		<div class="row justify-content-center">
			<div class="col-auto">

				<table class="table table-striped table-hover" id="order" >
					<thead>
						<tr>
							<th>訂單編號</th>
							<th>訂單生成日期</th>
							<th>購買數量</th>
							<th>總價</th>
							<th>訂單狀態</th>
							<th>詳細</th>
							<th></th>
						</tr>
					</thead>
					<tbody id = "userbody">
<%-- 						<c:forEach items="${order}" var="order" > --%>
<%-- 							<tr id="${order.orderId }"> --%>
<%-- 								<td>${order.orderId }</td> --%>
<%-- 								<td>${order.date }</td> --%>
<%-- 								<td>${order.totoalcount }</td> --%>
<%-- 								<td>${order.status.status }</td> --%>
<%-- 								<td>${order.discount }</td> --%>
<!-- 								<td>$${order.totoalprice }</td> -->

<%-- 								<c:if test="${order.status.id == 1}"> --%>
<!-- 									<td> -->
<!-- 										<form action="orderDetail" method="post"> -->
<%-- 											<input type="hidden" name="cartID" value="${order.orderId}" /> --%>
<!-- 											<button>結帳</button> -->
<!-- 										</form> -->
<!-- 									</td> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test="${order.status.id == 2}"> --%>
<%-- 									<td><a href="${upStatus}"><button id="btn" disabled>已付款</button></a></td> --%>
<%-- 								</c:if> --%>
<%-- 								<c:if test="${order.status.id == 3}"> --%>
<!-- 									<td> -->
<!-- 											<button>待審核</button> -->
<!-- 									</td> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test="${order.status.id == 4}"> --%>
<!-- 									<td> -->
<!-- 										<form action="orderDetail" method="post"> -->
<%-- 											<input type="hidden" name="cartID" value="${order.orderId}" /> --%>
<!-- 											<button style="background-color: blue;">詳細</button> -->
<!-- 										</form> -->
<!-- 									</td> -->
<%-- 								</c:if> --%>

<!-- 								<td> -->
<%-- 									<c:if test="${order.status.id == 1}"> --%>
									
<%-- 											<button onclick="del(${order.orderId})">刪除</button> --%>
	
<%-- 									</c:if> --%>
<!-- 								</td> -->
	
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
					</tbody>
				</table>
				<c:if test="${order.size() == 0 }">
					<div style="border: 1px solid #ddd">
						<div style="width: 100px; margin: auto;">尚無訂單!!!</div>
					</div>

				</c:if>
			</div>
		</div>
	</div>
	
</body>
</html>
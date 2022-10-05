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
	
	
</script>
</head>
<body>
	<div class="container">

		<div class="shop-top-control">
		
			<form class="select-item select-form">
				<span class="title">課程分類</span><select title="sort"
					data-placeholder="12 Products/Page" class="chosen-select" >
					<option value="1">英文</option>
					<option value="2">數學</option>
					<option value="3">10 Products/Page</option>
					<option value="4">8 Products/Page</option>
					<option value="5">6 Products/Page</option>
				</select>
			</form>
			<form class="filter-choice select-form">
				<span class="title">訂單狀態</span><select title="by"
					data-placeholder="Price: Low to High" class="chosen-select" onchange="selectStatus(this)">
					<option value="0">全部</option>
					<option value="1">未付款</option>
					<option value="2">已付款</option>
					<option value="3">待審核</option>
					<option value="4">完成訂單</option>
					<option value="5">已退款</option>
					<option value="6">已駁回</option>
				</select>
			</form>
			<div class="grid-view-mode">
				<div class="inner">
					<a href="listproducts.html" class="modes-mode mode-list active"><span></span><span></span></a><a
						href="gridproducts.html" class="modes-mode mode-grid"><span></span><span></span><span></span><span></span></a>
				</div>
			</div>
		</div>
	</div>
	<!-- --------------------------------------------------------------top -->

	<div style="width: 1500px;" class="container">
		<div class="row justify-content-center">
			<div class="col-auto" id="userOutBody">

				<table class="table table-striped table-hover" id="order">
					<thead>
						<tr>
							<th>訂單編號</th>
							<th>訂單生成日期</th>
							<th>購買數量</th>
<<<<<<< HEAD
							<th>優惠碼</th>
=======
>>>>>>> a6386826bc6e5337e61e829c67c65829d8fb589a
							<th>訂單金額</th>
							<th>訂單狀態</th>
							<th>詳細</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="userbody">
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
					
			</div>
		</div>
	</div>

</body>
</html>
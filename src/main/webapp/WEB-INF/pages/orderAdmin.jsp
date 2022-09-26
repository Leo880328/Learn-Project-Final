<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,fourth.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.tb {
	border-collapse: collapse;
	width: 1100px;
	/*自動斷行*/
	word-wrap: break-word;
	table-layout: fixed;
	margin-left: 130px
}
</style>
<!-- <link rel="stylesheet" type="text/css" -->
<!-- 	href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css"> -->
<script type="text/javascript">
	$(document).ready( function () {
				
		
	})	
</script>
</head>
<body >
	<main class="main">
		<section class="content">
			<header class="content__title">
				<div class="actions">
					<a href="" class="actions__item zmdi zmdi-trending-up"></a><a
						href="" class="actions__item zmdi zmdi-check-all"></a>
					<div class="dropdown actions__item">
						<i data-toggle="dropdown" class="zmdi zmdi-more-vert"></i>
						<div class="dropdown-menu dropdown-menu-right">
							<a href="" class="dropdown-item">Refresh</a><a href=""
								class="dropdown-item">Manage Widgets</a><a href=""
								class="dropdown-item">Settings</a>
						</div>
					</div>
				</div>
			</header>
			<div class="card">
				<div class="card-body" class="row justify-content-center">
					<div class="table-responsive" id="pdfTransfer">
<!-- 						<table id="data-table" class="table table-bordered"> -->
<!-- 							<thead class="thead-default"> -->
<!-- 								<tr> -->
<!-- 									<th>會員帳號</th> -->
<!-- 									<th>會員姓名</th> -->
<!-- 									<th>會員信箱</th> -->
<!-- 									<th>訂單編號</th> -->
<!-- 									<th>訂單生成日期</th> -->
<!-- 									<th>總數</th> -->
<!-- 									<th>訂單狀態</th> -->
<!-- 									<th>總價</th> -->
<!-- 									<th></th> -->
<!-- 								</tr> -->
<!-- 							</thead> -->
<!-- 							<tbody> -->
<%-- 								<c:forEach items="${order}" var="order"> --%>

<%-- 									<tr id="${order.orderId }"> --%>
<%-- 										<td>${order.memberBean.account}</td> --%>
<%-- 										<td>${order.memberBean.name}</td> --%>
<%-- 										<td>${order.memberBean.email}</td> --%>
<%-- 										<td>${order.orderId }</td> --%>
<%-- 										<td>${order.date }</td> --%>
<%-- 										<td>${order.totoalcount }</td> --%>
<%-- 										<td>${order.status.status }</td> --%>
<!-- 										<td>$${order.totoalprice }</td> -->


<!-- 										<td> -->
<!-- 											<div class="hidden-sm hidden-xs btn-group"> -->
<!-- 												<button class="btn btn-xs btn-success"> -->
<!-- 													<i class="ace-icon fa fa-check bigger-120"></i> -->
<!-- 												</button> -->

<!-- 												<button class="btn btn-xs btn-info"> -->
<!-- 													<i class="ace-icon fa fa-pencil bigger-120"></i> -->
<!-- 												</button> -->

												
<!-- 												<button class="btn btn-xs btn-danger" -->
<%-- 													onclick="del(${order.orderId})"> --%>
<!-- 													<i class="ace-icon fa fa-trash-o bigger-120"></i> -->
<!-- 												</button> -->

<!-- 												<form action="orderDetail" method="post"> -->
<%-- 													<input type="hidden" name="cartID" value="${order.orderId}" /> --%>
<!-- 													<button class="btn btn-xs btn-warning"> -->
<!-- 														<i class="ace-icon fa fa-flag bigger-120"></i> -->
<!-- 													</button> -->
<!-- 												</form> -->
<!-- 											</div> -->
<!-- 										</td> -->
<!-- 									</tr> -->
<%-- 								</c:forEach> --%>
<!-- 							</tbody> -->
<!-- 						</table> -->
						
						
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${search != null }"> --%>
<!-- 								<div style="border: 1px solid #ddd"> -->
<!-- 									<div style="width: 100px; margin: auto;">查無此訂單!!!</div> -->
<!-- 								</div> -->
<%-- 							</c:when> --%>

<%-- 							<c:when test="${order == null }"> --%>
<!-- 								<div style="border: 1px solid #ddd"> -->
<!-- 									<div style="width: 100px; margin: auto;">尚無訂單!!!</div> -->
<!-- 								</div> -->
<%-- 							</c:when> --%>
<%-- 						</c:choose> --%>
					</div>
				</div>
			</div>
		</section>
	</main>
	
</body>
</html>
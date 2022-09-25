<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,fourth.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%pageContext.setAttribute("path", request.getContextPath()); %>
<style>
.tb {
	border-collapse: collapse;
	width: 700px;
	/*自動斷行*/
/* 	word-wrap: break-word; */
	table-layout: fixed;
	margin-left: 20px
}
</style>
<script>
	$(function(){
// 		$("#up").click(function(){
// 			var status = $("#status").val();
// 			$.ajax({
// 				async : false,
// 				type:"GET",
// 				url:"updateOrder/"+status+"/${order.orderId }",
// 				success:function(data){
// 					window.location.href="${path}/orderList";
// 					console.log(data);
// 				}
// 			})
// 		})
	})
</script>
</head>
<body>
<br><br><br><br>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-8">
				<c:set value="${order}" var="order" />
				<input type="hidden" name="orderID" value="${order.orderId}">
				<table class="table table-striped ">
					<tr>
						<td colspan="8">
							<table class="table mb-0" >

								<th>訂單編號</th>
								<th>訂單生成日期</th>
								<th>訂單狀態</th>

								<tr>
									<td>${order.orderId }</td>
									<td>${order.date }</td>
									<td>${order.status.status}</td>

<%-- 									<c:choose> --%>
<%-- 										<c:when test="${order.status.id == 4}"> --%>
<%-- 										</c:when> --%>
<%-- 										<c:otherwise> --%>
<!-- 											<td> -->
<!-- 											<select name="updateStatus" id="status"> -->
<%-- 												<c:set var="status" value="${statusArr}"></c:set> --%>
<%-- 												<c:forEach var="i" begin="1" end="4"> --%>
<%-- 														<c:if test="${i == 1}"><option value="${order.status.id}">${order.status.status}</option></c:if> --%>
<%-- 														<c:if test="${i != order.status.id}"><option value="${i}">${status[i]}</option></c:if> --%>
<%-- 												</c:forEach> --%>
<!-- 											</select></td> -->
<%-- 										</c:otherwise> --%>
<%-- 									</c:choose> --%>

								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="8">
							<table class="table mb-0">

								<th>會員帳號</th>
								<th>會員姓名</th>
								<th>會員信箱</th>
								<th>會員手機</th>
								<tr>
									<td>${order.memberBean.account}</td>
									<td>${order.memberBean.name}</td>
									<td>${order.memberBean.email}</td>
									<td>${order.memberBean.cellphone}</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="8">
							<table class="table mb-0">

								<th>商品編號</th>
								<th>商品名稱</th>
								<th>商品數量</th>
								<th>商品價錢</th>

								<tr>
									<c:forEach items="${itemList}" var="item">
										<tr>
											<td>${item.item_id}</td>
											<td>${item.name}</td>
											<td>${item.count}</td>
											<td>$${item.price}</td>
										</tr>
									</c:forEach>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<table class="table " >
					<tr>
						<td colspan="7"></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="7"></td>
						<td></td>
						<td></td>
						<th>總價</th>
						<td>$${order.totoalprice }</td>
					</tr>
					<tr>
						<td colspan="7"></td>
						<td></td>
						<td></td>
						<th>折扣</th>
						<td>${order.discount }</td>
					</tr>
					<tr>
						<td colspan="7"></td>
						<td></td>
						<td></td>
						<th>合計</th>
						<td>$${order.totoalprice }</td>
					</tr>
				</table>
				<div style="margin: auto; width: 88px;">
					<form action="orderList" method="GET"><button  class="btn btn-dark">返回</button></form>

				</div>

			</div>
		</div>
	</div>
</body>
</html>
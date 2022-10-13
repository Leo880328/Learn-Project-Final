<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,fourth.*"%>

<!DOCTYPE html>
<link type="text/css" rel="stylesheet" href="css/style.css">
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon"
	href="assets/images/smalllogo.png" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>

<script type="text/javascript">
	function buyCheck() {
		
			const swalWithBootstrapButtons = Swal.mixin({
				customClass: {
					confirmButton: 'btn btn-success',
					cancelButton: 'btn btn-danger'
				},
				buttonsStyling: false
			})
		
			swalWithBootstrapButtons.fire({
				title: '確認購買?',
				text: "",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonText: '購買',
				cancelButtonText: '取消',
				reverseButtons: false
			}).then((result) => {
				if (result.isConfirmed) {
					$.ajax({
						async : false,
						type : "POST",
						url : "orderAdd",
						success : function(data) {
							window.location.href = "${PATH}/orderList";
						}
					})
					swalWithBootstrapButtons.fire(
						'生成訂單!',
						'你的訂單已生成',
						'success'
					)
 				} 

			})
	}
</script>

</head>
<body onload="cartList()">
	<c:if test="${sessionScope.pageStatus == '3'}">
		<br>
		<br>
		<br>
		<br>
		<jsp:include page="BackendHeader.jsp" />

	</c:if>
	<c:if test="${sessionScope.pageStatus != '3'}">
		<jsp:include page="Header.jsp" />
	</c:if>
	<div class="container ">
		<div lass="row justify-content-center ">
			<form class="cart-form" method="post" id="f">
				<table class="shop_table " style="text-align: center;"
					id="e">
					<thead>
						<tr>
							<th class="table-success">課程照片</th>
							<th class="table-success">課程名稱</th>
							<th class="table-success">課程分類</th>
							<th class="table-success">課程時長</th>
							<th class="table-success">講師</th>
							<th class="table-success">購買人數</th>
							<th class="table-success">價格</th>
							<th class="table-success"><div
									style="vertical-align: middle;">刪除</div></th>
						</tr>
					</thead>
						<tr style="background-color: #DEFFDE">
							<th class="table-success">課程照片</th>
							<th class="table-success">課程名稱</th>
							<th class="table-success">課程分類</th>
							<th class="table-success">課程時長</th>
							<th class="table-success">講師</th>
							<th class="table-success">購買人數</th>
							<th class="table-success">價格</th>
							<th class="table-success"><div
									style="vertical-align: middle;">刪除</div></th>
					<tbody id="cart">
							
							
					</tbody>

				</table>
			</form>
			<table class="table table-striped" style="text-align: center;">
				<tr>
					<td colspan="8" id="buy"></td>


				</tr>
				<tr>
					<td colspan="10">
						<button class="btn btn-danger" id="b" onclick="cartClear()" >清空購物車</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="wayne/cart.js"></script>
</body>
</html>
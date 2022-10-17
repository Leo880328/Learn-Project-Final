<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		border: 1px solid red;
	}
	
	td {
		white-space: nowrap;
 		text-overflow: ellipsis; 
 		width: 50px; 
 		overflow: hidden; 
/* 		display: block;  */
}
</style>

<jsp:include page="BackendHeader2.jsp" />

<script type="text/javascript">
	$(function(){
		
// 		table = $('#data-table').DataTable();
		   
		 
// 		table.destroy();
		 
// 		table = $('#data-table').DataTable( {
// 			 order: [[9, 'desc']],
// 		} );
	})
	
</script>
</head>
<body>
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
						<table id="data-table" class="table table-bordered">
							<thead class="thead-default">
								<tr>

									<th>用戶ID</th>
									<th>日誌主鍵</th>
									<th>日誌類型</th>
									<th>日誌標題</th>
									<th>請求地址</th>
									<th>URI</th>
									<th>請求方式</th>
									<th>提交參數</th>
									<th>異常</th>
									<th>開始時間</th>
									<th>花費時間</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${logs}" var="log">
									
									<tr>
										
										<td>${log.memberBean.name}<c:if test="${log.memberBean.status == 3}">(管理員)</c:if></td>
										<td>${log.logId}</td>
										<td>${log.type}</td>
										<td>${log.title }</td>
										<td>${log.remoteAddr }</td>
										<td>${log.requestUri }</td>
										<td>${log.method }</td>
										<td>${log.params }</td>
										<td>${log.exception }</td>
										<td>${log.operateDate }</td>
										<td>${log.timeout }</td>

									</tr>

								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</section>
	</main>
	<script src="wayne/assets/js/dataTables.buttons.min.js"></script>
	<!-- 	<script src="wayne/assets/js/buttons.flash.min.js"></script> -->
	<script src="wayne/assets/js/buttons.html5.min.js"></script>
	<script src="wayne/assets/js/buttons.print.min.js"></script>
	<!-- 	<script src="wayne/assets/js/buttons.colVis.min.js"></script> -->
</body>
</html>
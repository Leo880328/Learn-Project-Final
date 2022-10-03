<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,fourth.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		
		
		if(${order.voucher != null}){
			$("#newPrice").html("$"+Math.round(${order.totoalprice * order.voucher.discount}))
			$("#bar").css("text-decoration","line-through");
		}
		
		
		$(".coupon").find("a").click(function(){
			num = $(".coupon").find("input").val();
			if(num.trim().length == 0){
				Swal.fire('請輸入優惠卷!')
				return;
			}
			$.ajax({
				async: false,
				type: "GET",
				url: "order/voucher/" + num,
				success: function(data) {
					if(data.status == 0){
						Swal.fire({
							  icon: 'error',
							  text: '此優惠卷已被使用!'
						});
						$(".coupon").find("input").val("");
					}else if(data.length == 0){
						Swal.fire({
							  icon: 'error',
							  text: '找不到此優惠卷!'
						});
						$(".coupon").find("input").val("");
					}else{
						Swal.fire({
							  icon: 'success',
							  title: '優惠卷套用成功!',
							  showConfirmButton: false,
							  timer: 1500
						})
						newPrice = Math.round(${order.totoalprice} * data.discount);
						$("#bar").css("text-decoration","line-through");
						$("#dis").html(data.discount);
						$("#newPrice").html("$"+newPrice);
						$(".coupon").find("input").css( "cursor" , "not-allowed" );
						$(".coupon").find("input").attr("readonly",true);
						$(".coupon").find("a").css( "cursor" , "not-allowed" );
						$("#ecpay").find("input[ name= 'number']").val(num);
						url = "updateOrder/2/${order.orderId}/"+num;
						console.log(url);
						$("#ecpayTest").attr('action',url);
					}
				}
			})
		})
		
	})
	
	function onekey(){
		$.ajax({
			async: false,
			type: "GET",
			url: "order/voucher" ,
			success: function(data) {
				$(".coupon").find("input").val(data.number);
			}
		})
	}
	
	function use(){
		$.ajax({
			async: false,
			type: "GET",
			url: "order/voucher/use" ,
			success: function(data) {
				console.log(data.number);
				$(".coupon").find("input").val(data.number);
			}
		})
	}
 </script>
</head>
<body>
	<div class="container">
				<div class="row justify-content-center">
					<div class="col-8">

						<c:set value="${order}" var="order" />

						<table class="table table-striped">
							<tr>
								<td colspan="8">
									<table class="table mb-0">
										<tr>
											<th>訂單編號</th>
											<th>訂單生成日期</th>
											<th>訂單狀態</th>
										</tr>
										<tr>
											<td>${order.orderId }</td>
											<td>${order.date }</td>
											<td>${order.status.status }</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="8">
									<table class="table mb-0">
										<tr>
											<th>會員帳號</th>
											<th>會員姓名</th>
											<th>會員信箱</th>
											<th>會員手機</th>
										</tr>
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
										<tr>
											<th>商品編號</th>
											<th>商品名稱</th>
											<th>商品數量</th>
											<th>商品價錢</th>
										<tr>
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

						<table class="shop_table">
							<tr>
								<td class="actions"><c:if test="${order.status.id == 1 }">
										<form action="shoppingcart.html" class="cart-form"
											style="width: 70%;" method="post">
											<div class="coupon">
												<label class="coupon_code">優惠碼:</label> <input type="text" 
													class="input-text" placeholder="輸入優惠碼"
													style="border: 1px solid green;"><a href="javascript:;"
													class="button" ></a>
											</div>
										</form>
									</c:if></td>
							</tr>
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
								<td id="bar">$${order.totoalprice }</td>
							</tr>
							<tr>
								<td colspan="7"></td>
								<td></td>
								<td></td>
								<th>折扣</th>
								<td id="dis">${order.voucher.discount }</td>
							</tr>
							<tr>
								<td colspan="7"></td>
								<td></td>
								<td></td>
								<th>合計</th>
								<td id="newPrice">$${order.totoalprice }</td>
							</tr>
						</table>
				<c:if test="${order.status.id != 1}">
					<div style="margin: auto; width: 88px;">
						<form action="orderList" method="GET">
							<button class="btn btn-dark">返回</button>
						</form>

					</div>

				</c:if>
				
				
						<c:if test="${order.status.id == 1}">
<!-- 							//"updateOrder/5/" + orderId -->
							<button class="btn btn-info"  onclick="onekey()">一鍵輸入優惠碼</button>
							<button class="btn btn-info"  onclick="use()">已被使用優惠碼</button>
							<div style="margin: auto; width: 88px;">
							
							
<!-- 								<form action=""  method="POST" id="ecpayTest"> -->
<!-- 									<input type="hidden" name="number"  />  -->
<!-- 									<button class="btn btn-success"  onclick="if( !(confirm('確認付款?') ) ) return false ; ">確認付款</button> -->
<!-- 								</form> -->

								<form action="goEcpay" method="post" id="ecpay">
									<input type="hidden" name="orderID" value="${order.orderId}" />
									<input type="hidden" name="number"  />
									<button class="btn btn-success"  onclick="if( !(confirm('確認付款?') ) ) return false ; ">確認付款</button>
								</form>
								
								
							</div>

						</c:if>

					</div>
				</div>
			</div>
</body>
</html>
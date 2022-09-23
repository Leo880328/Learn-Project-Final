function padTo2Digits(num) {
	return num.toString().padStart(2, '0');
}

function formatDate(date) {
	return (
		[
			date.getFullYear(),
			padTo2Digits(date.getMonth() + 1),
			padTo2Digits(date.getDate()),
		].join('-') +
		' ' +
		[
			padTo2Digits(date.getHours()),
			padTo2Digits(date.getMinutes()),
			padTo2Digits(date.getSeconds()),
		].join(':')
	);
}



function del(id) {
	console.log(id);
	Swal.fire({
		title: '確認刪除' + id + "這筆訂單?",
		text: "",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '刪除!',
		cancelButtonText: '取消',
	}).then((result) => {
		if (result.isConfirmed) {
			Swal.fire(
				'刪除成功!',
				'Your file has been deleted.',
				'success'
			)

			$.ajax({
				async: true,
				type: "DELETE",
				url: "order/" + id,
				success: function(data) {
					$(`#${id}`).remove();
					//					$(".table-responsive").empty();
					//					order();
				}
			})
		}
	})
}



function order(status) {
	$.ajax({
		async: false,
		type: "GET",
		url: "orderListAll",
		success: function(data) {
			if (status == 3) {

				$(".table-responsive").append(`<table id="data-table" class="table table-bordered">
					    <thead class="thead-default">
					        <tr>
					            <th>會員帳號</th>
					            <th>會員姓名</th>
					            <th>會員信箱</th>
					            <th>訂單編號</th>
					            <th>訂單生成日期</th>
					            <th>總數</th>
					            <th>總價</th>
					            <th>訂單狀態</th>
					            <th></th>
					        </tr>
					    </thead>
					    <tbody id="body">
					       
					
					            
					    </tbody>
					</table>`);
				console.log("管理員訂單");
				$.each(data, function(i, n) {
					console.log(n);
					$("#body").append(orderList(n));
					$(`.${n.orderId}`).append(bt);
					if (n.status.id == 2) {
						$(`.${n.orderId}check`).append(check);
					}
				})
			} else {
				console.log("會員訂單");
				$.each(data, function(i, n) {
					memberStatus = n.status.id;
					$("#userbody").append(orderListUser(n));
					if (memberStatus == 1) {
						console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						$(`#${n.orderId}`).append(`<td ><button onclick="del(${n.orderId})" class="btn btn-danger">刪除</button></td>`);
					} else {
						$(`#${n.orderId}`).append(`<td ></td>`);
					}
				})

			}
		}
	})

}


function orderList(order) {
	bt = "";
	check = "";
	if (order.status.id == 1) {
		bt = `<span class="badge badge-secondary" >${order.status.status}</span>`
	};

	if (order.status.id == 2) {
		bt = `<span class="badge badge-success" >${order.status.status}</span>`
		check = `<button class="btn btn-xs btn-success" onclick="checkOrder(${order.orderId})">
	                            <i class="ace-icon fa fa-check bigger-120"></i>
	                        </button>`;
	};
	if (order.status.id == 3) {
		bt = `<span class="badge badge-warning">${order.status.status}</span>`
	};
	if (order.status.id == 4) {
		bt = `<span class="badge badge-primary">${order.status.status}</span>`
	}
	if (order.status.id == 5 || order.status.id==6) {
		console.log("!!!!!!!!!!!!!!!!!");
		bt = `<span class="badge badge-dark">${order.status.status}</span>`
	}

	let data = `
            <tr id="${order.orderId}">
                <td>${order.memberBean.account}</td>
                <td>${order.memberBean.name}</td>
                <td>${order.memberBean.email}</td>
                <td>${order.orderId}</td>
                <td>${formatDate(new Date(order.date))}</td>
                <td>${order.totoalcount}</td>
                <td>$${order.totoalprice}</td>
                <td class="${order.orderId}"  ></td>


                <td>
                    <div class="hidden-sm hidden-xs btn-group">
                    	<div class="${order.orderId}check">
	                        
                        </div>

                        <button class="btn btn-xs btn-info">
                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                        </button>


                        <button class="btn btn-xs btn-danger" onclick="del(${order.orderId})">
                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                        </button>

                        <form action="orderDetail" method="post">
                            <input type="hidden" name="cartID" value="${order.orderId}" />
                            <button class="btn btn-xs btn-warning">
                                <i class="ace-icon fa fa-flag bigger-120"></i>
                            </button>
                        </form>
                    </div>
                </td>
            </tr>`;

	return data;
}
function orderListUser(order) {

	let part = "";
	memberStatus = order.status.id;
	console.log(order.status.id);
	if (memberStatus == 1) {
		part = `<td>
						<form action="orderDetail" method="post">
							<input type="hidden" name="cartID" value="${order.orderId}" />
							<button class="btn btn-success">結帳</button>
						</form>
				</td>`;

	} else if (memberStatus == 2) {
		part = `<td><button id="btn" disabled class="btn btn-secondary">已付款</button></td><td><butto  class="btn btn-info" onclick="backpay()")>退款申請</button></td><form id="audit" action="updateOrder/3/${order.orderId}" method="GET">
	</form>`;

	} else if (memberStatus == 3) {
		part = `<td>
					<button class="btn btn-warning">待審核</button>
				</td>`;

	} else if (memberStatus == 4) {
		part = `<td>
					<form action="orderDetail" method="post">
							<input type="hidden" name="cartID" value="${order.orderId}" />
							<button class="btn btn-primary">詳細</button>
					</form>
				</td>`;

	}
	console.log(part);
	let data = `
            <tr id="${order.orderId}">
				<td>${order.orderId}</td>
				<td>${formatDate(new Date(order.date))}</td>
				<td>${order.totoalcount}</td>
				<td>$${order.totoalprice}</td>
				<td>${order.status.status}</td>` + part + "</tr>";
	


	return data;
}

function backpay() {
	Swal.fire({
		title: '確認申請退款?',
		text: "",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '申請',
		cancelButtonText: '取消'
	}).then((result) => {

		if (result.isConfirmed) {
			$("#audit").submit();
			Swal.fire(
				'申請成功',
				'',
				'success'
			)
		}
	})
}

function checkOrder(orderId) {

	Swal.fire({
		title: '確認是否完成'+orderId+'此訂單?',
		showDenyButton: true,
		showCancelButton: true,
		confirmButtonText: '完成訂單',
		denyButtonText: `退款`,
		cancelButtonText: '取消'
	}).then((result) => {
		/* Read more about isConfirmed, isDenied below */
		if (result.isConfirmed) {
			Swal.fire('完成訂單', '', 'success'),
				$.ajax({
				async: false,
				type: "GET",
				url: "updateOrder/4/"+orderId,
				success: function(data) {
					console.log(data);
				}
			})
		} else if (result.isDenied) {
			Swal.fire({
				icon: 'success',
				title: '退款成功',
				showConfirmButton: false,
				timer: 1500
			})
			Swal.fire('完成訂單', '', 'success'),
				$.ajax({
				async: false,
				type: "GET",
				url: "updateOrder/5/"+orderId,
				success: function(data) {
					console.log(data);
				}
			})
		}
	})
}
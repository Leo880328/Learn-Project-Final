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
		confirmButtonText: '刪除',
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
					$("#body").append(orderList(n));
					orderButton(n);
					$(`.${n.orderId}`).append(bt);

				})
			} else {
				console.log("會員訂單");
				$.each(data, function(i, n) {
					memberStatus = n.status.id;
					$("#userbody").append(orderListUser(n));
					if (memberStatus == 1) {
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


	let data = `
            <tr id="${order.orderId}">
                <td>${order.memberBean.account}</td>
                <td>${order.memberBean.name}</td>
                <td>${order.memberBean.email}</td>
                <td>${order.orderId}</td>
                <td>${formatDate(new Date(order.date))}</td>
                <td>${order.totoalcount}</td>
                <td>$${order.totoalprice}</td>
                <td class="${order.orderId}"></td>


                <td>
                    <div class="hidden-sm hidden-xs btn-group">
                    
	                     <button class="btn btn-xs btn-success" onclick="checkOrder(${order.orderId})" >
	                            <i class="ace-icon fa fa-check bigger-120"></i>
	                     </button>

                      
                            <button class="btn btn-xs btn-warning" onclick="audit(${order.orderId})">
                                <i class="ace-icon fa fa-flag bigger-120"></i>
                            </button>


                        <button class="btn btn-xs btn-danger" onclick="del(${order.orderId})">
                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                        </button>

                        <form action="orderDetail" method="post">
                            <input type="hidden" name="cartID" value="${order.orderId}" />
                              <button class="btn btn-info" data-toggle="tooltip" href="#" title="" data-original-title="Zoom">
                    				<i class="icon-zoom-in"></i>
                  				</button>
                        </form>
                    </div>
                </td>
            </tr>`;

	return data;
}

function orderButton(order) {
	bt = "";

	//未付款
	if (order.status.id == 1) {
		bt = `<span class="badge badge-secondary" >${order.status.status}</span>`
		$(`#${order.orderId}`).find(".btn-success").attr("disabled", true);
		$(`#${order.orderId}`).find(".btn-warning").attr("disabled", true);
	};

	//已付款
	if (order.status.id == 2) {
		bt = `<span class="badge badge-success" >${order.status.status}</span>`
		$(`#${order.orderId}`).find(".btn-warning").attr("disabled", true);
	}
	if (order.status.id == 3) {
		bt = `<span class="badge badge-warning">${order.status.status}</span>`
		$(`#${order.orderId}`).find(".btn-success").attr("disabled", true);
	};
	if (order.status.id == 4) {
		bt = `<span class="badge badge-primary">${order.status.status}</span>`
		$(`#${order.orderId}`).find(".btn-success").attr("disabled", true);
		$(`#${order.orderId}`).find(".btn-warning").attr("disabled", true);
	}
	if (order.status.id == 5 || order.status.id == 6) {
		bt = `<span class="badge badge-dark">${order.status.status}</span>`
		$(`#${order.orderId}`).find(".btn-success").attr("disabled", true);
		$(`#${order.orderId}`).find(".btn-warning").attr("disabled", true);
	}
}
function orderListUser(order) {

	part = "";
	memberStatus = order.status.id;
	if (memberStatus == 1) {
		part = `<td>
						<form action="orderDetail" method="post">
							<input type="hidden" name="cartID" value="${order.orderId}" />
							<button class="btn btn-success">結帳</button>
						</form>
				</td>`;

	} else if (memberStatus == 2) {
		part = `<td><button id="btn" disabled class="btn btn-secondary">已付款</button></td><td><butto  class="btn btn-info" onclick="backpay(${order.orderId})")>退款申請</button></td>">
	</form>`;

	} else if (memberStatus == 3) {
		part = `<td >
					<button type="button" class="btn btn-warning">${order.status.status}</button>
				</td>`;

	} else if (memberStatus == 4) {
		part = `<td>
					<form action="orderDetail" method="post">
							<input type="hidden" name="cartID" value="${order.orderId}" />
							<button class="btn btn-primary">詳細</button>
					</form>
				</td>`;

	} else if (memberStatus == 5 || memberStatus == 6) {
		part = `<td>
					<button type="button" class="btn btn-info">${order.status.status}</button>
				</td>`;

	}
	let data = `
            <tr id="${order.orderId}">
				<td>${order.orderId}</td>
				<td>${formatDate(new Date(order.date))}</td>
				<td>${order.totoalcount}</td>
				<td>$${order.totoalprice}</td>
				<td>${order.status.status}</td>` + part + "</tr>";



	return data;
}

function backpay(orderId) {
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
			//			$("#audit").submit();
			Swal.fire(
				'申請成功',
				'',
				'success'
			)
			$.ajax({
				async: false,
				type: "GET",
				url: "updateOrder/3/" + orderId,
				success: function(data) {
					$(`#${orderId}`).empty();
					var order = orderUser(orderId);
					orderListUser(order);
					$(`#${orderId}`).append(`<td>${order.orderId}</td>
											<td>${formatDate(new Date(order.date))}</td>
											<td>${order.totoalcount}</td>
											<td>$${order.totoalprice}</td>
											<td>${order.status.status}</td>` + part);
				}
			})
		}
	})
}

function checkOrder(orderId) {

	Swal.fire({
		title: '確認是否完成' + orderId + '此訂單?',
		showDenyButton: true,
		showCancelButton: true,
		confirmButtonText: '完成訂單',
		denyButtonText: `退款`,
		cancelButtonText: '取消'
	}).then((result) => {
		/* Read more about isConfirmed, isDenied below */
		if (result.isConfirmed) {
			Swal.fire('完成訂單', '', 'success');
			$.ajax({
				async: false,
				type: "GET",
				url: "updateOrder/4/" + orderId,
				success: function(data) {
					$(`#${orderId}`).empty();
					console.log(bt);
					$(`#${orderId}`).append(orderAdminContent(orderUser(orderId)));
					orderButton(orderUser(orderId));
					$(`.${orderId}`).append(bt);
				}
			})
		} else if (result.isDenied) {
			Swal.fire('退款成功', '', 'success')
			$.ajax({
				async: true,
				type: "GET",
				url: "updateOrder/5/" + orderId,
				success: function(data) {
					$(`#${orderId}`).empty();
					$(`#${orderId}`).append(orderAdminContent(orderUser(orderId)));
					orderButton(orderUser(orderId));
					$(`.${orderId}`).append(bt);
				}
			})
		}
	})
}

function orderUser(orderId) {
	var order;
	$.ajax({
		async: false,
		type: "GET",
		url: "order/" + orderId,
		success: function(data) {
			order = data;
			console.log(data);
		}
	})
	return order;
}


function orderAdminContent(order) {
	var data = `<td>${order.memberBean.account}</td>
                <td>${order.memberBean.name}</td>
                <td>${order.memberBean.email}</td>
                <td>${order.orderId}</td>
                <td>${formatDate(new Date(order.date))}</td>
                <td>${order.totoalcount}</td>
                <td>$${order.totoalprice}</td>
                <td class="${order.orderId}"></td>


                <td>
                    <div class="hidden-sm hidden-xs btn-group">
                    	
	                     <button class="btn btn-xs btn-success" onclick="checkOrder(${order.orderId})" >
	                            <i class="ace-icon fa fa-check bigger-120"></i>
	                     </button>

                         <button class="btn btn-xs btn-warning">
                                <i class="ace-icon fa fa-flag bigger-120"></i>
                            </button>


                        <button class="btn btn-xs btn-danger" onclick="del(${order.orderId})">
                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                        </button>

                        <form action="orderDetail" method="post">
                            <input type="hidden" name="cartID" value="${order.orderId}" />
                              <button class="btn btn-info" data-toggle="tooltip" href="#" title="" data-original-title="Zoom">
                    				<i class="icon-zoom-in"></i>
                  				</button>
                        </form>
                    </div>
                </td>`;
	return data;
}

function audit(orderId) {
	Swal.fire({
		title: '此訂單' + orderId + '正在申請退款請審核確認是否通過?',
		showDenyButton: true,
		showCancelButton: true,
		confirmButtonText: '退款',
		denyButtonText: '駁回',
		cancelButtonText: '取消'
	}).then((result) => {
		/* Read more about isConfirmed, isDenied below */
		if (result.isConfirmed) {
			Swal.fire('已退款', '', 'success');
			$.ajax({
				async: true,
				type: "GET",
				url: "updateOrder/5/" + orderId,
				success: function(data) {
					$(`#${orderId}`).empty();
					$(`#${orderId}`).append(orderAdminContent(orderUser(orderId)));
					orderButton(orderUser(orderId));
					$(`.${orderId}`).append(bt);
				}
			})
		} else if (result.isDenied) {
			Swal.fire('已駁回', '', 'success');
			$.ajax({
				async: true,
				type: "GET",
				url: "updateOrder/6/" + orderId,
				success: function(data) {
					$(`#${orderId}`).empty();
					$(`#${orderId}`).append(orderAdminContent(orderUser(orderId)));
					orderButton(orderUser(orderId));
					$(`.${orderId}`).append(bt);
				}
			})
		}
	})

}


function selectStatus(e) {

	let st = $(e).val();
	console.log(st);

	$.ajax({
		async: false,
		type: "GET",
		url: "searchStatus/" + st,
		success: function(data) {
			console.log(data);
			$("#not").remove();
			$("#userbody").empty();
			if (data.length == 0) {
				console.log($("#userOutBody"));
				$("#userOutBody").append(`<div style="border: 1px solid #ddd" id="not">
								<div style="width: 100px; margin: auto;" >尚無訂單!!!</div>
								</div>
							`);
			}
			$.each(data, function(i, n) {
				memberStatus = n.status.id;
				$("#userbody").append(orderListUser(n));
				if (memberStatus == 1) {
					$(`#${n.orderId}`).append(`<td ><button onclick="del(${n.orderId})" class="btn btn-danger">刪除</button></td>`);
				} else {
					$(`#${n.orderId}`).append(`<td ></td>`);
				}

			})
		}
	})
}
function htmlToPdf() {
	//	var doc = new jsPDF();
	//	doc.fromHTML(document.getElementById("pdfTransfer"),
	//		15,
	//		15,
	//		{ 'width': 170 },
	//		function() {
	//			doc.addFont('SourceHanSans-Normal.ttf', 'SourceHanSans-Normal', 'normal');
	//			doc.setFont('SourceHanSans-Normal');
	//			doc.save("PDF_Documet.pdf");
	//		});
//	doc = window.jspdf.jsPDF;
	//	var doc = new jsPDF();
	var doc = new jsPDF('p', 'pt', 'letter');
	var htmlstring = '';
	var tempVarToCheckPageHeight = 0;
	var pageHeight = 0;
	pageHeight = doc.internal.pageSize.height;
	specialElementHandlers = {
		// element with id of "bypass" - jQuery style selector  
		'#bypassme': function(element, renderer) {
			// true = "handled elsewhere, bypass text extraction"  
			return true
		}
	};
	margins = {
		top: 10,
		bottom: 60,
		left: 40,
		right: 40,
		width: 600
	};
	var y = 20;
	doc.setFont('SourceHanSansCN-Bold', 'normal');
	doc.setLineWidth(2);
	doc.autoTable({
		html: '#data-table',
		startY: 70,
		theme: 'grid',
		columnStyles: {
			0: {
				cellWidth: 80,
			},
			1: {
				cellWidth: 80,
			},
			2: {
				cellWidth: 80,
			}
		},
		styles: {
			minCellHeight: 10,
			font: 'SourceHanSansCN-Bold',
            fontStyle: 'normal',
		},
		headerStyles: {
				font: 'SourceHanSansCN-Bold',
				fontStyle: 'normal'
		},
		tableWidth: 'wrap',
		
		margin: {left:10, right:150}
	})
	doc.save('Marks_Of_Students.pdf');
}
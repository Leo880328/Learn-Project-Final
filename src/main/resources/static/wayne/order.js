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
				async: false,
				type: "DELETE",
				url: "order/" + id,
				success: function(data) {
					if (pageStatus == 1) {
						count = statusCount(1);
						$("#count").html(count);
						currentpage = $('.current').html();
						order(pageStatus, currentpage)

					} else {
						$(`#${id}`).remove();
					}
				}
			})
		}
	})
}



function order(status, currentpage) {
	pageStatus = status;
	selectPage = currentpage;
	if (selectStatusFun == "select") {
		selectStatus(st);
		return;
	}

	$.ajax({
		async: false,
		type: "GET",
		url: "orderListAll",
		success: function(data) {
			count = data.length;
			$("#count").html(count);
			if (status == 3) {

				$(".table-responsive").append(`<table id="data-table" class="table table-bordered">
					    <thead class="thead-default">
					        <tr>
					            <th>訂單編號</th>
					            <th>會員帳號</th>
					            <th>會員姓名</th>
					            <th>會員信箱</th>
					            <th>訂單生成日期</th>
					            <th>總數</th>
					            <th>優惠碼</th>
					            <th>訂單金額</th>
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
				$("#userbody").empty();
				console.log("會員訂單");
				userData = data;
				initpage = (currentpage - 1) * 4;
				if (currentpage == 1) {
					initpage = 0;
				}
				counti = 1;
				for (var i = initpage; i < data.length; i++) {
					memberStatus = data[i].status.id;
					$("#userbody").append(`<div id="${data[i].orderId}" class="or">` + orderListUser(data[i]) + `</div>`);
					if (counti == 4) {
						break;
					}
					counti++;
				}
				$("#foot").remove();
				$("#row").append(page(currentpage));
				if (currentpage == 1) {
					$(".left").css("visibility", "hidden");
				} else {
					$(".left").css("visibility", "visible");
				}
				if (currentpage == len) {
					$(".right").css("visibility", "hidden");
				} else {
					$(".right").css("visibility", "visible");
				}
				var c = $("#count").html();
				if (c == "0") {
					$(".left").css("visibility", "hidden");
					$(".right").css("visibility", "hidden");
				}


				//				$.each(data, function(i, n) {
				//					memberStatus = n.status.id;
				//					$("#userbody").append(`<div id="${n.orderId}" class="or">` + orderListUser(n) + `</div>`);
				//					
				//				})
			}
		}
	})

}


function page(currentpage) {

	pagecount = "";
	len = Math.floor(userData.length / 4);
	if (userData.length % 4 != 0) {
		len++;
	}
	k = Math.floor(currentpage / 5) * 5 + 1;
	if (currentpage % 5 == 0) {
		k = currentpage - 4;
	}
	last = k + 4;
	if (k + 4 >= len) {
		last = len;
	}
	for (i = k; i <= last; i++) {
		if (i == currentpage) {
			pagecount += `<a href="javascript:;" class="page-numbers current">` + i + `</a>`
		} else {

			pagecount += `<a href="javascript:;" class="page-numbers" onclick="order(${pageStatus},${i})">` + i + `</a>`
		}
	}

	pagecontent = `<div class="pagination clearfix style2" id="foot" style="margin-bottom: 100px" >
						<div class="nav-link" style="display: inline-block;">
					<a href="javascript:;" class="page-numbers left" onclick="order(${pageStatus},${currentpage - 1})"  ><i
						class="icon fa fa-angle-left" aria-hidden="true" ></i></a>
						
						
						`+ pagecount + `
						
						<a href="javascript:;" class="page-numbers right"  onclick="order(${pageStatus},${currentpage + 1})"><i class="icon fa fa-angle-right"
						aria-hidden="true" ></i></a>
				</div>
				<h5 style="display: inline-block;margin-left: 30px">
				共<span>`+ len + `</span>頁
			</h5>
			</div> `

	return pagecontent;
}

function orderList(order) {


	var sum = order.totoalprice;

	var num = '無';

	if (order.voucher != null) {
		num = order.voucher.number;
		sum = Math.round(order.totoalprice * order.voucher.discount);
	}



	let data = `
            <tr id="${order.orderId}">
                <td>${order.orderId}</td>
                <td>${order.memberBean.account}</td>
                <td>${order.memberBean.name}</td>
                <td>${order.memberBean.email}</td>
                <td>${formatDate(new Date(order.date))}</td>
                <td>${order.totoalcount}</td>

                <td>${num}</td>
                <td>$${sum}</td>

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
		$(`#${order.orderId}`).find(".btn-success").remove();
		$(`#${order.orderId}`).find(".btn-warning").remove();
	};

	//已付款
	if (order.status.id == 2) {
		bt = `<span class="badge badge-success" >${order.status.status}</span>`
		$(`#${order.orderId}`).find(".btn-warning").remove();
	}
	if (order.status.id == 3) {
		bt = `<span class="badge badge-warning">${order.status.status}</span>`
		$(`#${order.orderId}`).find(".btn-success").remove();
	};
	if (order.status.id == 4) {
		bt = `<span class="badge badge-primary">${order.status.status}</span>`
		$(`#${order.orderId}`).find(".btn-success").remove();
		$(`#${order.orderId}`).find(".btn-warning").remove();
	}
	if (order.status.id == 5 || order.status.id == 6) {
		bt = `<span class="badge badge-dark">${order.status.status}</span>`
		$(`#${order.orderId}`).find(".btn-success").remove();
		$(`#${order.orderId}`).find(".btn-warning").remove();
	}
}
function orderListUser(order) {


	var num = '無';
	var sum = order.totoalprice;

	if (order.voucher != null) {
		num = order.voucher.number;
		sum = Math.round(order.totoalprice * order.voucher.discount);
	}

	part = "";
	userStatus = "";

	memberStatus = order.status.id;
	if (memberStatus == 1) {
		part = `<form action="orderDetail" method="post" style="display: inline-block;">
					<input type="hidden" name="cartID" value="${order.orderId}" />
					<button class="btn btn-success" style="margin-left: 25px; border-radius: 100px">結帳</button>
				</form>
				<button onclick="del(${order.orderId})" class="btn btn-danger" style="margin-left: 25px; border-radius: 100px">刪除</button>`;
		userStatus = `<div style="padding: 10px;margin-left:20px" >
												<span class="badge rounded-pill bg-secondary"
													style="font-size: 15px;">${order.status.status}</span>
											</div>`;

	} else if (memberStatus == 2) {
		part = `<form action="orderDetail" method="post" style="display: inline-block;">
											<input type="hidden" name="cartID" value="${order.orderId}" />
											<button class="btn btn-primary" style="margin-left: 25px; border-radius: 100px">詳細</button>
									</form><button  class="btn btn-info" onclick="backpay(${order.orderId})" style="margin-left: 25px; border-radius: 100px">退款申請</button>`;
		userStatus = `<div style="padding: 10px;margin-left:20px" >
												<span class="badge rounded-pill bg-success"
													style="font-size: 15px;">${order.status.status}</span>
											</div>`;

	} else if (memberStatus == 3) {
		part = `<form action="orderDetail" method="post" style="display: inline-block;">
											<input type="hidden" name="cartID" value="${order.orderId}" />
											<button class="btn btn-primary" style="margin-left: 25px; border-radius: 100px">詳細</button>
									</form>`;
		userStatus = `<div style="padding: 10px;margin-left:20px" >
												<span class="badge rounded-pill bg-warning text-dark"
													style="font-size: 15px;">${order.status.status}</span>
											</div>`;

	} else if (memberStatus == 4) {
		part = `<form action="orderDetail" method="post" style="display: inline-block;">
											<input type="hidden" name="cartID" value="${order.orderId}" />
											<button class="btn btn-primary" style="margin-left: 25px; border-radius: 100px">詳細</button>
									</form>`;
		userStatus = `<div style="padding: 10px;margin-left:20px">
												<span class="badge rounded-pill bg-primary"
													style="font-size: 15px;">${order.status.status}</span>
											</div>`;

	} else if (memberStatus == 5 || memberStatus == 6) {
		part = `<form action="orderDetail" method="post" style="display: inline-block;">
											<input type="hidden" name="cartID" value="${order.orderId}" />
											<button class="btn btn-primary" style="margin-left: 25px; border-radius: 100px">詳細</button>
									</form>`;
		userStatus = `<div style="padding:10px;margin-left:20px" >
												<span class="badge rounded-pill bg-dark"
													style="font-size: 15px;">${order.status.status}</span>
											</div>`;

	}

	content = `
					<div style="background-color: #DEFFDE">
							訂單編號:<span style="padding-left:10px">  ${order.orderId}</span>
						</div>
						<ul
							class="row list-products auto-clear equal-container product-list">

							<li
								class="product-item style-list col-lg-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-ts-12">
								<div class="product-inner equal-element">

									<div class="products-bottom-content">

										<div class="product-info-left" style="padding-top: 10px">

											<div>
												<ul class="product-attributes"
													style="display: inline-block; width: 300px">
													<li>訂單生成日期:</li>
													<li>${formatDate(new Date(order.date))}</li>

												</ul>
												<ul class="attributes-display"
													style="display: inline-block;">
													<li class="swatch-color">購買數量:</li>
													<li class="swatch-color">${order.totoalcount}</li>

												</ul>
											</div>
											<div>
												<ul class="attributes-display"
													style="display: inline-block; width: 300px">
													<li class="swatch-text-label">優惠碼:</li>
													<li class="swatch-text-label">${num}</li>

												</ul>
												<ul class="attributes-display"
													style="display: inline-block;">
													<li class="swatch-text-label">付款方式:</li>
													<li class="swatch-text-label">線上支付</li>

												</ul>
											</div>

										</div>

										<div class="product-info-right" style="height: 60px;padding-top: 15px;width:200px">`
		+ userStatus +
		`</div>
									</div>
									<hr style="border: 1px solid;">
									<div>
									`
		+ part +
		`</div>
									<div style="display: inline-block; margin-left: 650px;">
										訂單金額：<span class="text-md strongfont text-primary">$${sum}</span>
									</div>
								</div>
							</li>
						</ul>
					
            `;

	return content;
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
					//					$(`#${orderId}`).empty();
					//
					//					var order = orderUser(orderId);
					//					var num = '無';
					//					var sum = order.totoalprice;
					//					if (order.voucher != null) {
					//						num = order.voucher.number;
					//						sum = Math.round(order.totoalprice * order.voucher.discount);
					//					}
					//					console.log($(`#${orderId}`));
					//					$(`#${orderId}`).append(orderListUser(order));
					//					count = statusCount(2);
					//					$("#count").html(count);

					if (pageStatus == 1) {
						count = statusCount(1);
						$("#count").html(count);
						currentpage = $('.current').html();
						order(pageStatus, currentpage)

					}

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

	var sum = order.totoalprice;

	var num = '無';

	if (order.voucher != null) {
		num = order.voucher.number;
		sum = Math.round(order.totoalprice * order.voucher.discount);
	}

	var data = `<td>${order.orderId}</td>
				<td>${order.memberBean.account}</td>
                <td>${order.memberBean.name}</td>
                <td>${order.memberBean.email}</td>
                <td>${formatDate(new Date(order.date))}</td>
                <td>${order.totoalcount}</td>

                <td>${num}</td>
                <td>$${sum}</td>

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

	selectStatusFun = "select";

	if ($(e).val() != st && typeof ($(e).val()) != "undefined") {
		st = $(e).val();
		selectPage = 1;
	}

	$.ajax({
		async: false,
		type: "GET",
		url: "searchStatus/" + st,
		success: function(data) {
			count = data.length;
			$("#count").html(count);

			$("#not").remove();
			$("#userbody").empty();
			if (data.length == 0) {

				$("#userOutBody").append(`<div style="border: 1px solid #ddd" id="not">
								<div style="width: 100px; margin: auto;" >尚無訂單!!!</div>
								</div>
							`);
			}

			userData = data;
			initpage = (selectPage - 1) * 4;
			if (selectPage == 1) {
				initpage = 0;
			}
			counti = 1;
			for (var i = initpage; i < data.length; i++) {
				memberStatus = data[i].status.id;
				$("#userbody").append(`<div id="${data[i].orderId}" class="or">` + orderListUser(data[i]) + `</div>`);
				if (counti == 4) {
					break;
				}
				counti++;
			}
			$("#foot").remove();
			$("#row").append(page(selectPage));
			console.log("當前頁面: " + selectPage);
			console.log("資料長度: " + len);
			if (selectPage == 1) {
				$(".left").css("visibility", "hidden");
			} else {
				$(".left").css("visibility", "visible");
			}
			if (selectPage == len) {
				$(".right").css("visibility", "hidden");
			} else {
				$(".right").css("visibility", "visible");
			}
			var c = $("#count").html();
			if (c == "0") {
				$(".left").css("visibility", "hidden");
				$(".right").css("visibility", "hidden");
			}

			//			$.each(data, function(i, n) {
			//				memberStatus = n.status.id;
			//				$("#userbody").append(`<div id="${n.orderId}" class="or">` + orderListUser(n) + `</div>`);
			//			})
		}
	})
}

function statusCount(status) {

	currentStatus = "";

	$.ajax({
		async: false,
		type: "GET",
		url: "searchStatus/" + status,
		success: function(data) {
			currentStatus = data.length;
		}
	})
	return currentStatus;
}

function htmlToPdf() {

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
				cellWidth: 110,
			},
			1: {
				cellWidth: 73,
			},
			2: {
				cellWidth: 55,

			},
			6: {
				cellWidth: 50,

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

		margin: { left: 0, right: 200 }

	})
	doc.save('好學生 訂單資料.pdf');
}
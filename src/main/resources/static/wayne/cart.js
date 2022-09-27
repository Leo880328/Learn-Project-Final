

function cartList() {
	$.ajax({
		async: true,
		type: "GET",
		url: "cartAll",
		success: function(data) {

			total = 0;
			$.each(data, function(i, n) {
				$("#cart").append(cart(n))
				total += n.courseBean.course_price;
			});
			cartTotal();
			$("#e").append(` 
			        
			        <tr>
			            <td colspan="8" id="clear"></td>
			
			        </tr>
			    
			        <td colspan="8"><a href="coursefront1.list" style="color: red"><input type="hidden" name="return"
			                value="前往探索更多課程~">前往探索更多課程~</a></td>
			        <tr>
			        
			        <td colspan="7"></td>
			            <th id="total">總金額: $${total}</th>
			        </tr>   `)
		}
	})
}


function cart(cart) {
	
	let data = `
        <tr id="${cart.id}">
            <td><img src="${cart.courseBean.course_picture}" alt=""
                title="" width="150" height="100"></td>
            <td style="vertical-align: middle;">${cart.itemName}</td>
            <td style="vertical-align: middle;">${cart.courseBean.coursesub.subject_name}</td>
            <td style="vertical-align: middle;">${cart.courseBean.course_duration}</td>
            <td style="vertical-align: middle;">${cart.courseBean.lecturer_name}</td>
            <td style="vertical-align: middle;">${cart.courseBean.enrollment}</td>
            <td style="vertical-align: middle;">$${cart.courseBean.course_price}</td>
            
            <td class="product-remove" style="vertical-align: middle;"><a
                href="javascript:;" class="remove" onclick="del(${cart.id})"></a></td>

        </tr>
    `
	//    console.log(data)
	return data;
}


function del(id) {

	$.ajax({
		async: true,
		type: "DELETE",
		url: "cart/" + id,
		success: function(data) {
			$(`#${id}`).remove();
			cartTotal();
		}
	})
}

function add(id) {
	Swal.fire({

		icon: 'success',
		title: '加入成功!',
		showConfirmButton: false,
		timer: 1500
	})
	$.ajax({
		async: false,
		type: "POST",
		url: "cartadd/" + id,
		success: function(data) {
			console.log(data);
		}
	})
	myFunction();
}

function cartTotal() {
	$.ajax({
		async: true,
		type: "GET",
		url: "cartAll",
		success: function(data) {
			list = "";
			if (data.length == 0) {
				list = "目前購物車沒有資料!!!";
			}
			total = 0;
			$.each(data, function(i, n) {
				total += n.courseBean.course_price;
			});
			$("#msg").html(data.length);
			$("#total").html(`總金額: $${total}`);
			$("#clear").html(list);
			$("#b").val(total);
			$("#buy").empty();
			if (total != 0) {
				$("#buy").append(`<button class="btn btn-success" onclick="buyCheck()">確認購買</button>`);
			}
		}
	})
}

function cartClear() {
	money = $("#b").val();
	if (money == 0) {
		Swal.fire('購物車內尚無商品!');
	} else {
		Swal.fire({
			title: '確認清空購物車?',
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
					type: "POST",
					url: "cart/clearCart",
					success: function(data) {
						$("#cart").empty();
						cartTotal();
					}
				})
			}
		})
	}
}


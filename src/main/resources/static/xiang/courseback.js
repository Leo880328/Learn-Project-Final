function del(id) {
	console.log(id);
	Swal.fire({
		title: '確認刪除課程?"',
		text: "",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#d33',
		cancelButtonColor: '#3085d6',
		confirmButtonText: '刪除',
		cancelButtonText: '取消',
	}).then((result) => {
		if (result.isConfirmed) {
			Swal.fire({
				title: '刪除成功!',
				willClose: function () {
					$.ajax({
						async: true,
						type: "get",
						url: "course.delete/" + id,
						success: function (data) {
							$(`#${id}`).remove();
							window.location.assign(window.location.href);
							// 					history.go(0);
						}
					})
				}
			})
		}
	})
}


function checkAdd() {

	Swal.fire({
		title: '確定要新增課程?"',
		text: "",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '確定',
		cancelButtonText: '取消',
	}).then((result) => {
		if (result.isConfirmed) {
			Swal.fire({
				title: '新增完成 ! 請等待管理員審核',
				willClose: function () {
					console.log($('.cfi'));
                   $('.cfi').submit();
				}
			})
		}
	})
}

function checkUpdate() {

	Swal.fire({
		title: '確定要修改?"',
		text: "",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '確定',
		cancelButtonText: '取消',
	}).then((result) => {
		if (result.isConfirmed) {
			Swal.fire({
				title: '修改完成 ! ',
				willClose: function () {
					$('.cfu').submit();
				}
			})
		}
	})
}



//function checkUpdate() {
//
//	Swal.fire({
//		icon: 'error',
//		title: 'Oops...',
//		text: 'Something went wrong!',
//		willClose: function () {
//			console.log($('.cfi'));
//			$('.cfu').submit();
//		}
//	})
//}

function add() {
	var c = {}
	c.id = $('#user_id').val();
	c.cname = $('#course_name').val();
	c.sid = $('#subject_id').val();
	c.eid = $('#education_id').val();
	c.intro = $('#course_introduction').val();
	c.price = $('#course_price').val();
	c.duration = $('#course_duration').val();
	c.enroll = $('enrollment').val();
	c.status = $('#course_status').val();
	c.date = $('#course_date').val();
	c.lname = $('lecturer_name').val();
	c.email = $('#lecturer_email').val();
	c.picture = $('#course_picture').val();
	var cJSON = JSON.stringify(c);
	Swal.fire({

		icon: 'success',
		title: '新增成功!',
		showConfirmButton: false,
		timer: 1500
	})
	$.ajax({
		async: false,
		type: "POST",
		url: "course.insert",
		contentType: 'application/json;charset=UTF-8',
		data: cJSON,
		success: function (data) {
			console.log(data);
			history.back();
		}
	})
	//	myFunction();
}


$(function () {
	$('#correct').click(function () {
		$('#user_id').val("2");
		$('#course_name').val("敬評教英文");
		$('#subject_id').val("2");
		$('#education_id').val("3");
		$('#course_introduction').val("我們鼓勵每位學員上網進行教師評比，藉由獨家研發的「即時教師評鑑系統」，教務團隊即時連線，隨時掌握課堂教學狀況與成效，透過學生的進步率與教學風格評價，隨時調整授課方向與教學互動。學生可以從教師教學風格中找到適合的老師，也能透過學員的意見讓我們更瞭解教師們的實際授課情況，提升整體教學品質。");
		$('#course_price').val("487.00");
		$('#course_duration').val("36小時8分");
		$('#course_date').val("2022-06-04");
		$('#lecturer_name').val("敬評");
		$('#lecturer_email').val("winniepooh@gmail.com");
	})
})
function del(id) {
	console.log(id);
	Swal.fire({
		title: '確認刪除文章?"',
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
						type: "delete",
						url: "ColumnDelete/" + id,
						success: function (data) {
							$(`#${id}`).remove();
							window.location.assign(window.location.href);
							//							 					history.go(0);
						}
					})
				}
			})
		}
	})
}

function del1(id) {
	console.log(id);
	Swal.fire({
		title: '確認刪除文章?"',
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
						type: "delete",
						url: "ColumnDelete1/" + id,
						success: function (data) {
							$(`#${id}`).remove();
							window.location.assign(window.location.href);
							//							 					history.go(0);
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
				title: '新增完成 ! ',
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
		$('#date').val("2022-10-14");
		$('#title').val("My Wonderful Family");
		$('#user_id').val("1");
		$('#author').val("Winnie");
		$('#role').val("管理者");
		$('#subject').val("英文");
		$('#summary').val("A1 Level Simple Present Tense");
		$('#editor').val("測試");
	})
})

$(function () {
	$('#correct1').click(function () {
		$('#date').val("2022-10-14");
		$('#title').val("A Great Summer Vacation");
		$('#user_id').val("1");
		$('#author').val("Winnie");
		$('#role').val("老師");
		$('#subject').val("英文");
		$('#summary').val("A2 Level Simple Past");
		$('#editor').val("測試");
	})
})

function changeVal(commentid) {
	let inputValue = $(".updatearea" + commentid).html();

	Swal.fire({
		input: 'textarea',
		title:'請輸入修改內容',
//		heightAuto: false,
		width: "500px",
		height: "350px",
		customClass: {
			popup: "swal-popup-changeVal",
			input: 'swal-textarea-1',		
		},
		inputValue: inputValue,
		inputPlaceholder: '請輸入內容',
		showClass:{
			
		},



		inputValidator: (value) => {
			$(".updatearea" + commentid).html(value);

			let comment = {
				id: commentid,
				comments: value
			}

			$.ajax({
				url: "updatecomment",
				method: "POST",
				dataType: "JSON",
				contentType: 'application/json; charset=utf-8',
				data: JSON.stringify(comment),
				success: function (res) {
					Swal.fire({
						icon: 'success',
						title: '更改成功',
					})
				},
				error: function (err) {
					Swal.fire({
						icon: 'error',
						title: '上傳失敗',
						text: err
					})
				},
			});
		},
		showCancelButton: true
	})
}
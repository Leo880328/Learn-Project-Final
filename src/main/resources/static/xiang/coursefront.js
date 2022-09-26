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

function checkUpdate() {

	Swal.fire({
		title: '確定要重新送交管理員審核?"',
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
				title: '送出成功 ! 請等候管理員審核 ',
				willClose: function () {
					$('.cfu').submit();
				}
			})
		}
	})
}
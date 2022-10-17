function commentsAdd() {

	Swal.fire({
		title: '確定要發布評論?"',
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
				title: '發布成功 !  ',
				icon: 'success',
				willClose: function () {
					$('.cmf').submit();
				}
			})
		}
	})
}

function commentsDel(id) {
	console.log(id);
	Swal.fire({
		title: '確認刪除評論?"',
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
				icon: 'success',
				willClose: function () {
					$.ajax({
						async: true,
						type: "DELETE",
						url: "http://localhost:8080/HappyLearning/coursecomments.del/" + id,
						success: function (data) {
							$(`#${id}`).remove();
//							window.location.assign(window.location.href);
							 					history.go(0);
						}
					})
				}
			})
		}
	})
}

function aaaa() {
	if ($(".comm").val() != "") {
		$(".make").css({ "background-color": "#65A15A" })
		$(".make").attr({ "disabled": false })
	} else {
		$(".make").css({ "background-color": "#E0E0E0" })
		$(".make").attr({ "disabled": true })
	}
}



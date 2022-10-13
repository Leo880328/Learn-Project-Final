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
				icon: 'success',
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
$().ready(
	function () {
		getCourseId();
		haveCollect();
	}
)
let course = {
	courseId: null
}
function getCourseId() {
	let idIndexOf = window.location.href.indexOf('=');
	course.courseId = window.location.href.substring(idIndexOf + 1);
}


function haveCollect() {
	$.ajax({

		type: "POST",
		url: "haveCollect",
		contentType: 'application/json; charset=utf-8',
		data: JSON.stringify(course),
		success: function (data) {
			console.log(data)
			if (data) {
				$(`.collect`).html(`
				<div class="yith-wcwl-add-button addcollect"onclick="delCollect(${course.courseId})">
				<i class="fa-solid fa-heart" style="font-size: 1.5em;color:#FF79BC"> 已加入收藏</i></div>
				`)
			} else {
				$(`.collect`).html(`
			<div class="yith-wcwl-add-button addcollect"onclick="addcollect(${course.courseId})">
			<i class=" fa-regular fa-heart" style="font-size: 1.5em"> 加入收藏</i></div>
			`)

			}

			// 					history.go(0);
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
				icon: 'success',
				willClose: function () {
					$('.cfu').submit();
				}
			})
		}
	})
}


function addcollect(id) {
	Swal.fire({

		icon: 'success',
		title: '已加入收藏!',
		showConfirmButton: false,
		timer: 1500
	})
	$.ajax({
		async: false,
		type: "POST",
		url: "coursefront.cadd/" + id,
		success: function (data) {
			console.log(data);
		}
	}).then(function () {
		$(".collect").html(`<div class="yith-wcwl-add-button addcollect"onclick="delCollect(${course.courseId})">
		<i class="fa-solid fa-heart"  style="font-size: 1.5em;color:#FF79BC"> 已加入收藏</i></div>`)
	})
}

function delCollect(id) {
	Swal.fire({

		icon: 'success',
		title: '已取消收藏!',
		showConfirmButton: false,
		timer: 1500
	})
	$.ajax({
		async: false,
		type: "DELETE",
		url: "coursefront.cdelete/" + id,
		success: function (data) {
			console.log(data);
			$(`#${id}`).remove();
		}
	}).then(function () {
		$(".collect").html(`<div class="yith-wcwl-add-button addcollect"onclick="addcollect(${course.courseId})">
		<i class=" fa-regular fa-heart"  style="font-size: 1.5em"> 加入收藏</i></div>`)
	})
}

function delCollectById(id) {
	console.log(id);
	Swal.fire({

		icon: 'success',
		title: '已取消收藏!',
		//		showConfirmButton: false,
		//		timer: 1500

		willClose: function () {
			$.ajax({
				async: false,
				type: "DELETE",
				url: "coursefront.ciddelete/" + id,
				success: function (data) {
					console.log(data);
					$(`#${id}`).remove();
					window.location.assign(window.location.href);
				}
			})
		}
	})
}


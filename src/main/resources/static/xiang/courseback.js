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
		title: '確定審核結果?"',
		text: "",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '確定',
		cancelButtonText: '取消',
	}).then((result) => {
		//		if (result.isConfirmed) {
		if ($('#course_status').val() == "2") {
			Swal.fire({
				title: '已將審核通過email寄送至講師信箱 ! ',
				icon: 'success',
				willClose: function () {
					$('.cfu').submit();
				}
				//				}
			})
		}
	})
}




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
		$('#course_name').val("英文");
		$('#subject_id').val("2");
		$('#education_id').val("3");
		$('#course_introduction').val("我們鼓勵每位學員上網進行教師評比，藉由獨家研發的「即時教師評鑑系統」，教務團隊即時連線，隨時掌握課堂教學狀況與成效，透過學生的進步率與教學風格評價，隨時調整授課方向與教學互動。學生可以從教師教學風格中找到適合的老師，也能透過學員的意見讓我們更瞭解教師們的實際授課情況，提升整體教學品質。");
		$('#course_price').val("487.00");
		$('#course_duration').val("36小時8分");
		$('#course_date').val("2022-11-01");
		$('#lecturer_name').val("溫妮");
		$('#lecturer_email').val("winniepooh@gmail.com");
		

		if ($("#course_name").val() != "") {
			$(`.messages1`).html(``)
		}

		if ($("#subject_id").val() != "0") {
			$(`.messages2`).html(`
				`)
		}
		if ($("#education_id").val() != "0") {
			$(`.messages3`).html(``)
		}
		if ($("#course_introduction").val() != "") {
			$(`.messages4`).html(``)
		}
		if ($("#course_price").val() != "") {
			$(`.messages5`).html(``)
		}
		if ($("#course_duration").val() != "") {
			$(`.messages6`).html(``)
		}
		if ($("#course_date").val() != "") {
			$(`.messages7`).html(``)
		}
		if ($("#lecturer_name").val() != "") {
			$(`.messages8`).html(``)
		}
		if ($("#lecturer_email").val() != "") {
			$(`.messages9`).html(``)
		}
	})
})


var today = new Date().toISOString().split("T")[0];
console.log(today)
console.log($('#course_date'))
$('#course_date').attr("min", today);

function reason() {
	if ($("#course_status").val() == "3") {
		Swal.fire({
			title: '請輸入駁回原因',
			icon: 'warning',
			input: 'text',
			inputAttributes: {
				autocapitalize: 'off'
			},
			showCancelButton: true,
			cancelButtonText: '取消',
			confirmButtonText: '送出',
			showLoaderOnConfirm: true,
		}).then((result) => {
			if (result.isConfirmed) {
				Swal.fire({
					title: '已將駁回通知email寄送至講師信箱 ! ',
					icon: 'success',
					willClose: function () {
						$('.cfu').submit();
					}
				})
			}
		})
		//		$(`.reason`).html(`
		//				<td class="th" style="color: red">駁回原因:</td>
		//				<td>
		//				<input type="text" size="50"  style="border: solid 1px">
		//				
		//				</td>
		//				`)
	} else {
		$(`.reason`).html(``)
	}
}

function check() {
	if ($("#course_name").val() == "") {
		$(`.messages1`).html(`
			<font color=red size=3> 請輸入課程名稱</font>
				`)
	}

	if ($("#subject_id").val() == "0") {
		$(`.messages2`).html(`
			<font color=red size=3> 請選擇課程分類</font>
				`)
	}
	if ($("#education_id").val() == "0") {
		$(`.messages3`).html(`
			<font color=red size=3> 請選擇教育程度</font>
				`)
	}
	if ($("#course_introduction").val() == "") {
		$(`.messages4`).html(`
			<font color=red size=3> 請至少輸入1個字以上的課程簡介</font>
				`)
	}
	if ($("#course_price").val() == "") {
		$(`.messages5`).html(`
			<font color=red size=3> 請輸入0~9的數字</font>
				`)
	}
	if ($("#course_duration").val() == "") {
		$(`.messages6`).html(`
			<font color=red size=3> 請輸入該課程總時數</font>
				`)
	}
	if ($("#course_date").val() == "") {
		$(`.messages7`).html(`
			<font color=red size=3> 請選擇今天(含)以後的日期</font>
				`)
	}
	if ($("#lecturer_name").val() == "") {
		$(`.messages8`).html(`
			<font color=red size=3> 請輸入講師姓名</font>
				`)
	}
	if ($("#lecturer_email").val() == "") {
		$(`.messages9`).html(`
			<font color=red size=3> 請輸入正確email格式</font>
				`)
	}
	if ($("#course_name").val() != "" &&
		$("#subject_id").val() != "0" &&
		$("#education_id").val() != "0" &&
		$("#course_introduction").val() != "" &&
		$("#course_price").val() != "" &&
		$("#course_duration").val() != "" &&
		$("#course_date").val() != "" &&
		$("#lecturer_name").val() != "" &&
		$("#lecturer_email").val() != "") {
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
					icon: 'success',
					willClose: function () {
						console.log($('.cfi'));
						$('.cfi').submit();
					}
				})
			}
		})
	}
}


$(function () {
	validate.extend(validate.validators.datetime, {
		parse: function (value, options) {
			return +moment.utc(value);
		},
		format: function (value, options) {
			var format = options.dateOnly ? "YYYY-MM-DD" : "YYYY-MM-DD hh:mm:ss";
			return moment.utc(value).format(format);
		}
	});
	var constraints = {

		"course_name": {
			presence: {
				message: "是必填的欄位"
			}, // 密碼是必填欄位
			length: {
				minimum: 5, // 長度大於 ５
				maximum: 12, // 長度小於 12
				message: "^密碼長度需大於 5 小於 12"
			},
		},
		"subject_id": {
			presence: {
				message: "是必填的欄位"
			},// 確認密碼是必填欄位
			equality: {
				attribute: "password",// 此欄位要和密碼欄位一樣
				message: "^密碼不相同"
			}
		},
		"education_id": {
			presence: {
				message: "是必填的欄位"
			}, // 必填使用者名稱
			length: {
				minimum: 3, // 名稱長度要超過 3 
			},
			format: {
				pattern: "[a-z0-9]+", // 只能填入英文或數字
				flags: "i",// 大小寫不拘
				message: "只能包含 a-z 和 0-9"
			}
		},
		"course_introduction": {
			presence: {
				message: "是必填的欄位"
			}, // 生日欄位是必填
			date: {
				latest: moment().subtract(18, "years"), // 年齡滿 18
				message: "^超過 18 歲才可以使用這個服務哦～"
			}
		},
		"course_price": {
			presence: {
				message: "是必填的欄位"
			}, // 所在地為必填
			inclusion: {
				within: ["KS"],  // 只有在 within 的才驗證通過
				message: "^Sorry, 這個服務只提供給高雄"
			}
		},
		"course_duration": {
			presence: {
				message: "是必填的欄位"
			},
		},
		"course_date": {
			presence: {
				message: "是必填的欄位"
			},
		},
		"lecturer_name": {
			presence: {
				message: "是必填的欄位"
			},
		},
		"lecturer_email": {
			presence: {
				message: "是必填的欄位"
			}, // Email 是必填欄位
			email: true // 需要符合 email 格式
		},
		"course_picture": {
			presence: {
				message: "是必填的欄位"
			},
		},
	};

	// Hook up the form so we can prevent it from being posted
	var form = document.querySelector("#main");
	form.addEventListener("submit", function (ev) {
		ev.preventDefault();
		handleFormSubmit(form);
	});

	// 監聽 input 值改變的狀況
	var inputs = document.querySelectorAll("input, textarea, select")
	for (var i = 0; i < inputs.length; ++i) {
		inputs.item(i).addEventListener("change", function (ev) {
			var errors = validate(form, constraints) || {};
			showErrorsForInput(this, errors[this.name])
		});
	}

	// 沒有錯誤就顯示成功傳送
	function handleFormSubmit(form, input) {
		var errors = validate(form, constraints);// validate the form aainst the constraints
		showErrors(form, errors || {}); // then we update the form to reflect the results
		if (!errors) {
			showSuccess();
		}
	}

	// Updates the inputs with the validation errors
	function showErrors(form, errors) {
		// We loop through all the inputs and show the errors for that input
		_.each(form.querySelectorAll("input[name], select[name]"), function (input) {
			// Since the errors can be null if no errors were found we need to handle
			// that
			showErrorsForInput(input, errors && errors[input.name]);
		});
	}

	// Shows the errors for a specific input
	function showErrorsForInput(input, errors) {
		// This is the root of the input
		var formGroup = closestParent(input.parentNode, "form-group")
			// Find where the error messages will be insert into
			, messages = formGroup.querySelector(".messages");
		// First we remove any old messages and resets the classes
		resetFormGroup(formGroup);
		// If we have errors
		if (errors) {
			// we first mark the group has having errors
			formGroup.classList.add("has-error");
			// then we append all the errors
			_.each(errors, function (error) {
				addError(messages, error);
			});
		} else {
			// otherwise we simply mark it as success
			formGroup.classList.add("has-success");
		}
	}

	// Recusively finds the closest parent that has the specified class
	function closestParent(child, className) {
		if (!child || child == document) {
			return null;
		}
		if (child.classList.contains(className)) {
			return child;
		} else {
			return closestParent(child.parentNode, className);
		}
	}

	function resetFormGroup(formGroup) {
		// Remove the success and error classes
		formGroup.classList.remove("has-error");
		formGroup.classList.remove("has-success");
		// and remove any old messages
		_.each(formGroup.querySelectorAll(".help-block.error"), function (el) {
			el.parentNode.removeChild(el);
		});
	}

	// Adds the specified error with the following markup
	// <p class="help-block error">[message]</p>
	function addError(messages, error) {
		var block = document.createElement("p");
		block.classList.add("help-block");
		block.classList.add("error");
		block.innerText = error;
		console.log(block);
		messages.appendChild(block);
	}
	function showSuccess() {
		alert("Success!"); // We made it \:D/
	}
})();
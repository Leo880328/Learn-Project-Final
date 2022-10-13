function subCheck(e) {

	console.log(check());
	e.preventDefault();
	
	if (check()) {
		
		Swal.fire({
	        title: '確認送出?"',
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
					title: '修改完成 ',
					willClose: function () {
						$('.insfrm').submit();
					}
				})
	        }
	    })
	    
		
		
	} else {
		return false;
	}
	
}



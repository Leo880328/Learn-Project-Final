
$().ready(
    function () {
        examQueryAll();


    }
)

function examQuery(){
	
		var sub = $('#quSub').val();
		var edu = $('#quEdu').val();
		
		console.log(sub);
		console.log(edu);
		
		var params = { "subject": "" + sub, "education": "" + edu}
		
		$.ajax({
	        type: 'post',
	        url: 'examFrontQuery',
	        data: params,
	        dataType: 'json',
	        success: function (data) {
	
	            console.log(data);
				$('#table').empty();
	            data.forEach(function (exam, index, array) {
					
					if ( exam.examStatus == 0){
						return;
					}
					
	                $('#table').append(createExam(exam, index));
	
	            });
	
	        }, error: function (e) {
	            console.log(e);
	        }
	
	    });
}

function examQueryAll() {

    $.ajax({
        type: 'post',
        url: 'examFrontQueryAll',
        dataType: 'json',
        success: function (data) {

            console.log(data);
            
			$('#table').empty();
			
            data.forEach(function (exam, index, array) {
				
				if ( exam.examStatus == 0){
					return;
				}
				
                $('#table').append(createExam(exam, index));

            });

        }, error: function (e) {
            console.log(e);
        }

    });

}


function createExam(exam, index) {
	
	
    let examContent = [
        `<li
        class="product-item style-list col-lg-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-ts-12">
        <div class="product-inner equal-element">
            <div class="product-top">
                <div class="flash"><span class="onnew"><span class="text">熱門</span></span>
                </div>
            </div>
            <div class="products-bottom-content">
                <div class="product-thumb">
                    <div class="thumb-inner"><a href="#"><img
                                src="${exam.examPic}" alt="img"></a><a href="#"
                            class="button quick-wiew-button">Quick View</a></div>
                </div>
                <div class="product-info-left" style="width:400px">
                    <div class="yith-wcwl-add-to-wishlist">
                        <div class="yith-wcwl-add-button"><a href="#">Add to Wishlist</a></div>
                    </div>
                    <h5 class="product-name product_title"><a href="#">${exam.examName}</a>
                    </h5>
                    <div class="stars-rating">
                        <div class="star-rating"><span class="star-3"></span></div>
                        <div class="count-star">(3) </div>
                    </div>
                    <ul class="product-attributes">
                        <li>難度:</li>
                        <li>${exam.examName}</li>
                    </ul>
                    <ul class="product-attributes">
                        <li>考試人數:</li>
                        <li>${exam.testNumber}</li>
                    </ul>
					<ul class="product-attributes">
                        <li>平均分數:</li>
                        <li>${exam.avgScore}</li>
                    </ul>
                    <ul class="product-attributes">
                        <li>建立者:</li>
                        <li>${exam.member.name}</li>
                    </ul>
                    <ul class="product-attributes">
                        <li>建立日期:</li>
                        <li>${exam.stringDate}</li>
                    </ul>
                </div>
                

                
                <div class="product-info-right">
                    <div class="price"></div>
                    <div class="product-list-message"><i class="fa-solid fa-pen" aria-hidden="true"></i>考試去</div>
                    <form class="cart" action='ExamEstaTest' method='post'>
                        <div class="single_variation_wrap">
                            <div class="quantity">
                                <div class="control"><a
                                        class="btn-number qtyminus quantity-minus"
                                        href="#">-</a><input type="text" data-step="1"
                                        data-min="0" value="1" title="Qty" class="input-qty qty"
                                        size="4"><a href="#"
                                        class="btn-number qtyplus quantity-plus">+</a></div>
                            </div>
                            <button class="single_add_to_cart_button button">Test</button>
                            <input type='hidden' name='examId' value='${exam.examID}'>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </li>`
    ]

    return examContent;
}




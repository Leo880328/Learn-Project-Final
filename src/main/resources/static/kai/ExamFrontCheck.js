
function check() {

	var examName = $('#examName').val();
    var quNumber = $('#quNumber').val();
	var examDate = $('#examDate').val();
	var examPic = $('#pictureInput').val();
	var score = $('.score');
	
	console.log(quNumber);
	console.log(examName);
	console.log(examDate);
	console.log(examPic);
	console.log(score);
	
	
	//統一格式錯誤跳false
	var quNumCk = (/^[\d]*$/.test(quNumber));
	var examNameCk = !(/^[\s\n\t\r]*$/.test(examName));
	if(examDate.length> 0){var examDateCk =true;}else{var examDateCk =false;}
	if(examPic.length> 0){var examPicCk =true;}else{var examPicCk =false;	}
	
    if (!quNumCk) {
        //		alert("題數請輸入數字");
        $('#spQuNumber').html("題數請輸入數字");
    }
    
    if (!examNameCk){
		$('#spExamName').html("卷名內容不能為空");
	}
	
	if(!examDateCk){
		$('#spExamDate').html("請選擇日期");
	}
	
	if(!examPicCk){
		$('#spExamPic').html("請選擇圖片");
	}
    
	if ( score.length > 0 ){
		
		var totalscore = 0;
		
		$('.score').each(function (index,score) {
		
        	totalscore += Number(score.value);

    	})
    	
		if(totalscore != 100){ var totalScoreCK=false } else{var totalScoreCK = true}
		
		if(!totalScoreCK){
			
			alert("配分錯誤");
			
			console.log(quNumCk && examNameCk && examDate && examPic && totalScoreCK);
			
			return quNumCk && examNameCk && examDateCk && examPicCk && totalScoreCK;
		}
	} 
	
	console.log(quNumCk && examNameCk && examDateCk && totalScoreCK);
	return quNumCk && examNameCk && examDateCk && totalScoreCK;
}




function contentCheck() {

    console.log('content')
    var tb = $('.tb')
    var content = $('content')
    console.log(tb);
    console.log(content);

    for (let i = 0; i < tb.length(); i++) {
        if (/^[\s\n\t\r]*$/.test(content)) {
            alert("題目內容不能為空");
            return false;
        } else {
            return true;
        }
    }

}
//
//if (/^[\s\n\t\r]*$/.test(quNumber)) {
//    var quSpCk = !(/^[\s\n\t\r]*$/.test(quNumber));
//    //		alert("題數不能為空");
//    $('#spQuNumber').html("題數不能為空");
//
//}
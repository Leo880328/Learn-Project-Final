function inertData() {

    $('#examName').val('數學大會考');
    $('#quNumber').val(2);
    clickIns(2);

}

function clickIns(input) {

    var contentText = 
    [
	"小韋的撲滿裡有拾元硬幣 2x 個、伍拾元硬幣 10 個和百元鈔票 x 張，則他的撲滿裡共有多少元?",
    "已知「某數的 7 倍多 9 等於該數的 5 倍減 13」。設某數為 x，則可列出下列哪個方程式？"
     ];
     
    var optA = ["100x＋500", "5x＋9＝7x－13"];
    var optB = ["120x＋500", "5x－9＝7x＋13"];
    var optC = ["100x＋250", "7x＋9＝5x－13"];
    var optD = ["120x＋250", "7x－9＝5x＋13"];
    var ansIdx = ["1","2"];
    var score = [50, 50];
    var content = "";
    
    $('#quArea').empty();
    for (var i = 0; i < input; i++) {
		
		
        content =
            "<table class='tb qutb' id='quTable' style='width:1000px'>" +
            "<tbody>" +
            "<tr>" +
            "<td colspan='6'>題目內容:</td>" +
            "</tr>" +
            "<tr>" +
            "<td colspan='6'><textarea name='content' cols='100' rows='10' required >"+contentText[i]+"</textarea ></td >" +
            "</tr>" +
            "<tr>" +
            "<td rowspan='2'>選項文字:</td>" +
            "<td>A:<input type='text' name='optA' size='40' value='"+optA[i]+"'  required></td>" +
            "<td>B:<input type='text' name='optB' size='40' value='"+optB[i]+"' required></td>" +
            "</tr>" +
            "<tr>" +
            "<td>C:<input type='text' name='optC' size='40' value='"+optC[i]+"' required></td>" +
            "<td>D:<input type='text' name='optD' size='40' value='"+optD[i]+"' required></td>" +
            "</tr>" +
            "<tr>" +
            "<td colspan='3'>" +
            "<label>答案:" +
            "<select name='answer' size='1' id='ansCho" + i +"' style='width: 150px;'>" +
            "<option value='A'>A</option>" +
            "<option value='B'>B</option>" +
            "<option value='C'>C</option>" +
            "<option value='D'>D</option>" +
            "</select>" +
            "</label>" +
            "<label class='test'>" +
            "配分:<input type='text' class='score' name='score' size='10' value='"+score[i]+"' required>" +
            "</label>" +

            "</td>" +
            "</tr>" +
            "<tr>" +
	            "<td style='text-align:center' colspan='6'><button type='button' class='del'>Del</button></td>" +
	        "</tr>" +
            "</tbody>" +
            "</table>" +
            "<br><br>"
           

		$('#quArea').append(content);
		
		var oselDiff=document.getElementById("ansCho"+i); //得到select的ID
		var optsDiff=oselDiff.getElementsByTagName("option");//得到陣列option
		optsDiff[ansIdx[i]].selected=true;
	
    }

    $('.qutb').on('click', '.del', function () {

        $(this).closest('table').remove();

        var tableNum = $('.qutb').length;
        //        console.log("quTable數量"+tableNum);

        $('#quNumber').val(tableNum);


    })

}


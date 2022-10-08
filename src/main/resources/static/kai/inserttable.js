function create(input) {

	 var content="";
	 $('#quArea').empty();
	 for (var i = 0; i < input; i++) {
		 
	     content +=
	        "<table class='tb qutb' id='quTable' style='width:1000px'>"+
	            "<tbody>"+
	                "<tr>"+
	                    "<td colspan='6'>題目內容:</td>"+
	                "</tr>"+
	                "<tr>"+
	                    "<td colspan='6'><textarea name='content' cols='100' rows='10' required></textarea></td>"+
	                "</tr>"+
	                "<tr>"+
	                    "<td rowspan='2'>選項文字:</td>"+
	                    "<td>A:<input type='text' name='optA' size='40' required></td>"+
	                    "<td>B:<input type='text' name='optB' size='40' required></td>"+
	                "</tr>"+
	                "<tr>"+
	                    "<td>C:<input type='text' name='optC' size='40' required></td>"+
	                    "<td>D:<input type='text' name='optD' size='40' required></td>"+
	                "</tr>"+
	                "<tr>"+
	                    "<td colspan='3'>"+
	                        "<label>答案:"+
	                            "<select name='answer' size='1' style='width: 150px;'>"+
	                                "<option value='A'>A</option>"+
	                                "<option value='B'>B</option>"+
	                                "<option value='C'>C</option>"+
	                                "<option value='D'>D</option>"+
	                            "</select>"+
	                        "</label>"+
	                        "<label class='test'>"+
	                            "配分:<input type='text' class='score' name='score' size='10' required>"+
	                        "</label>"+
	                    "</td>"+
	                "</tr>"+
	                "<tr>"+
	                	"<td style='text-align:center' colspan='6'><button type='button' class='del'>Del</button></td>" +
	                "</tr>"+
	            "</tbody>"+
	        "</table>"+
	        "<br><br>"
	  }
	  
	  $('#quArea').append(content);
	  
	  
	  $('.qutb').on('click', '.del', function () {
		
        $(this).closest('table').remove();
        
        var tableNum = $('.qutb').length;
//        console.log("quTable數量"+tableNum);

        $('#quNumber').val(tableNum);
        
	
	})
	  
}





<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*,fourth.bean.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat"%>
<!DOCTYPE html>
<html>

<head>
    <title>Insert title here</title>
        <style>
        .divform {

            width: 700px;
            margin: auto;
        }

        .tb {
            border: solid 2px black;
            border-collapse: collapse;
            width: 1000px;
            /*自動斷行*/
            word-wrap: break-word;
            table-layout: fixed;
            text-align: center;
        }



        .thcs{
            text-align: center;
        }

        
        .divlb{
        	margin-bottom:20px;
        }
        
        .pre{
        	height: 500px;
        
        }
        
        .btn{
        	border-radius:50%;
/*         	background-color:gray; */
			margin:auto;
        }
        
        .lb{
        	font-size: 30px;
        	font-color: black;
        	margin:auto;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/5ce521193d.js" crossorigin="anonymous"></script>
    <script type="text/javascript">
    $(function () {
        $("#resbtn").click(function () {

            var resultText = "";

            $.ajax({
                type: 'get',
                url: 'ExamMyMemSe',
                dataType: 'json',
                success: function (data) {

                    console.log(data);

                    var theadremain = $('k').text();
                    console.log(theadremain);
                    console.log(typeof (theadremain))

                    let thead =
                        "<th id='k' class='thcs'>題目</th>" +
                        "<th class='thcs'>答案</th>" +
                        "<th class='thcs'>刪除</th>"

                    $('#resth').empty();
                    $('#resth').append(thead);

                    $('#restb').empty();
                    for (var i = 0; i < data.length; i++) {
						
                    	var optContent = "";
                    	if (data[i].examQues.quesAnswer=="A"){
                    		optContent=data[i].examQues.optA;
                    	} else if (data[i].examQues.quesAnswer=="B"){
                    		optContent=data[i].examQues.optB;
                    	} else if (data[i].examQues.quesAnswer=="C"){ 
                    		optContent=data[i].examQues.optC;
                    	} else{
                    		optContent=data[i].examQues.optD;
                    	}	
                    	console.log(optContent);
                    	
                        let content =
                            "<tr>" +
                            "<td style='text-align:left'>" + data[i].examQues.quesContent + "</td>" +
                            "<td>" + optContent + "</td>" +
                            //                             "<td>" + data[i].examReserveID + "</td>" +
                            "<td style='display:none'>" + data[i].examReserveID + "</td>" +
                            //                             "<input type='hidden' id='k' value="+data[i].examReserveID+">"+
                            "<td><button class='del'>Del</button></td>" +
                            "</tr>";


                        $('#restb').append(content);

                    }
                    console.log(resultText);
                }, error: function (e) {
                    console.log(e);
                }

            });

            $('#restb').on('click', '.del', function () {

                $(this).closest('tr').remove();

                var Id = $(this).parent().prev().text();


                var params = { "Id": "" + Id }

                $.ajax({
                    type: 'post',
                    url: 'ExamMyMemDe',
                    data: params,
                    dataType: 'json',
                    success: function (dataDe) {

                    }, error: function (e) {

                    }
                })
            })


        });

        $('#paperbtn').click(function () {

            $.ajax({
                type: 'post',
                url: 'ExamMyMemRecordSe',
                dataType: 'json',
                success: function (data) {

                    console.log(data);


                    let thead =
                        "<th>卷名</th>" +
                        "<th>分數</th>" +
                        "<th>刪除</th>"

                    $('#paperth').empty();
                    $('#paperth').append(thead);

                    $('#papertb').empty();
                    for (var i = 0; i < data.length; i++) {

                        let content =
                            "<tr>" +
                         	"<td style='text-align:left'><a href="+"/HappyLearning/ExamMember"+">"+data[i].examName+"</a></td>" +
                            "<td>" + data[i].examscore + "</td>" +
                            "<td style='display:none'>" + data[i].examMemRecordId + "</td>" +
                            "<td><button class='del'>Del</button></td>" +
                            "</tr>";
                        $('#papertb').append(content);

                    }
                }, error: function (e) {
                    console.log(e);
                }

            });

            $('#papertb').on('click', '.del', function () {

                $(this).closest('tr').remove();

                var Id = $(this).parent().prev().text();

                console.log('Id' + Id);

                var params = { "Id": "" + Id }

                $.ajax({
                    type: 'post',
                    url: 'ExamMyMemRecordDe',
                    data: params,
                    dataType: 'json',
                    success: function (dataDe) {

                    }, error: function (e) {

                    }
                })
            })


        });

    });
    
	</script>
    
</head>


<body>
    <jsp:include page="Header.jsp" />

    <div class="divform">
        <div class="pre">
            <label class="lb">我的考卷<button type="button" id="paperbtn" class="btn"><i class="fa-solid fa-magnifying-glass"></i></button></label>
            <table class="tb">
	            <thead id="paperth">
	            </thead>
	            <tbody id="papertb">
                          <col width="80.00%">
                          <col width="10.00%">
                          <col width="10.00%">
	            </tbody>
       		</table>		

        </div>
        <div>

        </div>
        <div class="divlb">
            <label class="lb">我的收藏<button type="button" id="resbtn" class="btn"><i class="fa-solid fa-magnifying-glass"></i></button></label>
        </div>
        <div class="pre">
            <table class="tb">
	            <thead id="resth">
	            </thead>
	            <tbody id="restb">
					<colgroup>
                          <col width="80.00%">
                          <col width="10.00%">
                          <col width="10.00%">
                    </colgroup>
	            </tbody>
       		</table>
        </div>

    </div>
    

</body>


</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*,fourth.bean.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat"%>
<!DOCTYPE html>
<html>

<head>
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
	   $(function(){
		   $("#resbtn").click(function(){
			   
			   var resultText = "";
			   
			   $.ajax({
				   type:'post',
				   url:'ExamMyMemSe',
				   dataType: 'json',
				   success: function(data){
					   
					   console.log(data);
					   
					   for(var i=0;i<data.length;i++){
						   
						   resultText += data[i].examQues.quesContent+"<br>";
						   
					   }
					   
					   $('#result').html(resultText);
					   
					   console.log(resultText);
	
				   },error: function(e){
					   
					   console.log(e);
					   
				   }
			   });
		   });
	   });
	</script>
    
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
        }

        td {
            width: 100px;
            height: 120px;
            border: solid 1px gray;
        }

        th {
            width: 100px;
            height: 50px;
            border: solid 1px gray;
        }

        tr {
            text-align: center;
        }

        h2 {
            border: 1px solid black;
            width: 200px;
            display:inline-block;
        }
    </style>
</head>


<body>
    <jsp:include page="Header.jsp" />

    <div>
        <div>
            <h2>收藏題目</h2>
            <button id="resbtn" type="button">查詢</button>
        </div>
        <div>
            <table>
                <tr>
                	<div id="result"></div>
                	
<%--                     <td><label>${loop.index+1}${que.quesContent}</label></td> --%>
<%--                     <td><label>答案為:${que.quesAnswer}</label></td> --%>
                </tr>
            </table>
        </div>
        <div>
            <h2>我的考卷</h2>
        </div>
        <div>

        </div>
    </div>
    
	
</body>


</html>
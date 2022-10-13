<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*,fourth.bean.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat"%>
<!DOCTYPE html>
<html>

<head>
    <title>Insert title here</title>
        <style>
        .divform {

            width: 1000px;
            margin: auto;
            margin-top: 20px;
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
			min-height: 500px; 
        
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
    <script src="kai/ExamMyMemShowReserve.js"></script>
    <script src="kai/ExamMyMemShowExam.js"></script>
 
    
</head>


<body>
    <jsp:include page="Header.jsp" />
    
    
	<div class="divform">
		<a href="ExamMyMemController"><button type="button" id="query"  onclick="examQuery()" style="font-size:15px">前台</button></a>
		<a href="ExamMyMemAnalyze"><button id="submit" class="" style="font-size:15px;background-color: #111;height: 42px;">後台</button></a>
	</div>
	
    <div class="divform">
        <div class="pre">
        	<div class="divlb">
        	    <label class="lb">我的考卷<button type="button" id="paperbtn" class="btn"><i class="fa-solid fa-magnifying-glass"></i></button></label>
            </div>
            <table class="tb">
	            <thead id="paperth"></thead>
	            <tbody id="papertb">
                          <col width="70.00%">
                          <col width="10.00%">
                          <col width="10.00%">
                          <col width="10.00%">
	            </tbody>
       		</table>		

        </div>

        <div class="pre">
	        <div class="divlb">
	            <label class="lb">我的收藏<button type="button" id="resbtn" class="btn"><i class="fa-solid fa-magnifying-glass"></i></button></label>
	        </div>
            <table class="tb">
	            <thead id="resth"></thead>
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
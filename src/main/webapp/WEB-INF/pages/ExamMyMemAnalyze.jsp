<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*,fourth.bean.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat"%>
<!DOCTYPE html>
<html>

<head>
    <title>Insert title here</title>
    <style>
	.Div1{
	  
	    width: 1020px; 
	    margin: auto; 
	   	padding:10px;
	    background-color: #F5F5F5;
		border-radius:20px;
	}
	
	.card{
		width: 600px; 
		margin: auto;
	}
    
    </style>
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.js"></script>

<%-- 	<script src="<%=request.getContextPath()%>/plugins/chart.js/Chart.bundle.min.js"></script> --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/5ce521193d.js" crossorigin="anonymous"></script>
    <script src="kai/ExamMyMemAnalyze.js"></script>

    
</head>


<body>
    <jsp:include page="Header.jsp" />
    
    <div class="Div1" style="background-color:white">
		<a href="ExamMyMemController"><button type="button" id="query"  onclick="examQuery()" style="font-size:15px">前台</button></a>
		<a href="ExamAnalyze"><button id="submit" class="" style="font-size:15px;background-color: #111;height: 42px;">後台</button></a>
	</div>
    
	<div class="Div1">
        <div class="card">
            <div class="card-body pb-0 d-flex justify-content-between">
                <div>
                    <h4 class="mb-1"><b>錯題統計</b></h4>
                </div>
            </div>
            <div style="width: 400px;" class="chart-wrapper card-body ">
                <canvas id="barChart"></canvas>
            </div>
        </div>

        <div class="card">
            <div class="card-body pb-0 d-flex justify-content-between">
                <div>
                    <h4 class="mb-1"><b>錯題分布</b></h4>
                </div>
            </div>
            <div style="width: 400px;" class="chart-wrapper card-body ">
                <canvas id="radarChart"></canvas>
            </div>
        </div>
    </div>

    

</body>


</html>
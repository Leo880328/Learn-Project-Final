<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,fourth.bean.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <title>Insert title here</title>
	<style>
			body{   
		    	margin:0 auto; 
		    	background:#F0F0F0;
		    	}
			
			.divform{
				
				width:1200px;
				margin: auto;
				background-color:white;
				padding:50px
			}
		
			.divtable{
				
				width:1000px;
			
			}
		 	
		 	.tb{
		 		text-align:center;
		 		border: 1px solid #9c9c9c;
		 	}
		 	
		 	td,tbody{
		 		border:1px solid #9c9c9c;
		 	}
		 	
		 	.titleLb{
			 	font-size: 34px;
	            font-style: bold;
		 	}
		 
	</style>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
     <script type="text/javascript">
     </script>
</head>


<body>

    <jsp:include page="BackendHeader.jsp" />
    <!-- 選項與CRUD按鈕 -->
	
	<br><br><br><br>
    <div class="divform">
	        
			<div>
				<form action="examUpload" method="post">
					<div>
						<label class="titleLb">試卷名稱
						<input type="submit" class="btn btn-primary" style="font-size:20px" value="上傳"></label>
					</div>
				</form>
				
			</div>
			
				
            <div>
				<table  class="tb " id="data-table" >
                <thead>
                    <tr>
                        <th width="80">項次</th>
                        <th width="120">圖片</th>
                        <th width="80">科目</th>
                        <th width="80">程度</th>
                        <th width="120">名稱</th>
                        <th width="120">年度</th>
                        <th width="120">出題者</th>
                        <th width="80">難度</th>
                        <th width="80">考試人數</th>
                        <th width="80">平均分數</th>
                        <th width="100">審核狀態</th>
                        <th width="100">刪除</th>
                        <th width="100">更新</th>
                        <th width="100">考試</th>
                    </tr>
                </thead>

				<tbody id='resulttb'>

				</tbody>

            	</table>
			</div>
    </div>
    
<%--     <script type="text/javascript" src="${pageContext.request.contextPath}/ExamFrontCheck.js"></script> --%>
    <script type="text/javascript" src="kai/newcss.js"></script>
    
</body>


</html>
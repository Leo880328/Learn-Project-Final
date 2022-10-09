<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,fourth.bean.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <title>Insert title here</title>
	<style>
	 	    .divform { 
	
	             width: 1000px; 
	             margin: auto; 
	         } 
        
/*        .tb{ */
/* 		    background-color: white;  */
/* 		    width: 1000px;   */
/* 		    /*自動斷行*/ */
/* 		    word-wrap: break-word; */
/* 		    table-layout: fixed; */
/* 		    border-radius: 20px;   */
/* 		    text-align:center; */
/* 		} */
		
/* 		td{ */
/* 			border: solid gray 1px; */
		
/* 		} */
		

		 
		 
	</style>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
     <script type="text/javascript">
     $(function () {
    	    $('#queryAll').click(function () {

    	        $.ajax({
    	            type: 'post',
    	            url: 'examQueryAll',
    	            dataType: 'json',
    	            success: function (data) {

    	                console.log(data);


    	                $('#resulttb').empty()

    	                for (var i = 0; i < data.length; i++) {

    	                    var content =
    	                        "<tr>" +
    	                        "<td>" + (i + 1) + "</td>" +
    	                        "<td><img src='" + data[i].examPic + "' width='100'></td>" +
    	                        "<td>" + data[i].subject.subjectName + "</td>" +
    	                        "<td>" + data[i].education.educationName + "</td>" +
    	                        "<td>" + data[i].examName + "</td>" +
    	                        "<td>" + data[i].stringDate + "</td>" +
    	                        "<td>" + data[i].member.name + "</td>" +
    	                        "<td>" + data[i].difficulty + "</td>" +
    	                        "<td>" + data[i].testNumber + "</td>" +
    	                        "<td>" + data[i].avgScore + "</td>" +
    	                        "<td>" + data[i].examStatus + "</td>" +
    	                        "<td style='display:none''>" + data[i].examID + "</td>" +
    	                        "<td><button class='del'>Del</button></td>" +
    	                        
    	                        "<td><form action='examUpdate' method='post'>"+
    	                        	"<input type='hidden' name='examId' value='"+data[i].examID+"'>"+
    	                        	"<input type='submit' value='更新'>" +
    	                        "</form></td>"+
    	    					
    	                        "<td><form action='ExamEstaTest' method='post'>"+
    	                        	"<input type='hidden' name='examId' value='"+data[i].examID+"'>"+
    	                        	"<input type='submit' value='考試'>" +
    	                        "</form></td>"+
    	                        "</tr>";
    	                    $('#resulttb').append(content);

    	                }
    	            }, error: function (e) {
    	                console.log(e);
    	            }

    	        });


    	    });

    	    $('#resulttb').on('click', '.del', function () {

    	        $(this).closest('tr').remove();

    	        var Id = $(this).parent().prev().text();
    	        //     			 var Id = $(this).parent().first().text();

    	        console.log('Id' + Id);

    	        var params = { "examId": "" + Id }

    	        $.ajax({
    	            type: 'post',
    	            url: 'ExamDe',
    	            data: params,
    	            dataType: 'json',
    	            success: function (dataDe) {

    	            }, error: function (e) {

    	            }
    	        })
    	    })
    	    

    	});
     </script>
</head>


<body>

    <jsp:include page="BackendHeader.jsp" />
    <!-- 選項與CRUD按鈕 -->
    <br><br><br><br>
    <div class="divform">
	        <div>
	            <label>科目:</label>
	            <select name="quSubject" size="1">
	                 <option value="數學">數學</option>
	                 <option value="英文">英文</option>
                     <option value="國文">國文</option>
	            </select>
	            <label>程度:
	            </label>
	            <select name="quEducation" size="1">
	                <option value="國中">國中</option>
	                <option value="高中">高中</option>
	                <option value="成人">成人</option>
	            </select>
	        </div>
			<div>
				<button id="queryAll">查詢全部</button>
				<button id="query">查詢</button>
				
				<form action="examUpload" method="post">
					<input type="submit" value="上傳">
				</form>
				
			</div>
			
				
            <h2>試卷名稱</h2>
				<table  class="tb" id="data-table">
                <thead>
                    <tr>
                        <th>項次</th>
                        <th width="120">圖片</th>
                        <th>科目</th>
                        <th>程度</th>
                        <th>名稱</th>
                        <th>年度</th>
                        <th>出題者</th>
                        <th>難度</th>
                        <th>考試人數</th>
                        <th>平均分數</th>
                        <th>審核狀態</th>
                        <th>刪除</th>
                        <th>更新</th>
                        <th>考試</th>
                    </tr>
                </thead>

				<tbody id='resulttb'>

				</tbody>

            	</table>

        	</form>
    </div>
    
<%--     <script type="text/javascript" src="${pageContext.request.contextPath}/ExamFrontCheck.js"></script> --%>
    <script type="text/javascript" src="kai/ExamBackPageLoad.js"></script>
    
</body>


</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,fourth.bean.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
    <title>Insert title here</title>
    <style>

        .tb {
            width: 1000px;
            word-wrap: break-word;
            table-layout: fixed;
            padding:10px;
            margin: auto;
            background-color: #FFFFFF;
            border: solid 1px black;
            border-left: solid 1.5px black;
            border-top: solid 1.5px black;
            
        }
        
        .Div1{
        
	        width: 1020px;
	        margin: auto;
	        padding:10px;
	        background-color: #F5F5F5;
        
        }
		
		
    </style>
    
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
    integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
</head>

<body>
    <jsp:include page="Header.jsp" />

    <div class="Div1">
        <form action="ExamTestPreserve" method="post">

            <table class="tb">
            		<colgroup>
                          <col width="45.00%">
                          <col width="45.00%">
                          <col width="10.00%">
		             </colgroup>
	            	<tr>
	            		<td colspan="3"><label>分數 ${testMap.examScore} </label></td>
	            	</tr>

	            	<tr>
	            		<td colspan="3"><label>錯誤題目:</label></td>
	            	</tr>


                    
	                <c:forEach items="${testMap.examQueList}" var="que" varStatus="loop">
	            	<c:if test="${que.quesAnswer != que.chooseAns}">
		                <tr class="table-success">
		                    <td colspan="3"><label> ${loop.index+1}. ${que.quesContent}</label></td>
		                </tr>

			            <tr class="table-light">
		                    <td><label>答案:</label></td>
		                    <td><label>作答:</label></td>
		                    <td style="text-align: center"><label>收藏:</label></td>
		                </tr>
			                 
		                <tr style="background-color:#DDDDDD">    
		                    <c:choose>
		                    	<c:when test="${que.quesAnswer == 'A'}"><td><label> A. ${que.optA}</label></td></c:when>
			                    <c:when test="${que.quesAnswer == 'B'}"><td><label> B. ${que.optB}</label></td></c:when>
			                    <c:when test="${que.quesAnswer == 'C'}"><td><label> C. ${que.optC}</label></td></c:when>
			                    <c:when test="${que.quesAnswer == 'D'}"><td><label> D. ${que.optD}</label></td></c:when>
		                    </c:choose> 
		                    <c:choose>	
	<%-- 			                    <td><label>選擇為:${que.chooseAns}</label></td> --%>
			                    <c:when test="${que.chooseAns == 'A'}"><td><label> A. ${que.optA}</label></td></c:when>
			                    <c:when test="${que.chooseAns == 'B'}"><td><label> B. ${que.optB}</label></td></c:when>
			                    <c:when test="${que.chooseAns == 'C'}"><td><label> C. ${que.optC}</label></td></c:when>
			                    <c:when test="${que.chooseAns == 'D'}"><td><label> D. ${que.optD}</label></td></c:when>
			                </c:choose>  
			                <td style="text-align:center"><label><input type="checkbox" name="reserveQuIdx" value="${loop.index}"></label></td>
		                </tr>
	             	</c:if>
	                </c:forEach>
	                
<!-- 			<div style="margin:auto; height:42px;width:120px;"> -->
<!--             	<input type="submit" name="todo" value="testConfirm"> -->
<!-- 			</div> -->
					<tr>
	                     <td style="text-align: center" colspan="3">
	                     <button style="border-radius:10px" type="submit" name="todo" value="testConfirm">testConfirm</button></td>    
           			</tr>
            </table>
        </form>
    </div>
    
</body>


</html>
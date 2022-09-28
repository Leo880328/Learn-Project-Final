<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,fourth.bean.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
    <title>Insert title here</title>
    <style>

        .tb {
            width: 1200px;
            word-wrap: break-word;
            table-layout: fixed;
            margin: auto;
            background-color: #FFFFFF;
            padding:10px;
        }
        
        .Div1{
        
	        width: 1020px;
	        margin: auto;
	        padding:10px;
	        background-color: #F5F5F5;
        
        }

    </style>
</head>

<body>
    <jsp:include page="Header.jsp" />

    <div class="Div1">
        <form action="ExamController" method="post">

            <table class="tb">
	            	<tr>
	            		<td colspan="3"><label>分數 ${testMap.examScore} </label></td>
	            	</tr>
	                <tr>
	                    <td><label>錯誤題目:</label></td>
	                    <td><label>答案為:</label></td>
	                    <td><label>作答為:</label></td>
	                    <td><label>收藏:</label></td>
	                </tr>
                 	<colgroup>
                          <col width="60.00%">
                          <col width="15.00%">
                          <col width="15.00%">
                          <col width="10.00%">
                    </colgroup>
                    
	                <c:forEach items="${testMap.examQueList}" var="que" varStatus="loop">
	            	<c:if test="${que.quesAnswer != que.chooseAns}">
	                <tr>
	                    <td><label>${loop.index+1}${que.quesContent}</label></td>
		                    <c:choose>
		                    	<c:when test="${que.quesAnswer == 'A'}"><td><label>${que.optA}</label></td></c:when>
			                    <c:when test="${que.quesAnswer == 'B'}"><td><label>${que.optB}</label></td></c:when>
			                    <c:when test="${que.quesAnswer == 'C'}"><td><label>${que.optC}</label></td></c:when>
			                    <c:when test="${que.quesAnswer == 'D'}"><td><label>${que.optD}</label></td></c:when>
		                    </c:choose> 
		                    <c:choose>	
<%-- 			                    <td><label>選擇為:${que.chooseAns}</label></td> --%>
			                    <c:when test="${que.chooseAns == 'A'}"><td><label>${que.optA}</label></td></c:when>
			                    <c:when test="${que.chooseAns == 'B'}"><td><label>${que.optB}</label></td></c:when>
			                    <c:when test="${que.chooseAns == 'C'}"><td><label>${que.optC}</label></td></c:when>
			                    <c:when test="${que.chooseAns == 'D'}"><td><label>${que.optD}</label></td></c:when>
			                </c:choose>  
			                    <td><label><input type="checkbox" name="reserveQuIdx" value="${loop.index}"></label></td>
	                </tr>
	             	</c:if>
	                </c:forEach>
	                
<!-- 			<div style="margin:auto; height:42px;width:120px;"> -->
<!--             	<input type="submit" name="todo" value="testConfirm"> -->
<!-- 			</div> -->
					<tr>
	                     <td style="text-align: center" colspan="3"><button  type="submit" name="todo" value="testConfirm">testConfirm</button></td>    
           			</tr>
            </table>
        </form>
    </div>
    
</body>


</html>
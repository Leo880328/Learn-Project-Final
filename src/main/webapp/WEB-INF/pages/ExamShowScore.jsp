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
	                    <td colspan="2"><label>錯誤題目:</label></td>
	                    <td>收藏題目</td>
	                </tr>
                 	<colgroup>
                          <col width="80.00%">
                          <col width="10.00%">
                          <col width="10.00%">
                    </colgroup>
	                <c:forEach items="${testMap.examWrongList}" var="que" varStatus="loop">
	                <tr>
	                    <td><label>${loop.index+1}${que.quesContent}</label></td>
	                    <td><label>答案為:${que.quesAnswer}</label></td>
	                    <td><label><input type="checkbox" name="reserveQuIdx" value="${loop.index}"></label></td>
	                </tr>
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
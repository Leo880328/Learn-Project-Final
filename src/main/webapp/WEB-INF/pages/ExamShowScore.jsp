<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,fourth.bean.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
    <title>Insert title here</title>
    <style>
    </style>
</head>

<body>
    <jsp:include page="Header.jsp" />

    <div>
        <form action="ExamController" method="post">

            <table>
                
            </table>
            <table class="tb">
            	<tr>
            		<td colspan="3"><label>分數 ${testMap.examScore} </label></td>
            	</tr>
                <tr>
                    <td colspan="2"><label>錯誤題目:</label></td>
                    <td>收藏題目</td>
                </tr>
                <c:forEach items="${testMap.examWrongList}" var="que" varStatus="loop">
                    <tr>
                        <td><label>${loop.index+1}${que.quesContent}</label></td>
                        <td><label>答案為:${que.quesAnswer}</label></td>
                        <td><label><input type="checkbox" name="reserveQuIdx" value="${loop.index}"></label></td>
                    </tr>
                </c:forEach>
            </table>
			<div style="margin:auto; height:42px;width:120px;">
            	<input type="submit" name="todo" value="testConfirm">
			</div>
        </form>
    </div>
    
</body>


</html>
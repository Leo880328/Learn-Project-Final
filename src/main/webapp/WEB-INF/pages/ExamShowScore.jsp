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
	<%
	List<ExamQuesBean> theWrongtable =(List<ExamQuesBean>) request.getAttribute("examWrongTable");
	
	%>

	<div>
		<form action="firstExamController">
		
	        <table >
				<label>答對 ${examResult} 題</label> 
	        </table>
	        	        <table class="tb">
	            <tr>
	                <td>
	                    <label>考卷名稱:</label>
	                </td>
	            </tr>

				<% int i=0;%>
	            <c:forEach items="${examWrongTable}" var="que">
	            <tr>
	                <td>
	                	<% i++;%>
	                    <label>${que.quesContent}:</label><br>
	                </td>
	                <td>
	                	<label>答案為:</label><br>
	                	<label>${que.quesAnswer}:</label><br>
	                </td>
	                
	            </tr>
				
				

	            </c:forEach>
			
	        </table>
	        
			<input type="submit">
			
		</form>
	</div>


</body>


</html>
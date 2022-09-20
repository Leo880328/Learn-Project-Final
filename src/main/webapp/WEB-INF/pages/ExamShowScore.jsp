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
		<form action="firstExamController">
		
	        <table >
				<label>答對 ${examResult} 題</label> 
	        </table>
	        
			<input type="submit">
			
		</form>
	</div>


</body>


</html>
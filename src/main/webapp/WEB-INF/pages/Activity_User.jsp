<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<%@ page import="java.util.List" %>
		<%@ page import="fourth.bean.ActivityBean" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>活動</title>

				<!--css導入-->
				<link rel="stylesheet" href="css/activityCSS.css">
				<Style>
					#box {
						position: relative;
						z-index: 2;
						width: 1170px;
						margin: auto;
						min-height: 1280px;

						padding: 19px;

						background: #f3f3f3;
					}

					.activity_form {
						min-width: 1060px;
						width: 1060px;
					}

					.preview {
						width: 1050px;
					}

					.data {
						display: none
					}

					.select {
						float: right;
						display: flex;

					}

					.selectInput {
						font-size: xx-large;
					}
				</Style>
			</head>

			<body>
				<jsp:include page="Header.jsp" />

				<div id="box">



					<form class="select" action="Activity">
						<input class="selectInput" type="month" name="select" />
						<button type="submit" name="request" value="查詢">查詢</button>
					</form>
					<h2>活動</h2>

					<br />
					<p>



					
		
		<div id="join"></div>
	</div>
				<script src="ActivityResources/js/SelectActivity.js"></script>
			</body>

			</html>
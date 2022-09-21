<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="java.util.List" %>
		<%@ page import="fourth.bean.ActivityBean" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>活動(管理員)</title>
				<!--css導入-->
				<link rel="stylesheet" href="css/activityCSS.css">

				<Style>
					#box {
						position: relative;
						width: 1170px;
						margin: auto;
						min-height: 1280px;
						padding: 19px;
						background: #f3f3f3;
					}

					.Activity_title {
						margin-top: 100px
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

					#uploadPhotos {
						display: none
					}

					.uploadImgButton {
						background-color: rgb(101, 161, 90);

					}

					label {
						background-color: #65a15a;
						display: inline-block;
						padding: 9px 20px;
						color: #fff;
						border: 0;
						text-align: center;
						font-size: 12px;
						font-weight: 700;
						-webkit-transition: all .4s ease 0s;
						-moz-transition: all .4s ease 0s;
						-o-transition: all .4s ease 0s;
						transition: all .4s ease 0s;
						border-radius: 0;
						text-transform: uppercase;
						font-family: 'Montserrat', sans-serif
					}
				</Style>
			</head>
			<body>
				<jsp:include page="BackendHeader.jsp" />
				<div id="box">
					<h1 class="Activity_title">活動編輯</h1>
					<br />
					<div>
						<form class="select" action="Activity_OP">
							<input class="selectInput" type="month" name="select" />
							<button type="submit" name="request" value="查詢">查詢</button>
						</form>
						<form action="Activity_OP_insert" method="post">
							<button name="request" class="ActivityInsertButton" value="新增">新增活動</button>
						</form>
						<br />
					</div>
					<hr>
					<div id="hrml_content">
					</div>
				</div>
				<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
				<script src="ActivityResources/js/SelectActivity_op.js"></script>
			</body>

			</html>
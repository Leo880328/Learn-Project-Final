<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="sidebar col-lg-3 col-md-3 col-sm-12 col-xs-12"
		style="width: 200px; margin-left: 100px">
		<div class="wrapper-sidebar shop-sidebar">
			<div class="widget woof_Widget">
				<div class="widget widget-categories">
					<h3 class="widgettitle">訂單篩選</h3>
					<form class="select-item select-form" style="width: 200px">
						<div class="title">訂單狀態:</div>
						<select title="by" data-placeholder="Price: Low to High"
							class="chosen-select" onchange="selectStatus(this)">
							<option value="0">全部</option>
							<option value="1">未付款</option>
							<option value="2">已付款</option>
							<option value="3">待審核</option>
							<option value="4">完成訂單</option>
							<option value="5">已退款</option>
							<option value="6">已駁回</option>
						</select>
						<div
							class="chosen-container chosen-container-single chosen-container-single-nosearch"
							style="width: 183px;" title="sort">
							<div class="chosen-drop">
								<div class="chosen-search">
									<input type="text" autocomplete="off" readonly="">
								</div>
								<ul class="chosen-results"></ul>
							</div>
						</div>
					</form>
					<form class="select-item select-form" style="width: 200px">
						<div class="title">課程分類:</div>
						<select title="sort" data-placeholder="9 Products/Page"
							class="chosen-select" style="display: none;"><option
								value="2">英文</option>
							<option value="1">數學</option>
							<option value="5">多益</option></select>
						<div
							class="chosen-container chosen-container-single chosen-container-single-nosearch"
							style="width: 183px;" title="sort">
							<div class="chosen-drop">
								<div class="chosen-search">
									<input type="text" autocomplete="off" readonly="">
								</div>
								<ul class="chosen-results"></ul>
							</div>
						</div>
					</form>
					<form class="select-item select-form" style="width: 200px">
						<div class="title">程度分類:</div>
						<select title="sort" data-placeholder="9 Products/Page"
							class="chosen-select" style="display: none;"><option
								value="2">國中</option>
							<option value="1">高中</option>
							<option value="5">成人</option></select>
						<div
							class="chosen-container chosen-container-single chosen-container-single-nosearch"
							style="width: 183px;" title="sort">
							<div class="chosen-drop">
								<div class="chosen-search">
									<input type="text" autocomplete="off" readonly="">
								</div>
								<ul class="chosen-results"></ul>
							</div>
						</div>
					</form>

				</div>

			</div>

		</div>
	</div>
	<!---------------------------------------------- sidebar ---------------------------------------------------->
	<div class="container" style="width: 900px">
		<div class="row" style="margin-left: 50px; width: 900px;">
				<h4>
					共<span id="count">0</span>筆訂單
				</h4>
				<div
					class="content-area  shop-grid-content full-width col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="site-main" id="userOutBody">
						<div id="userbody"></div>
					</div>
				</div>

		</div>
	</div>


</body>
</html>
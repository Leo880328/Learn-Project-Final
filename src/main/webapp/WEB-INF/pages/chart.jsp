<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="BackendHeader.jsp" />
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" id="main-stylesheet" data-version="1.1.0"
	href="backend2/styles/shards-dashboards.1.1.0.min.css">
<link rel="stylesheet" href="backend2/styles/extras.1.1.0.min.css">

<!-- Google Font: Source Sans Pro -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback"> -->
<!-- Font Awesome -->
<!-- <link rel="stylesheet" -->
<!-- 	href="wayne/plugins/fontawesome-free/css/all.min.css"> -->
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<!-- <link rel="stylesheet" -->
<!-- 	href="wayne/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css"> -->
<!-- iCheck -->
<!-- <link rel="stylesheet" -->
<!-- 	href="wayne/plugins/icheck-bootstrap/icheck-bootstrap.min.css"> -->
<!-- JQVMap -->
<!-- <link rel="stylesheet" href="wayne/plugins/jqvmap/jqvmap.min.css"> -->
<!-- Theme style -->

<!-- overlayScrollbars -->
<!-- <link rel="stylesheet" -->
<!-- 	href="wayne/plugins/overlayScrollbars/css/OverlayScrollbars.min.css"> -->
<!-- <!-- Daterange picker -->
<!-- <link rel="stylesheet" -->
<!-- 	href="wayne/plugins/daterangepicker/daterangepicker.css"> -->
<!-- <!-- summernote  -->
<!-- <link rel="stylesheet" -->
<!-- 	href="wayne/plugins/summernote/summernote-bs4.min.css"> -->

<link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="wayne/css/style.css" rel="stylesheet" type="text/css" />
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script> -->
<script type="text/javascript">
	$(function() {
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		first = null;
		
		$.ajax({
			
			async:true,
			type : "get",
			url : "orderList/total",
			success : function(data) {
				var total =0;
				var count = 0;
				$.each(data, function(i, item) {
					total += item.totoalprice;
					console.log(item);
				});
					console.log(total);
				$("#money").html(total+"$");
			}
		})
		
		    $( "#blog-overview-date-range" ). change( function (){
		    	lab = [];
				val = [];
				
				start = new Date($("#blog-overview-date-range").find("input[ name= 'start']").val());
				end = new Date($("#blog-overview-date-range").find("input[ name= 'end']").val());
		    	difference = diff(start,end); 
		    	console.log(start);
		    	console.log(end);
		    	console.log(difference);
		    	console.log(formatDate(start));
		    	console.log(formatDate(end));
		    	
		    	loadChart();
				
			});
		    //日期點擊事件結束
	});
	
	function loadChart(){
    	
		if(first == null){
			
			first = 1
			lab = [];
			val = [];
			start = 0;
			end = 0;
	    	difference = diff(start,end); 
	    	
		}
		
		$.ajax({
			
			async:false,
			type : "get",
			url : "chart/"+formatDate(start)+"/"+formatDate(end)+"/"+difference,
			success : function(data) {
				rangeMoney = 0;
				rangeCount = 0;
					$("#can").remove();
	  		    	$('#c').append('<canvas height="130" style="max-width: 100% !important;"class="blog-overview-users" id="can"></canvas>');
				$.each(data, function(i, item) {
					lab.push(i);
					var total = 0;
					$.each(item, function(i, o) {
						total += o.totoalprice;
					});
					val.push(total+'');
					rangeMoney += total;
					rangeCount += item.length;
				});
				rangeMoney += '';
				$("#rangeMoney").html(rangeMoney);
				$("#rangeCount").html(rangeCount);
					console.log(lab);
					console.log(val);
					
					// Data
					var bouData = {
						// Generate the days labels on the X axis.
						labels : Array.from(new Array(lab.length), function(_, i) {
							
							return i === 0 ? lab[i] :lab[i];
						}),
						datasets : [
									{
										label : '當日營收',
										fill : 'start',
										data : val,//[500, 800, 320, 180, 240, 320, 230, 650, 590, 1200, 750, 940, 1420, 1200, 960, 1450, 1820, 2800, 2102, 1920, 3920, 3202, 3140, 2800, 3200, 3200, 3400, 2910, 3100, 4250],
										backgroundColor : 'rgba(0,123,255,0.1)',
										borderColor : 'rgba(0,123,255,1)',
										pointBackgroundColor : '#ffffff',
										pointHoverBackgroundColor : 'rgb(0,123,255)',
										borderWidth : 1.5,
										pointRadius : 0,
										pointHoverRadius : 3
				 					}
								]
					};
					var bouCtx = document.getElementsByClassName('blog-overview-users')[0];

					// Options
					var bouOptions = {
						responsive : true,
						legend : {
							position : 'top'
						},
						elements : {
							line : {
								// A higher value makes the line look skewed at this ratio.
								tension : 0.3
							},
							point : {
								radius : 0
							}
						},
						scales : {
							xAxes : [ {
								gridLines : false,
								ticks : {
									callback : function(tick, index) {
										// Jump every 7 values on the X axis labels to avoid clutter.
										return index % 1 !== 0 ? '' : tick;
									}
								}
							} ],
							yAxes : [ {
								ticks : {
									suggestedMax : 45,
									callback : function(tick, index, ticks) {
										if (tick === 0) {
											return tick;
										}
										// Format the amounts using Ks for thousands.
										return tick > 999 ? (tick / 1000).toFixed(1) + 'K'
												: tick;
									}
								}
							} ]
						},
						//       Uncomment the next lines in order to disable the animations.
						animation : {
							duration : 0
						},
						hover : {
							mode : 'nearest',
							intersect : false
						},
						tooltips : {
							custom : false,
							mode : 'nearest',
							intersect : false
						}
					};

					// Generate the Analytics Overview chart.
					window.BlogOverviewUsers = new Chart(bouCtx, {
						type : 'bar',
						data : bouData,
						options : bouOptions
					});
					var aocMeta = BlogOverviewUsers.getDatasetMeta(0);
					aocMeta.data[0]._model.radius = 0;
					aocMeta.data[bouData.datasets[0].data.length - 1]._model.radius = 0;

					// 	 Render the chart.
					window.BlogOverviewUsers.render();


			}
			//AJAX返回成功結束
		})
		//AJAX發送日期範圍結束
    }
    
	function formatDate(date) {
	    var d = new Date(date),
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate(),
	        year = d.getFullYear();

	    if (month.length < 2) 
	        month = '0' + month;
	    if (day.length < 2) 
	        day = '0' + day;

	    return [year, month, day].join('-');
	}
	 
	
	
	function diff(sDate1, sDate2) { // sDate1 和 sDate2 是 2016-06-18 格式
		  var oDate1 = new Date(sDate1);
		  var oDate2 = new Date(sDate2);
		  var iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 / 24); // 把相差的毫秒數轉換為天數
		  return iDays;
	};
</script>
</head>
</head>
<body onload="loadChart()">

	<main
		class="main-content col-lg-10 col-md-9 col-sm-12 p-0 offset-lg-2 offset-md-3">
		<br /> <br /> <br /> <br />
		<div class="main-content-container container-fluid px-4">

			<!-- <!-- 			End Page Header  -->
			<!-- <!-- 			Small Stats Blocks  -->
			<div class="row" style="margin-left:100px">
				<!-- 				<div class="col-lg-3 col-6"> -->
				<!-- 					small box -->
				<!-- 				</div> -->

				<!-- 				<div class="col-lg-3 col-6"> -->
				<!-- 					small box -->
				<!-- 				</div> -->
				

				<div style="width:400px" >
<!-- 					<div class="stats-small stats-small--1 card card-small"> -->
						<div class="small-box bg-warning" style="border-radius:10px ;">
							<div class="inner">
								<h3 id="money">0</h3>

								<p>營業總額</p>
							</div>
							<div class="icon">
								<i class="fa fa-dollar"></i>
							</div>
							<a href="#" class="small-box-footer" style="border-radius:10px ;">More info <i
								class="fas fa-arrow-circle-right"></i></a>
						</div>
						<!-- 						<div class="card-body p-0 d-flex"> -->
						<!-- 							<div class="d-flex flex-column m-auto"> -->
						<!-- 								<div class="stats-small__data text-center"> -->
						<!-- 									<span class="stats-small__label text-uppercase">區間筆數</span> -->
						<!-- 									<h6 class="stats-small__value count my-3" >0</h6> -->
						<!-- 								</div> -->
						<!-- 								<div class="stats-small__data"> -->
						<!-- 									<span -->
						<!-- 										class="stats-small__percentage stats-small__percentage--increase">12.4%</span> -->
						<!-- 								</div> -->
						<!-- 							</div> -->
						<!-- 							<canvas height="120" class="blog-overview-stats-small-2"></canvas> -->
						<!-- 						</div> -->
<!-- 					</div> -->
				</div>
				<div style="width:400px; margin-left:250px" >
<!-- 					<div class="stats-small stats-small--1 card card-small"> -->
						<div class="small-box bg-info" style="border-radius:10px ;">
							<div class="inner">
								<h3 id="count">0</h3>

								<p>總訂單量</p>
							</div>
							<div class="icon">
								<i class="ion ion-bag"></i>
							</div>
							<a href="#" class="small-box-footer" style="border-radius:10px ;">More info <i
								class="fas fa-arrow-circle-right"></i></a>
						</div>
						<!-- 						<div class="card-body p-0 d-flex"> -->
						<!-- 							<div class="d-flex flex-column m-auto"> -->
						<!-- 								<div class="stats-small__data text-center"> -->
						<!-- 									<span class="stats-small__label text-uppercase">區間金額</span> -->
						<!-- 									<h6 class="stats-small__value count my-3" >0</h6> -->
						<!-- 								</div> -->
						<!-- 								<div class="stats-small__data"> -->
						<!-- 									<span -->
						<!-- 										class="stats-small__percentage stats-small__percentage--increase">4.7%</span> -->
						<!-- 								</div> -->
						<!-- 							</div> -->
						<!-- 							<canvas height="120" class="blog-overview-stats-small-1"></canvas> -->
						<!-- 						</div> -->
<!-- 					</div> -->
				</div>
				<!-- 				<div class="col-lg col-md-4 col-sm-6 mb-4"> -->
				<!-- 					<div class="stats-small stats-small--1 card card-small"> -->
				<!-- 						<div class="card-body p-0 d-flex"> -->
				<!-- 							<div class="d-flex flex-column m-auto"> -->
				<!-- 								<div class="stats-small__data text-center"> -->
				<!-- 									<span class="stats-small__label text-uppercase">Comments</span> -->
				<!-- 									<h6 class="stats-small__value count my-3" id="rangeMoney">0</h6> -->
				<!-- 								</div> -->
				<!-- 								<div class="stats-small__data"> -->
				<!-- 									<span -->
				<!-- 										class="stats-small__percentage stats-small__percentage--decrease">3.8%</span> -->
				<!-- 								</div> -->
				<!-- 							</div> -->
				<!-- 							<canvas height="120" class="blog-overview-stats-small-3"></canvas> -->
				<!-- 						</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
				<!-- 				<div class="col-lg col-md-4 col-sm-6 mb-4"> -->
				<!-- 					<div class="stats-small stats-small--1 card card-small"> -->
				<!-- 						<div class="card-body p-0 d-flex"> -->
				<!-- 							<div class="d-flex flex-column m-auto"> -->
				<!-- 								<div class="stats-small__data text-center"> -->
				<!-- 									<span class="stats-small__label text-uppercase">Users</span> -->
				<!-- 									<h6 class="stats-small__value count my-3" id="rangeCount">0</h6> -->
				<!-- 								</div> -->
				<!-- 								<div class="stats-small__data"> -->
				<!-- 									<span -->
				<!-- 										class="stats-small__percentage stats-small__percentage--increase">12.4%</span> -->
				<!-- 								</div> -->
				<!-- 							</div> -->
				<!-- 							<canvas height="120" class="blog-overview-stats-small-4"></canvas> -->
				<!-- 						</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
				<!-- 				<div class="col-lg col-md-4 col-sm-12 mb-4"> -->
				<!-- 					<div class="stats-small stats-small--1 card card-small"> -->
				<!-- 						<div class="card-body p-0 d-flex"> -->
				<!-- 							<div class="d-flex flex-column m-auto"> -->
				<!-- 								<div class="stats-small__data text-center"> -->
				<!-- 									<span class="stats-small__label text-uppercase">Subscribers</span> -->
				<!-- 									<h6 class="stats-small__value count my-3">17,281</h6> -->
				<!-- 								</div> -->
				<!-- 								<div class="stats-small__data"> -->
				<!-- 									<span -->
				<!-- 										class="stats-small__percentage stats-small__percentage--decrease">2.4%</span> -->
				<!-- 								</div> -->
				<!-- 							</div> -->
				<!-- 							<canvas height="120" class="blog-overview-stats-small-5"></canvas> -->
				<!-- 						</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
			</div>
			<!-- <!-- 			End Small Stats Blocks  -->
			<div class="row">
				<!-- 				Users Stats -->
				<div class="col-lg-8 col-md-12 col-sm-12 mb-4">
					<div class="card card-small">
						<div class="card-header border-bottom">
							<h6 class="m-0">訂單金額營收圖表</h6>
						</div>
						<div class="card-body pt-0" id="c">
							<div class="row border-bottom py-2 bg-light">
								<div class="col-12 col-sm-6">
									<div id="blog-overview-date-range"
										class="input-daterange input-group input-group-sm my-auto ml-auto mr-auto ml-sm-auto mr-sm-0"
										style="max-width: 350px;">
										<input type="text" class="input-sm form-control" name="start"
											placeholder="Start Date" id="blog-overview-date-range-1">
										<input type="text" class="input-sm form-control" name="end"
											placeholder="End Date" id="blog-overview-date-range-2">
										<span class="input-group-append"> <span
											class="input-group-text"> <i class="material-icons"></i>
										</span>
										</span>
									</div>
								</div>
								<div class="col-12 col-sm-6 d-flex mb-2 mb-sm-0">
									<button type="button"
										class="btn btn-sm btn-white ml-auto mr-auto ml-sm-auto mr-sm-0 mt-3 mt-sm-0">View
										Full Report &rarr;</button>
								</div>
							</div>
							<br>
							<div>
								<div style="display: inline-block; width: 450px;">
									<span class="sm-st-icon st-blue"><i class="fa fa-dollar"></i></span>
									<div class="sm-st-info">
										<span id="rangeMoney">0</span> 營業額

									</div>
								</div>
								<div style="display: inline-block; width: 300px;">
									<span class="sm-st-icon st-red"><i
										class="fa fa-check-square-o"></i></span>
									<div class="sm-st-info">
										<span id="rangeCount">0</span> 訂單數量
									</div>
								</div>
								<hr>
							</div>
							<canvas height="130" style="max-width: 100% !important;"
								class="blog-overview-users" id="can"></canvas>
						</div>
					</div>
				</div>
				<!-- End Users Stats -->
				<!-- Users By Device Stats -->
				<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
					<div class="card card-small h-100">
						<div class="card-header border-bottom">
							<h6 class="m-0">訂單狀態占比圖</h6>
						</div>
						<div class="card-body d-flex py-0">
							<canvas height="220" class="blog-users-by-device m-auto"></canvas>
						</div>
						<div class="card-footer border-top">
							<div class="row">
								<div class="col">
									<select class="custom-select custom-select-sm"
										style="max-width: 130px;">
										<option selected>Last Week</option>
										<option value="1">Today</option>
										<option value="2">Last Month</option>
										<option value="3">Last Year</option>
									</select>
								</div>
								<div class="col text-right view-report">
									<a href="#">Full report &rarr;</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 				End Users By Device Stats -->

			</div>

		</div>
	</main>

<!-- 	<script src="https://code.jquery.com/jquery-3.3.1.min.js" -->
<!-- 		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" -->
<!-- 		crossorigin="anonymous"></script> -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
	<script src="https://unpkg.com/shards-ui@latest/dist/js/shards.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Sharrre/2.0.1/jquery.sharrre.min.js"></script>
	<script src="backend2/scripts/extras.1.1.0.min.js"></script>
	<script src="backend2/scripts/shards-dashboards.1.1.0.min.js"></script>
	<script src="backend2/scripts/app/app-blog-overview.1.1.0.js"></script>
</body>
</html>
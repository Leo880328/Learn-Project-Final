<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html lang="en">

<head>
<title>Home</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<jsp:include page="BackendHeader.jsp" />
<style type="text/css">
#flotcontainer {
width: 500px;
height: 400px;
}
</style>
<script type="text/javascript">

</script>
</head>
	
	

<body>
	<main class="main">
		<section class="content">
			<header class="content__title">
				<h1>FLOT</h1>
				<small>Flot is a pure JavaScript plotting library for
					jQuery, with a focus on simple usage, attractive looks and
					interactive features.</small>
				<div class="actions">
					<a href="" class="actions__item zmdi zmdi-trending-up"></a><a
						href="" class="actions__item zmdi zmdi-check-all"></a>
					<div class="dropdown actions__item">
						<i data-toggle="dropdown" class="zmdi zmdi-more-vert"></i>
						<div class="dropdown-menu dropdown-menu-right">
							<a href="" class="dropdown-item">Refresh</a><a href=""
								class="dropdown-item">Manage Widgets</a><a href=""
								class="dropdown-item">Settings</a>
						</div>
					</div>
				</div>
			</header>
			<div class="row">
				<div class="col-md-6">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">Line Chart</h4>
							<div class="flot-chart flot-line"></div>
							<div class="flot-chart-legends flot-chart-legends--line"></div>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">Line Chart with curved edges</h4>
							<h6 class="card-subtitle">Curved edges made possible with
								the help of curvedLines Flot plugin.</h6>
							<div class="flot-chart flot-curved-line"></div>
							<div class="flot-chart-legends flot-chart-legends--curved"></div>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">Pie Chart</h4>
							<div class="flot-chart flot-pie"></div>
							<div class="flot-chart-legends flot-chart-legend--pie"></div>
						</div>
						<div id="flotcontainer"></div>	
					</div>
				</div>
				<div class="col-md-6">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">Bar Chart</h4>
							<div class="flot-chart flot-bar"></div>
							<div class="flot-chart-legends flot-chart-legends--bar"></div>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">Dynamic Data Chart</h4>
							<div class="flot-chart flot-dynamic"></div>
							<div class="flot-chart-legends flot-chart-legends--dynamic"></div>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">Donut Chart</h4>
							<div class="flot-chart flot-donut"></div>
							<div class="flot-chart-legends flot-chart-legend--donut"></div>
						</div>
					</div>
				</div>
			</div>

		</section>
	</main>
</body>

</html>
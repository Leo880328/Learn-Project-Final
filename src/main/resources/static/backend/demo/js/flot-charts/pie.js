"use strict"; $(document).ready(function() {
	var a = [
		{ data: 5, color: "#ff6b68", label: "Toyota" },
		{ data: 2, color: "#03A9F4", label: "Nissan" },
		{ data: 1, color: "#32c787", label: "Hyundai" },
		{ data: 4, color: "#f5c942", label: "Scion" },
		{ data: 5, color: "#d066e2", label: "Daihatsu" }];

	var data = [
		{ label: "影像合成", data: 10 },
		{ label: "商品拍攝", data: 20 },
		{ label: "打光技巧", data: 30 },
		{ label: "實拍案例", data: 40 }
	];
	var options = {
		series: {
			pie: { show: true }
		},
		legend: {
			show: false
		}
	};
	$.plot($("#flotcontainer"), data, options);
	if (true) {
		var options = {
			series: {
				pie: { show: true }
			},
			legend: {
				show: false
			}
		};
		$.plot($(".flot-pie"), a, options);

	}
	if (true) { $.plot(".flot-donut", a, { series: { pie: { innerRadius: 0.5, show: true, stroke: { width: 2 } } }, legend: { container: ".flot-chart-legend--donut", backgroundOpacity: 0.5, noColumns: 0, backgroundColor: "white", lineWidth: 0, labelBoxBorderColor: "#fff" } }) }
});
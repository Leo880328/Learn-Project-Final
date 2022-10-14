$(function () {


    $.ajax({
        type: 'post',
        url: 'ExamTestStatistic',
        dataType: 'json',
        success: function (stadata) {


			barchart(stadata);
			radarchart(stadata);


        }, error: function (e) {
            console.log(e);
        }


    })


});


function barchart(stadata){
	
	const data = {
		labels: ['數學', '英文', '國文',],
		datasets: [
			{	
				labels: '123',
				data: [stadata[0], stadata[1], stadata[2]],
				borderColor: 'rgba(255, 26, 104, 1)',
				backgroundColor: [
					"rgba(255, 99, 132, 0.2)",
					'rgba(54, 162, 235, 0.2)',
					'rgb(75, 192, 192,0.2)',

				],
				borderColor: [
					"rgba(255,99,132,1)", // 第一個 bar 外框線顏色v
					"rgba(54, 162, 235, 1)",
					"rgba(75, 192, 192, 1)",
				],
				borderWidth: 1 // 外框線寬度
			}
		]
	};

	const config = {
		type: 'bar',
		data,
		options: {
			plugins: {
				legend: {
					display: false
				}
			},
			scales: {
				y: {
					beginAtZero: true,
					suggestedMin: 0,
					suggestedMax: 10
				}
			}
		},
	};

	const myChart = new Chart(
		document.getElementById('barChart'),
		config
	);
	
}

function radarchart(stadata){
	
	const data = {
		labels: [
			'數學',
			'英文',
			'國文',
		],
		datasets: [{
			label: '錯題分析',
			data: [stadata[0], stadata[1], stadata[2]],
			fill: true,
			backgroundColor: 'rgba(255, 99, 132, 0.2)',
			borderColor: 'rgb(255, 99, 132)',
			pointBackgroundColor: 'rgb(255, 99, 132)',
			pointBorderColor: '#fff',
			pointHoverBackgroundColor: '#fff',
			pointHoverBorderColor: 'rgb(255, 99, 132)'
		}]
	};

	const config = {
		type: 'radar',
		data: data,
		options: {
			legend: {
				display: false
			},
			r: {
				angleLines: {
					display: false
				},
				suggestedMin: 0,
				suggestedMax: 10
			},
			elements: {
				line: {
					borderWidth: 3
				}
			}
		},
	};

	const myChart = new Chart(
		document.getElementById('radarChart'),
		config
	);
	
	
	
}
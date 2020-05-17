<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<link rel="stylesheet" href="css/style.css">
<script type="text/javascript">
$(function() {
	var socitys = new Array();
	$.ajax(
			{
				url: "socitys.xml",
				type: "GET", //xhr.open("POST", ...)
				dataType: "xml", //서버가 클라이언트에게 응답하는 데이터 형식
				success:function(data){
					$(data).find("City").each(function() {
						if($(this).find("city-name").text() == "경기도"){
							socitys.push({ name: $(this).find("city-name").text(),
								   		   y: parseInt($(this).find("city-count").text()),
								           sliced: true,
								           selected: true
								  	});
						}else{
							
						socitys.push({name: $(this).find("city-name").text(),
								   y: parseInt($(this).find("city-count").text())
								  });
						}
					});
					console.log(socitys);
					
					Highcharts.chart('output-container', {
					    chart: {
					        plotBackgroundColor: null,
					        plotBorderWidth: null,
					        plotShadow: false,
					        type: 'pie'
					    },
					    title: {
					        text: '지역별 성범죄자 통계',
					        style: {
						        fontSize: '50px',
						        fontFamily: 'Verdana, sans-serif',
						        color: 'red'
						      }
					    },
					    tooltip: {
					        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
					    },
					    plotOptions: {
					        pie: {
					            allowPointSelect: true,
					            cursor: 'pointer',
					            dataLabels: {
					                enabled: true,
					                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
					                style: {
					                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
					                }
					            }
					        }
					    },
					    series: [{
					        name: '지역',
					        colorByPoint: true,
					        data: socitys
					    }]
					});
				},
				error: function(xhr) { //404, 500
					alert("Error" +xhr.status);
				}
				
			}		
		)
	
});
</script>
</head>
<body>
	<div id="output-container"
		style="min-width: 300px; height: 400px; margin: 0 auto"></div>
</body>
</html>
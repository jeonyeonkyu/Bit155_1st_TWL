<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Line_Controls_Chart</title>
<meta http-equiv="refresh" content="300">
<link rel="apple-touch-icon" href="apple-icon.png">
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet"
	href="./admin/vendors/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="./admin/vendors/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="./admin/vendors/themify-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="./admin/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet"
	href="./admin/vendors/selectFX/css/cs-skin-elastic.css">
<link rel="stylesheet" href="./admin/vendors/jqvmap/dist/jqvmap.min.css">


<link rel="stylesheet" href="./admin/assets/css/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
	window.onload = function() {
		callAjax();
		function callAjax() {
			console.log("여긴오냐")
			$.ajax({
 				url : "admin.do", 
				type : 'POST',
				cache : false,
				dataType : 'json',
				data: $('#wwww').serialize(),
				success : function(data) {
					/* alert('성공띠') */
					console.log(data.count);
					$('#kwc').html(data.count);
					console.log(data.count);
				},
				error : function(request, status, error) {
					 /* alert("code:"+request.status+"\n"+"error:"+error); */

				}
			})
		}
		
		 $('#btn1').click(function () {
			 callAjax();
         });

	}
</script>
</head>
<body>

	<div class="col-sm-6 col-lg-3">
		<div class="card text-white bg-flat-color-1">
			<div class="card-body pb-0">
				<div class="dropdown float-right">
					<button
						class="btn bg-transparent dropdown-toggle theme-toggle text-light"
						type="button" id="dropdownMenuButton1" data-toggle="dropdown">
						<i class="fa fa-cog"></i>
					</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<div class="dropdown-menu-content">
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a> <a
								class="dropdown-item" href="#">Something else here</a>
						</div>
					</div>
				</div>
				<h4 id="temp" class="mb-0">
					<%-- <span class="count">${requestScope.mCount}</span>  --%>
					<form id="wwww">
						<span id="kwc"></span>
						<button id="btn1" value="좋아요!">sss</button>
						<!-- 총 회원수 -->
					</form>
				</h4>
				<p class="text-light">Members online</p>

				<div class="chart-wrapper px-0" style="height: 70px;" height="70">
					<canvas id="widgetChart1"></canvas>
				</div>

			</div>
sadsaddsa<br>
sda<br>
sda<br>
sad<br>
sad<br>
sadsaddsa<br>
sda<br>
sda<br>
sad<br>
sad<br>
sadsaddsa<br>
sda<br>
sda<br>
sad<br>
sad<br>
sadsaddsa<br>
sda<br>
sda<br>
sad<br>
sad<br>

		</div>
	</div>
</body>


<!-- jQuery -->
<script src="https://code.jquery.com/jquery.min.js"></script>
<!-- google charts -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://www.google.com/jsapi"></script>
<script src="./admin/vendors/jquery/dist/jquery.min.js"></script>
<script src="./admin/vendors/popper.js/dist/umd/popper.min.js"></script>
<script src="./admin/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="./admin/assets/js/main.js"></script>


<script src="./admin/vendors/chart.js/dist/Chart.bundle.min.js"></script>
<script src="./admin/assets/js/dashboard.js"></script>
<script src="./admin/assets/js/widgets.js"></script>
<script src="./admin/vendors/jqvmap/dist/jquery.vmap.min.js"></script>
<script
	src="./admin/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
<script src="./admin/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script>
	(function($) {
		"use strict";

		jQuery('#vmap').vectorMap({
			map : 'world_en',
			backgroundColor : null,
			color : '#ffffff',
			hoverOpacity : 0.7,
			selectedColor : '#1de9b6',
			enableZoom : true,
			showTooltip : true,
			values : sample_data,
			scaleColors : [ '#1de9b6', '#03a9f5' ],
			normalizeFunction : 'polynomial'
		});
	})(jQuery);
</script>
</html>
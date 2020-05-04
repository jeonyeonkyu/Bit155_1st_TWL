<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="x-ua-compatible" content="IE=edge">
<title>main</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./main.css">
</head>

<body>
	<nav id="navbar-example"
		class="navbar fixed-top navbar-expand-md bg-light navbar-light ">
		<ul class="mr-auto mb-0 pl-3 navbar-brand" style="margin-left: 270px;">
			<li class="nav-item d-flex">
				<div href="https://www.facebook.com/woocheol.kim.353"
					target="_blank" class="d-flex align-items-center">
					<img src="./image/thumbs.svg" alt="A magnifying glass with one eye"
						class="card-icon mr-3">
					<h3 style="margin-bottom: 0">26.8조</h3>
				</div>
			</li>
		</ul>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#alt" aria-controls="alt" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="alt">
			<ul class="navbar-nav ml-auto" id="menu">
				<li class="nav-item pr-3">
					<button class="btn btn-dark mb-2" data-toggle="modal"
						data-target="#myModal" href="#interests">사용법</button>
				</li>
				<li class="nav-item pr-3"><input onclick="showMarkers();"
					type=button value="Show All Markers" class="btn btn-success mb-2">
				</li>
				<li class="nav-item pr-3"><input onclick="clearMarkers();"
					type=button value="Hide Markers" class="btn btn-secondary mb-2">
				</li>
				<li class="nav-item pr-3"><input onclick="deleteMarkers();"
					type=button value="Delete Markers" class="btn btn-danger mb-2">
				</li>
				<li class="nav-item pr-3"><input onclick="burgerMarkers();"
					id="burgerButton" type=button value="강남 햄버거집 show"
					class="btn btn-primary mb-2"></li>
				<li class="nav-item"><input onclick="location_back();"
					id="burgerButton" type=button value="현재위치"
					class="btn btn-primary mb-2"></li>

			</ul>
		</div>
	</nav>
	<!-- Top 메뉴바 end -->


	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal modal-dialog-centered">
			<!-- <div class="modal-dialog modal-dialog-scrollable">
        :본문 내용 많을시 모덜 내부에서만 스크롤 가능 -->
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">
						<span>설명</span>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<p>
						<b>마우스 왼쪽 클릭</b> : 마커 생성<br> <b>마커 클릭</b> : 말풍선 생성 and 위도,경도
						출력<br> <b>직선거리 계산(위치 값 입력)</b><br> ex)출발 : 0, 도착 : 1<br>
						ex)출발 : 맘스터치, 도착 : 버거킹<br> ex)출발 : 현재위치, 도착 : 버거킹 or 1<b>(입력순서
							주의)</b><br> ex)출발 : 0, 도착 : 버거킹<b>(입력순서 주의)</b><br> <b>지도
							검색</b> : 도로명 주소 입력<br> <b>현재 위치</b> : 지도에서 현재위치로 돌아감
					</p>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal end -->

	<nav class="navbar navbar-dark fixed-top" id="sideNav"
		style="background-color: #3b5998;">
		<a
			class="d-flex justify-content-center navbar-brand js-scroll-trigger"
			href="#page-top" style="margin-right: 0;"> <!-- <span class="d-lg-none"></span> -->
			<h3 class="mt-3">Google Maps</h3>
		</a>

		<div class="navbar-collapse mt-3">
			<ul class="navbar-nav nav-item">
				<li class="d-flex nav-item mx-auto"><a
					class="nav-link js-scroll-trigger mb-2 mr-3" href="#">위&nbsp치</a> <input
					type="text" id="location_index" class="form-control"
					style="width: 180px;" value=""></li>
				<li class="d-flex nav-item mx-auto"><a
					class="nav-link js-scroll-trigger mb-2 mr-3" href="#">위&nbsp도</a> <input
					type="text" id="lat" class="form-control" style="width: 180px;"
					value=""></li>
				<li class="d-flex nav-item mx-auto"><a
					class="nav-link js-scroll-trigger mb-2  mr-3" href="#">경&nbsp도</a>
					<input type="text" id="lng" class="form-control"
					style="width: 180px;" value=""></li>
				<li class="nav-item mx-auto mt-3"><a
					class="d-flex justify-content-center navbar-brand js-scroll-trigger"
					href="#page-top" style="margin-right: 0;">
						<h5 class="mt-3">직선 거리 계산</h5>
				</a>
					<div class="d-flex">
						<a class="nav-link js-scroll-trigger mb-2 mr-3" href="#">출발</a> <input
							type="text" id="start_index" class="form-control"
							style="width: 180px;" value="" placeholder="위치입력">
					</div>
					<div class="d-flex">
						<a class="nav-link js-scroll-trigger mb-2 mr-3" href="#">도착</a> <input
							type="text" id="end_index" class="form-control"
							style="width: 180px;" value="" placeholder="위치입력">
					</div>
					<div class="d-flex">
						<a class="nav-link js-scroll-trigger mb-2 mr-3" href="#">거리</a> <input
							type="text" id="distance" class="form-control"
							style="width: 180px;" value="" placeholder="">
					</div>
					<div class="text-center">
						<button id="dis_cal" class="btn btn-primary" type="submit"
							style="width: 70px;">계산</button>
					</div></li>
				<li class="nav-item mx-auto mt-3"><a
					class="d-flex justify-content-center navbar-brand js-scroll-trigger"
					href="#page-top" style="margin-right: 0;">
						<h5 class="mt-3">지도 검색</h5>
				</a>
					<div class="d-flex">
						<a class="nav-link js-scroll-trigger mb-2 mr-3" href="#">주소</a> <input
							type="text" id="address" class="form-control"
							style="width: 180px;" value="" placeholder="">
						<!-- <button id="submit" type="button" value="Geocode"></button> -->
					</div>
					<div class="text-center">
						<button id="submit" class="btn btn-primary" value="Geocode"
							type="button" style="width: 70px;">검색</button>
					</div></li>
			</ul>
		</div>
	</nav>
	<!-- left 메뉴바 end -->

	<div id="map"></div>
	<!-- 구글지도 -->

</body>

<script src="./main.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB967GKjoFZHapwWuYLDfvp3JQssSZzvkE&libraries=places&callback=initMap&sensor=true"
	async defer></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

</html>
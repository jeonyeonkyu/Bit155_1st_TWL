<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Sufee Admin - HTML5 Admin Template</title>
<meta name="description" content="Sufee Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="apple-icon.png">
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet"
	href="vendors/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="vendors/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="vendors/themify-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet" href="vendors/selectFX/css/cs-skin-elastic.css">
<link rel="stylesheet" href="vendors/jqvmap/dist/jqvmap.min.css">


<link rel="stylesheet" href="assets/css/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- 게시판 디자인 -->
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
        integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">



<style>
        tr>th {
            text-align: center;
        }
    </style>

</head>

<body>

	<!-- Left Panel -->
	<jsp:include page="/WEB-INF/common/LeftMenu.jsp"></jsp:include>

	<!-- /Left Panel -->

	<!-- Right Panel -->

	<div id="right-panel" class="right-panel">

		<!-- Header-->
		<jsp:include page="/WEB-INF/common/TopMenu.jsp"></jsp:include>
		<!-- /Header -->

		<div class="breadcrumbs">
			<div class="col-sm-4">
				<div class="page-header float-left">
					<div class="page-title">
						<h1>회원 관리 테이블</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li class="active">회원 관리 테이블</li>
						</ol>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="form-group">
				<div class="row ">
					<div class="col-sm-12 col-md-6 ">
						<div class="form-group d-flex align-items-center">
							<div class="col-sm-2" style="padding-left: 0">
								<select class="form-control">
									<option value="5">5</option>
									<option value="10">10</option>
									<option value="15">15</option>
									<option value="ALL">ALL</option>
								</select>
							</div>
							<label for="" style="margin-bottom: 0">개씩 보기</label>
						</div>

					</div>
					<div class="col-sm-12 col-md-6">
						<div class="d-flex justify-content-end">
							<div class="col-sm-3" style="padding-left: 25px;">
								<select class="form-control">
									<option value="제목">제목</option>
									<option value="작성자">작성자</option>
								</select>
							</div>


							<label for=""> <input type="search" class="form-control"
								placeholder="Search">
							</label>
						</div>
					</div>

				</div>

				<div class="main-panel">
					<div class="content-wrapper">
						<div class="row ">
							<div class="col-12">
								<table id="order-listing" class="table text-center">
									<thead>
										<tr class="text-center">
											<th class="text-center" style="width: 25px;">번호</th>
											<th style="width: 250px;">제목</th>
											<th style="width: 25px;">작성자</th>
											<th style="width: 30px;">작성일</th>
											<th style="width: 25px;">조회</th>
											<th style="width: 25px;">좋아요</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>3</td>
											<td>테스트3</td>
											<td>관리자</td>
											<td>2020-04-27</td>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<td>2</td>
											<td>테스트2</td>
											<td>관리자</td>
											<td>2020-04-27</td>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<td>1</td>
											<td>테스트1</td>
											<td>관리자</td>
											<td>2020-04-27</td>
											<td>1</td>
											<td>1</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<div class="d-flex justify-content-between">
					<div class="" style="visibility: hidden;">
						<button type="button" class="btn btn-primary">
							<i class="fas fa-pencil-alt pr-1"></i>글쓰기
						</button>
					</div>
					<!-- 공간차지용 -->
					<ul class="pagination" style="margin: 0 auto">
						<!-- justify-content-end -->
						<li class="page-item"><a href="" class="page-link"> <i
								class="fas fa-arrow-left"></i>
						</a></li>
						<li class="page-item"><a href="" class="page-link">1</a></li>
						<li class="page-item"><a href="" class="page-link">2</a></li>
						<li class="page-item"><a href="" class="page-link">3</a></li>
						<li class="page-item"><a href="" class="page-link"> <i
								class="fas fa-arrow-right"></i>
						</a></li>
					</ul>
					<div class="">
						<button type="button" class="btn btn-primary">
							<i class="fas fa-pencil-alt pr-1"></i>글쓰기
						</button>
					</div>
				</div>
			</div>




			<!-- .content -->
		</div>
		<!-- /#right-panel -->

		<!-- Right Panel -->

		<script src="vendors/jquery/dist/jquery.min.js"></script>
		<script src="vendors/popper.js/dist/umd/popper.min.js"></script>
		<script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
		<script src="assets/js/main.js"></script>


		<script src="vendors/chart.js/dist/Chart.bundle.min.js"></script>
		<script src="assets/js/dashboard.js"></script>
		<script src="assets/js/widgets.js"></script>
		<script src="vendors/jqvmap/dist/jquery.vmap.min.js"></script>
		<script src="vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
		<script src="vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
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
</body>

</html>

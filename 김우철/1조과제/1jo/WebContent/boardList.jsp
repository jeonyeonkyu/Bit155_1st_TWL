<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>맥도날드 커스텀</title>

<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/3.9.0/less.min.js"></script>
<link rel="shortcut icon" type="image/x-icon"
	href="./kor/images/favicon.ico">
<link rel="stylesheet" href="./kor/css/common.css?t=2020032601">

<script type="text/javascript"
	src="https://gc.kis.v2.scr.kaspersky-labs.com/FD126C42-EBFA-4E12-B309-BB3FDD723AC1/main.js?attr=KlH_WAJFCibGDKISxdnW4fsv91xpXwhSRnvf_MZ1KBhOTEiazjpjIS4ueX6DtNSFviyNdvoXRj4TqohBYfhklw"
	charset="UTF-8"></script>
<script src="./kor/js/libs.js"></script>
<script src="./mdelivery.js"></script>
<script src="./kor/js/common.js"></script>
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-15032749-2"></script>

</head>
<body>
	<div class="wrapper">
		<jsp:include page="./common/nav.jsp"></jsp:include>
		<div class="container">
			<div style="margin-bottom: 50px;">
				<h3>게시판</h3>
			</div>
			<div class="form-group">
				<div class="row">
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
							<label for=""  style="all: unset;">개씩 보기</label>
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
								placeholder="Search" style="all: initial ;">
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
			<jsp:include page="./common/footer.jsp"></jsp:include>
		</div>
		<!-- //wrapper -->
	</div>

</body>
</html>

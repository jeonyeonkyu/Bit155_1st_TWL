<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>dataTable 연습</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> 

<link rel="stylesheet" type="text/css"
	href="./vendor/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="./vendor/css/responsive.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="./vendor/css/main.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!-- 아이콘 -->

<script src='./vendor/js/jquery-3.3.1.min.js'></script>
<script src="./vendor/js/jquery.dataTables.js"></script>
<script src="./vendor/js/dataTables.responsive.min.js"></script>
<script src="./vendor/js/dataTables.buttons.min.js"></script>
<script src="./vendor/js/buttons.html5.min.js"></script>
<script src="./vendor/js/main.js"></script>
</head>

<body>
	<div class="wrap">
		<h1>DataTables Grid Example</h1>
		<table id="myTable" class="display text-center" style="width:100%;">
			<thead>
				<tr class="text-center">
					<th class="text-center" style="width: 25px;">번호</th>
					<th style="width: 200px;">제목</th>
					<th style="width: 25px;">작성자</th>
					<th style="width: 30px;">작성일</th>
					<th style="width: 10px;">조회</th>
					<th style="width: 10px;">좋아요</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="boardlist" value="${requestScope.boardList}"></c:set>
				<c:forEach var="board" items="${boardlist}">
					<tr>
						<td>${board.boardNo}</td>
						<td>${board.boardTitle}</td>
						<td>${board.boardAuthor}</td>
						<td>${board.boardDate}</td>
						<td>${board.boardCount}</td>
						<td>${board.boardLike}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- //wrapper -->

</body>
</html>

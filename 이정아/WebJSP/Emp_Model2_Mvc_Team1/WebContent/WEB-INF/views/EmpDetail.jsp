<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<title>board</title>
<script>
	$(document).on('click', '#btnSave', function(e) {
		e.preventDefault();
		$("#form").submit();
	});
	
	$(document)
			.on(
					'click',
					'#btnList',
					function(e) {
						e.preventDefault();
						location.href = "boardCustomList.do";
					});
</script>

<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>

</head>

<body>

	<article>
		<div class="container" role="main">
			<h2>회원정보 상세보기</h2>
			<form name="form" id="form" role="form" method="post"
				action="EmpDetail.do">
				<c:set var="list" value="${requestScope.detail}" />
				<c:forEach var="list2" items="${detail}">
				<div class="mb-3">
					<label for="title">사원번호</label>
					 <input type="text"
						class="form-control" name="writer" id="reg_id"
					 value = "${list2.empno}">
				</div>

				<div class="mb-3">
					<label for="reg_id">이름</label> <input type="text"
						class="form-control" name="writer" id="reg_id"
					value = "${list2.ename}">
				</div>
				
				<div class="mb-3">
					<label for="reg_id">연봉</label> <input type="text"
						class="form-control" name="email" id="reg_id"
						value = "${list2.sal}">
				</div>
				
				<div class="mb-3">
					<label for="reg_id">직급</label> <input type="text"
						class="form-control" name="homepage" id="reg_id"
							value = "${list2.job}">
				</div>

				<div class="mb-3">
					<label for="content">사원번호</label>
					<input type="text" class="form-control" rows="5" name="content" id="content"
						value = "${list2.empno}">
				</div>
				
				<div class="mb-3">
					<label for="reg_id">입사일</label> <input type="text"
						class="form-control" name="pwd" id="reg_id"
						value = "${list2.hiredate}">
				</div>
					<div class="mb-3">
					<label for="reg_id">COMM</label> <input type="text"
						class="form-control" name="pwd" id="reg_id"
						value = "${list2.comm}">

					<div class="mb-3">
					<label for="reg_id">MGR</label> <input type="text"
						class="form-control" name="pwd" id="reg_id"
						value = "${list2.mgr}">
				</div>
					</c:forEach>
					 <a
							href="EmpDetail.jsp?idx=${list2.empno}&cp=${cpage}&ps=${pagesize}">
						</a>
			</form>	
			<div>
			<!-- 저장 구현필요 -->
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">
             저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">
				<a href="EmpTable.jsp?cp=${cpage}&ps=${pagesize}">목록가기</a>목록</button>
			</div>
		</div>

	</article>

</body>

</html>




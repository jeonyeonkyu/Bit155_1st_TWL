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
						location.href = "EmpTable.do";
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
<c:set var="emp" value="${requestScope.emp}" />
<%--  ${requestScope.emp}  --%>

	<article>
		<div class="container" role="main">
			<h2>상세보기</h2>
			<form name="form" id="form" role="form" method="post"
				action="boardCustomWrite.do">
				<div class="mb-3">
					<label for="title">사원번호</label> 
						<input type="text"
						class="form-control" name="empno" id="empno" value="${emp.empno} " readonly>
				</div>

				<div class="mb-3">
					<label for="reg_id">사원이름</label> 
						<input type="text"
						class="form-control" name="ename" id="ename" value="${emp.ename}" readonly>
				</div>
				
				<div class="mb-3">
					<label for="reg_id">사원직급</label> 
						<input type="text"
						class="form-control" name="job" id="job" value="${emp.job}" readonly>
				</div>
				
				<div class="mb-3">
					<label for="reg_id">사원직급</label> 
						<input type="text"
						class="form-control" name="mgr" id="mgr" value="${emp.mgr}" readonly>
				</div>

				<!-- 썸머노트 반영 -->
				<div class="mb-3">
					<label for="content">고용일자</label>
					<!-- <textarea class="form-control" rows="5" name="content" id="content"
						placeholder="내용을 입력해 주세요"></textarea> -->
						<input type="text"
						class="form-control" name="hiredate" id="hiredate" value="${emp.hiredate}" readonly>
				</div>
				
				<div class="mb-3">
					<label for="reg_id">급여</label> 
						<input type="text"
						class="form-control" name="sal" id="sal" value="${emp.sal}" readonly>
				</div>
				<div class="mb-3">
					<label for="reg_id">커미션</label> 
						<input type="text"
						class="form-control" name="comm" id="comm" value="${emp.comm}" readonly>
				</div>
				<div class="mb-3">
					<label for="reg_id">부서번호</label> 
						<input type="text"
						class="form-control" name="deptno" id="deptno" value="${emp.deptno}" readonly>
				</div>
			</form>
			<div>
				<!-- <button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
 -->				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
		</div>

	</article>

</body>

</html>




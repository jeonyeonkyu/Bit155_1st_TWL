<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<jsp:include page="/WEB-INF/common/head.jsp" />
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
<script type="text/javascript">

	$(function() {
		$('#btn').click(function() {
							$('#tbody').empty();
							$.ajax({
										url : "EmpByEmpno.do",
										data : {
											empno : $('#empvalue').val()
										},
										dataType : "text",
										success : function(data) {
											console.log(data);
											$('#tbody').html(data);
										},
										error : function(xhr, status, error) {
											console.log("에러");
										}

									});
						});
		
 		$('#btn2').click(function() {
			$('#tbody').empty();
			$.ajax({
						url : "EmpByDeptno.do",
						data : {
							deptno : $('#deptnovalue').val()
						},
						dataType : "text",
						success : function(data) {
							$('#tbody').html(data);
						},
						error : function(xhr, status, error) {
							console.log("에러");
						}

					});
		}); 
	});
</script>

</head>

<body class="">
	<div class="wrapper">

		<jsp:include page="/WEB-INF/common/sidebar.jsp" />
		<div class="main-panel">
			<jsp:include page="/WEB-INF/common/nav.jsp" />
			<div class="content">

				<div class="card ">
					<div class="card-header">
						<br> <b style="color: white; float: left">사원번호 검색</b> <br>
						<form action="" method="post">
							<input type="text" class="form-control" id="empvalue"
								placeholder="Input Number"
								style="width: 20%; border-color: white; float: left; margin-right: 4px">

							<input type="button" id="btn" class="form-control"
								style="width: 7%; border-color: white;" value="검색">
						</form>
					</div>
					<div class="card-header">
						<br> <b style="color: white; float: left">부서별 검색</b> <br>
						<form action="" method="post">
							<input type="text" class="form-control" id="deptnovalue"
								placeholder="Input Number"
								style="width: 20%; border-color: white; float: left; margin-right: 4px">

							<input type="button" id="btn2" class="form-control"
								style="width: 7%; border-color: white;" value="검색">
						</form>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table tablesorter ">
								<thead class=" text-primary">
									<tr>
										<th>번호</th>
										<th>이름</th>
										<th>직종</th>
										<th>선임</th>
										<th>입사일</th>
										<th>월급</th>
										<th>부서번호</th>
										 <th></th> 
									</tr>
								</thead>
								<tbody id="tbody">
									<c:forEach var="emplist" items="${requestScope.emplist}">
										<tr id = "tr1">
											<td>${emplist.empno}</td>
											<td>${emplist.ename}</td>
											<td>${emplist.job}</td>
											<td>${emplist.mgr}</td>
											<td>${emplist.hiredate}</td>
											<td>${emplist.sal}</td>
											<td>${emplist.deptno}</td>
											<td><a href="EditEmp.do?empno=${emplist.empno}">[수정]</a>&nbsp;
												<a href="DeleteEmpCheck.do?empno=${emplist.empno}">[삭제]</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/WEB-INF/common/footer.jsp" />
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<jsp:include page="/WEB-INF/common/head.jsp" />
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
<script>
	$(function(){
		$("#upload").change(function(e){
			event.preventDefault();

			var file = e.target.files[0];
			var url = URL.createObjectURL(file);
			$("#previewImage").attr("src", url);
			/* $.ajax({
				url: "uploadImage.do",
				data:new FormData($(this)),
				contentType:false,
				cache:false,
				processData:false,
				success:function(response){
					$("img").attr("src",response)
				},
				beforeSend:function(){
					$("img").html("<h5>업로드중</h5>")
				}
			}) */
		});
	});
</script>
</head>
<%= request %>

<body class="">

	<div class="wrapper">
		<jsp:include page="/WEB-INF/common/sidebar.jsp" />
		<div class="main-panel">
			<jsp:include page="/WEB-INF/common/nav.jsp" />
			<div class="content">
			<form action ="EditEmpOkAction.do" enctype="multipart/form-data" method="post">
				<div class="row">
					<div class="col-md-9">
						<div class="card">
							<div class="card-header">
								<h5 class="title">사원 정보 수정</h5>
							</div>
							<div class="card-body">
								<c:set var="emp" value="${requestScope.emp}" />
									<div class="row">
										<div class="col-md-6 pr-md-1">
											<div class="form-group">
												<label>사원 사진</label><br>
												<img id="previewImage" src ="<c:choose><c:when test ="${emp.file_path != null}">${emp.file_path}</c:when>	
																										  <c:when test ="${emp.file_path == '/assets/uploads/'}">assets/img/default-avatar.png</c:when>
																										  <c:otherwise>assets/img/default-avatar.png</c:otherwise></c:choose>"
																										   style = "width:100px;height:100px">
												<input type = "hidden" name = "hid"  value = "hello">
											</div>
										</div>
										<div>
											<div >
												<input type="file" name = "upload" id = "upload"value = "사진선택">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6 pr-md-1">
											<div class="form-group">

												<label>사원 번호</label> <input type="text" name = "empno"class="form-control"
													placeholder="EMPNO" value ="${emp.empno}" readonly>
											</div>
										</div>
										
										<div class="col-md-6 pl-md-1">
											<div class="form-group">
												<label>사원 이름</label> <input type="text" class="form-control"name = "ename"
													placeholder="ENAME"value ="${emp.ename}" readonly>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6 pr-md-1">
											<div class="form-group">
												<label>부서 번호</label> <input type="text" class="form-control" name = "deptno"
													placeholder="DEPTNO"value ="${emp.deptno}">
											</div>
										</div>
										<div class="col-md-6 pl-md-1">
											<div class="form-group">
												<label>선임 번호</label> <input type="text" class="form-control" name = "mgr"
													placeholder="MGR"value ="${emp.mgr}">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6 pr-md-1">
											<div class="form-group">
												<label>월급</label> <input type="text" class="form-control" name = "sal"
													placeholder="SAL" value ="${emp.sal}">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label>직종</label> <input type="text" class="form-control" name = "job"
													placeholder="JOB"value ="${emp.job}">
											</div>
										</div>
									</div>
									
									<div class="card-footer">
										<button type="submit" class="btn btn-fill btn-primary">EDIT</button>
									</div>

							</div>

						</div>
					</div>

				</div>
				</form>
			</div>
			
			<jsp:include page="/WEB-INF/common/footer.jsp" />
		</div>
	</div>
</body>
</html>
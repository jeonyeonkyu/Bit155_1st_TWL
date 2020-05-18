<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<jsp:include page="/WEB-INF/common/head.jsp" />
</head>


<body class="">

	<div class="wrapper">
		<jsp:include page="/WEB-INF/common/sidebar.jsp" />
		<div class="main-panel">
			<jsp:include page="/WEB-INF/common/nav.jsp" />
			<div class="content">
			<form action ="AddMemberOkAction.do">
				<div class="row">
					<div class="col-md-9">
						<div class="card">
							<div class="card-header">
								<h5 class="title">사원 등록</h5>
							</div>
							<div class="card-body">
								
									<div class="row">
										<div class="col-md-6 pr-md-1">
											<div class="form-group">
												<label>사원 번호</label> <input type="text" name = "empno"class="form-control"
													placeholder="EMPNO" >
											</div>
										</div>
										<div class="col-md-6 pl-md-1">
											<div class="form-group">
												<label>사원 이름</label> <input type="text" class="form-control"name = "ename"
													placeholder="ENAME">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6 pr-md-1">
											<div class="form-group">
												<label>부서 번호</label> <input type="text" class="form-control" name = "deptno"
													placeholder="DEPTNO" >
											</div>
										</div>
										<div class="col-md-6 pl-md-1">
											<div class="form-group">
												<label>선임 번호</label> <input type="text" class="form-control" name = "mgr"
													placeholder="MGR" >
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6 pr-md-1">
											<div class="form-group">
												<label>월급</label> <input type="text" class="form-control" name = "sal"
													placeholder="SAL"  >
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label>직종</label> <input type="text" class="form-control" name = "job"
													placeholder="JOB" >
											</div>
										</div>
									</div>
									<div class="card-footer">
										<button type="submit" class="btn btn-fill btn-primary">INSERT</button>
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
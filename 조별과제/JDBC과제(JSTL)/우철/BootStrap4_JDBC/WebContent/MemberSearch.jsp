<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/common/head.jsp"></jsp:include>

<c:if
	test="${sessionScope.userid == null || !sessionScope.userid.equals('admin')}">
	<script>
		location.href = 'index.jsp'
	</script>
</c:if>

<%
	request.setCharacterEncoding("UTF-8");
%>
<body>
	<jsp:include page="/common/Top.jsp"></jsp:include>
	<div class="container">
		<div class="form-group mt-3">
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
						<!-- <div class="col-sm-3" style="padding-left: 25px;">
							<select class="form-control">
								<option value="제목">이름</option>
								<option value="작성자">핸드폰</option>
							</select>
						</div> -->


						<!-- <form action="Ex03_MemberSearch.jsp" method="post">
							회원명:<input type="text" name="search">
							<input type="submit" value="이름검색하기">
						</form> -->

						<form action="MemberSearch.jsp" mehtod="post" class="d-flex">
							<input type="search" class="form-control" placeholder="name"
								name="search" style="margin-right: 10px;"> <input
								type="submit" class="btn btn-primary" value="검색">
						</form>



					</div>
				</div>

			</div>

			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row ">
						<div class="col-12">

							<%
								String searchName = request.getParameter("search");

								Connection conn = null;
								PreparedStatement pstmt = null;
								ResultSet rs = null;

								//where ename like '%길동%'
								conn = Singleton_Helper.getConnection("oracle");
								String sql = "select count(*) from bituser where name like ?";
								String sql2 = "select id, pwd, name, email, phone, ip from bituser where name like '%" + searchName + "%'";

								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1, '%' + searchName + '%');
								rs = pstmt.executeQuery();
								int rowcount = 0;
								if (rs.next()) {
									rowcount = rs.getInt(1); //조회건수
								}
							%>
							<table id="order-listing" class="table text-center">
								<thead>
									<tr class="text-center">
										<th class="text-center" style="width: 50px;">아이디</th>
										<th style="width: 80px;">비밀번호</th>
										<th style="width: 40px;">이름</th>
										<th style="width: 80px;">이메일</th>
										<th style="width: 60px;">핸드폰</th>
										<th style="width: 60px;">IP</th>
										<th style="width: 80px;">관리</th>
									</tr>
								</thead>
								<tbody>
									<%
										/* if(rowcount > 0){ */
										pstmt = conn.prepareStatement(sql2);
										rs = pstmt.executeQuery();
										while (rs.next()) {
											String id = rs.getString(1);
											String pwd = rs.getString(2);
											String name = rs.getString(3);
											String email = rs.getString(4);
											String phone = rs.getString(5);
											String ip = rs.getString(6);
									%>
									<tr>
										<td>
											<h6><%=rs.getString("id")%></h6>
										</td>
										<td>
											<h6><%=rs.getString("pwd")%></h6>
										</td>
										<td>
											<h6><%=rs.getString("name")%></h6>
										</td>
										<td>
											<h6><%=rs.getString("email")%></h6>
										</td>
										<td>
											<h6><%=rs.getString("phone")%></h6>
										</td>
										<td>
											<h6><%=rs.getString("ip")%></h6>
										</td>
										<td class="d-flex ml-3 pt-2"><a
											class="btn btn-success btn-sm mr-3" type="button"
											href='MemberEdit.jsp?id=<%=rs.getString("id")%>'>수정</a> <a
											class="btn btn-danger btn-sm" type="button"
											href='MemberDelete.jsp?id=<%=rs.getString("id")%>'>삭제</a></td>
									</tr>
									<%
										}
									%>
								</tbody>

							</table>

							<%
								Singleton_Helper.close(rs);
								Singleton_Helper.close(pstmt);
							%>
						</div>
					</div>
				</div>
			</div>

			<div class="d-flex justify-content-center">
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
			</div>
		</div>

		<jsp:include page="/common/bottom.jsp"></jsp:include>


		<!-- Vendor JS Files -->
		<script src="assets/vendor/jquery/jquery.min.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
		<script src="assets/vendor/php-email-form/validate.js"></script>
		<script src="assets/vendor/wow/wow.min.js"></script>
		<script src="assets/vendor/venobox/venobox.min.js"></script>
		<script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
		<script src="assets/vendor/jquery-sticky/jquery.sticky.js"></script>
		<script src="assets/vendor/superfish/superfish.min.js"></script>
		<script src="assets/vendor/hoverIntent/hoverIntent.js"></script>

		<!-- Template Main JS File -->
		<script src="assets/js/main.js"></script>
</body>
</html>
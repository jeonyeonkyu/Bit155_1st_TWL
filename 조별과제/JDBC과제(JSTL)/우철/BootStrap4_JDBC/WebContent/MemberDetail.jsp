<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<c:if test="${sessionScope.userid == null}">
	<script>
		location.href = 'index.jsp'
	</script>
</c:if>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		conn = Singleton_Helper.getConnection("oracle");
		String sql = "select id,pwd,pwdcheck,name,email,phone from bituser where id=?";
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, id);

		rs = pstmt.executeQuery();

		//while(rs.next())
		rs.next(); //1건 데이터가 있다면 전제조건
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="author" content="Kodinger">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>My Login Page &mdash; Bootstrap 4 Login Page Snippet</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./assets/css/my-login.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>

<body class="my-login-page">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
				<div class="card-wrapper">
					<div class="brand">
						<a href="#"> <img src="./assets/img/thumbs.svg"
							alt="bootstrap 4 login page"></a>
					</div>
					<div class="card fat">
						<div class="card-body">
							<div class="mx-auto">
								<h4 class="card-title">내 정보</h4>
							</div>
							<!-- class="my-login-validation" -->
							<form action="MemberEditAction.jsp" method="post" name="joinForm"
								id="joinForm" onsubmit="return submitCheck();">
								<div class="form-group">
									<label for="id">아이디</label> <input class="form-control"
										type="text" name="id" value="<%=rs.getString("id")%>" readonly>
								</div>

								<div class="form-group">
									<label for="password">비밀번호</label> <input id="password"
										onchange="isSame()" type="text" class="form-control"
										name="password" value="<%=rs.getString("pwd")%>" readonly>
									<!-- <div class="invalid-feedback">비밀번호를 입력해주세요.</div>  -->
								</div>

								<div class="form-group">
									<label for="password">비밀번호 확인</label> <input id="passwordCheck"
										onchange="isSame()" type="text" class="form-control"
										name="passwordCheck" value="<%=rs.getString("pwdcheck")%>" readonly>
									<!-- 	<div class="invalid-feedback">비밀번호가 일치하지 않습니다. 다시 입력해주세요.</div> -->
									<div id="same"></div>

								</div>

								<div class="form-group">
									<label for="name">이름</label> <input id="name" type="text"
										class="form-control" name="name"
										value="<%=rs.getString("name")%>" readonly>
									<!-- 		<div class="invalid-feedback">이름을 입력해주세요.</div> -->
								</div>

								<div class="form-group">
									<label for="email">이메일 주소</label> <input id="email"
										type="email" class="form-control" name="email"
										value="<%=rs.getString("email")%>" readonly>

									<!-- <div class="invalid-feedback">사용할 수 없는 이메일 주소 입니다.</div> -->
								</div>

								<div class="form-group">
									<label for="password">핸드폰 번호 (-제외)</label> <input id="phone"
										type="password" class="form-control" name="phone"
										value="<%=rs.getString("phone")%>" readonly>
									<!-- <div class="invalid-feedback">핸드폰 번호가 일치하지 않습니다. 다시
										입력해주세요.</div> -->
								</div>

							</form>
							<%
								} catch (Exception e) {

								} finally {
									Singleton_Helper.close(rs);
									Singleton_Helper.close(pstmt);
								}
							%>


						</div>
					</div>
					<div class="footer">Copyright &copy; 2020 &mdash; 26.8조</div>
				</div>
			</div>
		</div>
	</section>


	<script>
		var flag = false;
		function isSame() {
			var pw = document.getElementById("password");
			var pwCheck = document.getElementById("passwordCheck");
			var same = document.getElementById("same");

			if (pw.value != '' && pwCheck.value != '') {
				if (pw.value == pwCheck.value) {
					same.innerHTML = '비밀번호가 일치합니다.';
					same.style.color = 'blue';
					flag = true;
				} else {
					same.innerHTML = '비밀번호가 일치하지 않습니다.';
					same.style.color = 'red';
					flag = false;
				}
			}
		}

		function submitCheck() {
			if (flag === false) {
				return false;
			} else {
				return true;
			}
		}

		
	</script>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script src="./assets/js/my-login.js"></script>
</body>
</html>
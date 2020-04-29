
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = null;
	id = (String) session.getAttribute("userid");
%>
<!-- ======= Header ======= -->
<header id="header">
	<div class="container">

		<div id="logo" class="pull-left">
			<h1>
				<a href="index.jsp" class="scrollto">Reve<span>al</span></a>
			</h1>
			<!-- Uncomment below if you prefer to use an image logo -->
			<!-- <a href="#topbar"><img src="assets/img/logo.png" alt=""></a>-->
		</div>

		<nav id="nav-menu-container">
			<ul class="nav-menu">
				<li class="menu-active"><a href="#topbar">Home</a></li>
				<li class="menu-has-children"><a href="">Member</a>
					<ul>
						<%
							if (session.getAttribute("userid") == null) {
						%>
						<li><a href="register.jsp">회원가입</a></li>
						<li><a href="login.jsp">로그인</a></li>
						<%
							} else {
								if (id.equals("admin")) {
						%>

						<li><a href="logout.jsp">로그아웃</a></li>
						<li><a href="Memberlist.jsp">회원관리</a></li>
						<%
							} else {
						%>
						<li><a href="MemberDetail.jsp?id=<%= session.getAttribute("userid") %>">내정보 보기</a></li>
						<li><a href="logout.jsp">로그아웃</a></li>
						<%
							}
							}
						%>
					</ul></li>
				<li class="menu-has-children d-flex">
					<%
						if (session.getAttribute("userid") != null) {
					%> <img
					src="./assets/img/user.svg" width="30px" height="30px"
					style="margin-top: 5px;"> <%
 	out.print("<div class='ml-2 mt-2'><b>[ " + session.getAttribute("userid") + " ]</b>&nbsp님</div>");
 %>
					<%
						}
					%>
				</li>
			</ul>
		</nav>
		<!-- #nav-menu-container -->
	</div>
</header>
<!-- End Header -->
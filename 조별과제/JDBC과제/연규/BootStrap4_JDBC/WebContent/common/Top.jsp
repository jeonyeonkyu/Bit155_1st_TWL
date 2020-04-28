
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
%>
<!-- ======= Header ======= -->
<header id="header">
	<div class="container">

		<div id="logo" class="pull-left">
			<h1>
				<a href="#topbar" class="scrollto">Reve<span>al</span></a>
			</h1>
			<!-- Uncomment below if you prefer to use an image logo -->
			<!-- <a href="#topbar"><img src="assets/img/logo.png" alt=""></a>-->
		</div>

		<nav id="nav-menu-container">
			<ul class="nav-menu">

				<li class="menu-active"><a href="#topbar">Home</a></li>
				<li class="menu-has-children"><a href="">Member</a>
					<ul>
						<li><a href="register.jsp">회원가입</a></li>
						<li><a href="login.jsp">로그인</a></li>
					</ul></li>
				<li>
					<%
						if (session.getAttribute("userid") != null) {
							out.print("<b>[ " + session.getAttribute("userid") + " ]</b> 로그인 상태");
							out.print("<a href='Ex02_JDBC_Logout.jsp'>[ 로그아웃 ]</a>");
						} else {
							out.print("<b>[로그인 하지 않으셨네요]</b>");
							out.print("<a href='Ex02_JDBC_Login.jsp'>[ 로그인 ]</a>");
						}
					%>

				</li>
			</ul>
		</nav>
		<!-- #nav-menu-container -->
	</div>
</header>
<!-- End Header -->
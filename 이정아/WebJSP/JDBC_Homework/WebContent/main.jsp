<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Reveal Bootstrap Template</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800|Montserrat:300,400,700"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/ionicons/css/ionicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="assets/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">
</head>

<body>
	<!-- ======= Header ======= -->
	<header id="header">
		<div class="container">
			<div id="logo" class="pull-left">
				<h1>
					<a href="#topbar" class="scrollto"> <img
						src="./assets/img/thumbs.svg">26.8<span>조</span></a>
				</h1>
			</div>
			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<li class="menu-active"><a href="#topbar">Home</a></li>
					<li><a href="login.jsp">로그인</a></li>
					<li><a href="register.jsp">회원가입</a></li>
					<li>
						<%
							if (session.getAttribute("userid") != null) {
							out.print("<b>[ " + session.getAttribute("userid") + " ]</b> 로그인 상태");
							out.print("<a href='Ex02_JDBC_Logout.jsp'>[ 로그아웃 ]</a>");
						} else {
							out.print("<b>[비회원 상태입니다.]</b>");
						}
						%>

					</li>
				</ul>
			</nav>
			<!-- #nav-menu-container -->
		</div>
	</header>
	<!-- End Header -->

	<!-- ======= Intro Section ======= -->
	<section id="intro">

		<div class="intro-content">
			<h2>
				환영합니다! 여기는 <span>26.8조</span>의<br> 홈페이지입니다!
			</h2>
			<div></div>
			<a href="#about" class="btn-get-started scrollto">Get Started</a> <a
				href="#portfolio" class="btn-projects scrollto">Our Projects</a>
		</div>
		</div>


		<div id="intro-carousel" class="owl-carousel">
			<div class="item"
				style="background-image: url('assets/img/intro-carousel/1.jpg');"></div>
			<div class="item"
				style="background-image: url('assets/img/intro-carousel/2.jpg');"></div>
			<div class="item"
				style="background-image: url('assets/img/intro-carousel/3.jpg');"></div>
			<div class="item"
				style="background-image: url('assets/img/intro-carousel/4.jpg');"></div>
			<div class="item"
				style="background-image: url('assets/img/intro-carousel/5.jpg');"></div>
		</div>

	</section>
	<!-- End Intro Section -->

	<!-- ======= Footer ======= -->
	<footer id="footer">
		<div class="container">
			<div class="copyright">
				&copy; Copyright <strong>26.8조</strong>. All Rights Reserved
			</div>
			<div class="credits">
				<!--
        All the links in the footer should remain intact.
        You can delete the links only if you purchased the pro version.
        Licensing information: https://bootstrapmade.com/license/
        Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Reveal
      -->
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

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
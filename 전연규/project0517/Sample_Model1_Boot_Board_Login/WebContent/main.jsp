<%@page import="board.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta content="charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- bootstrap file -->
<link rel="stylesheet" href="/BBS/css/bootstrap.css">
<link rel="stylesheet" href="/BBS/css/custom.css">

<title>Main</title>
</head>
<body>
<%
	String memID = null;
	if(session.getAttribute("memID") != null){
		memID = (String) session.getAttribute("memID");
	}
%>
<!-- google jquery file -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/BBS/js/bootstrap.js"></script>


<!-- https://www.w3schools.com/bootstrap4/bootstrap_navbar.asp 메뉴바 w3schools.com-->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="/BBS/main.jsp">JSP Web</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="/BBS/main.jsp">메인</a></li>
				<li class="nav-item"><a class="nav-link" href="/BBS/board/board.jsp">게시판</a></li>
			</ul>
			<%
				//세션 (회원가입 후)
				if(memID == null){
			%>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown">접속하기</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="/BBS/member/login.jsp">로그인</a> 
						<a class="dropdown-item" href="/BBS/member/join.jsp">회원가입</a> 
					</div>
				</li>
			</ul>
			<%
				} else {
			%>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown">회원관리</a>
					<div class="dropdown-menu">
						<a class="dropdown-item active" href="/BBS/member/logoutAction.jsp">로그아웃</a> 
					</div>
				</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<br>

<div class="container">
  <div class="jumbotron">
    <h1>JSP WEB PAGE</h1>      
    <p>해당페이지는 부트스트랩4와 JSP를 이용한 홈페이지입니다.
        오라클, 이클립스, 윈도우, CSS, HTML, JS, Jquery를 
        이용하였습니다.
    </p>
    <p><a class="btn btn-success float-left" href="#">자세히 알아보기</a></p>
  </div>   
</div>

<div id="realtime" class="container">
  <h2>실시간 게시글</h2>
  <ul class="list-group">
    <li class="list-group-item">First item</li>
    <li class="list-group-item">Second item</li>
    <li class="list-group-item">Third item</li>
  </ul>
</div>

<br>

<div class="container">
		<div id="myCarousel" class="carousel text-center" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="/BBS/img/img1.jpg" width="1100" height="500">
				</div>
				<div class="carousel-item">
					<img src="/BBS/img/img2.jpg" width="1100" height="500">
				</div>
				<div class="carousel-item">
					<img src="/BBS/img/img3.jpg" width="1100" height="500">
				</div>
			</div>
			
			<a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a>
			<a class="carousel-control-next" href="#myCarousel" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>
	</div>
	<script>
		$(document).ready(function(){
			getAjaxList();
		});
		
		function getAjaxList(){
			$.ajax({
				type:"GET",
				url:"ABoardList",
				dataType: "json",
				success:function(data){
					//var obj = JSON.parse(data);
					//console.log(obj);
					//console.log(obj[0].bdTitle);
					var list = document.querySelectorAll('#realtime .list-group-item');
					list[0].textContent = data[0].bdTitle;
					list[1].textContent = data[1].bdTitle;
					list[2].textContent = data[2].bdTitle;
				}
			});
		}
		
		setInterval(getAjaxList,5000);
	</script>
</body>
</html>
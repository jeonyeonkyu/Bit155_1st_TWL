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

<title>Login</title>
</head>
<body>
<%  //1. 로긴을 한 상태(session), 2. 로긴을 안한 상태(x)
	String memID = null;
	if(session.getAttribute("memID") != null){
		//로그인을 한 상태!!
		memID = (String) session.getAttribute("memID");
	}
	
	//2. 쿠키 확인
	String cookieID = null;
	Cookie[] cookies = request.getCookies();
	
	for(Cookie c : cookies){
		System.out.println("쿠키아이디 : "+c.getValue());
		if(c.getName().equals("cookieID")){
			//엘레멘트 찾아서 넣어주면 됨.
			cookieID = c.getValue();	
		}
	}
%>
<!-- google jquery file -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/BBS/js/bootstrap.js"></script>


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

<!-- 로그인 화면 만들기 (그리드 시스템) -->
<div class="container"> <!-- container-fluid -->
	<div class="row"> <!-- 12칸 분활됨. --> 
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<form action="/BBS/member/loginAction.jsp" method="post">
				<h1 style="text-align:center">로그인</h1>
				<%
					if(cookieID != null){
				%>
				<input id="id" value="<%=cookieID %>" class="form-control" type="text" name="memID" placeholder="Your id" maxlength="20" required autofocus>
				<%
					}else{
				%>
				<input id="id" class="form-control" type="text" name="memID" placeholder="Your id" maxlength="20" required autofocus>
				<%
					}
				%>
				<input class="form-control form-pw" type="password" name="memPW" placeholder="Your password" maxlength="20" required>
      			<label>
       				 <input type="checkbox" name="saveID" value="on">Remember ID
      			</label>
				<button class="btn btn-primary float-right" type="submit">Login</button>
				<button class="naver-login">naver login</button>
			</form>
		</div>
		<div class="col-lg-2"></div>
	</div>
</div>

<!-- <img class="float-right" src="/BBS/img/naver_login.png" height="36" width="90" > -->
</body>
</html>
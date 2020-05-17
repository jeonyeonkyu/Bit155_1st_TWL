<%@page import="member.Member"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.io.PrintWriter"%>
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
<%
	String memID = null;
	//세션받기
	if(session.getAttribute("memID") != null){
		memID = (String) session.getAttribute("memID");	
	}
	
	System.out.println("memID : "+memID);
	if(memID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = '/BBS/member/login.jsp'");
		script.println("</script>");
	}
	
	//MemberDAO 객체 생성
	MemberDAO memberDAO = new MemberDAO();
	
	//select함수 만들어서 호출(매개변수 : memID)
	Member member = memberDAO.selectOne(memID);
	
	//결과를 Member 타입으로 받아서 아래에 input tag에 뿌려주기	
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
				<h1 style="text-align:center">회원정보</h1>
				<input class="form-control" type="text" name="memID" value="<%=memID %>">
				<input class="form-control" type="text" name="memName" value="<%=member.getMemName() %>">
				<input class="form-control" type="text" name="memGender" value="<%=member.getMemGender() %>">
				<input class="form-control" type="text" name="memEmail" value="<%=member.getMemEmail() %>">
				<!-- 해당 버튼이 클릭되면  main.jsp -->
				<a class="btn btn-primary btn-block" href="/BBS/main.jsp">Back</a>			
		</div>
		<div class="col-lg-2"></div>
	</div>
</div>








</body>
</html>
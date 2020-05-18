<%@page import="util.ReplaceHtml"%>
<%@page import="board.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
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

<!-- google jquery file -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/BBS/js/bootstrap.js"></script>

<%  //1. 로긴을 한 상태(session), 2. 로긴을 안한 상태(x)
	String memID = null;
	if(session.getAttribute("memID") != null){
		//로그인을 한 상태!!
		memID = (String) session.getAttribute("memID");
	}
	
	//2. 페이지 넘버 만들기
	int pageNum = 1;
	if(request.getParameter("pageNum") != null){
		pageNum = 
				Integer.parseInt(request.getParameter("pageNum"));
	}
	
	//3. 검색인지 기본인지 구분하기 기본1 검색2
	String data = null;
	if(request.getParameter("data") != null && !request.getParameter("data").equals("")){
		data = request.getParameter("data");
	}
	
%>

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
	<div class="row"> <!-- 12개의 칼럼 -->
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<div class="float-right">
			<form class="form-inline" action="/BBS/board/board.jsp" method="GET">
    			<input class="form-control mr-sm-2" name="data" type="text" placeholder="검색">
    			<input type="hidden" name="pageNum" value="1">
    			<button class="btn btn-success" type="submit">검색</button>
 	 		</form>
 	 		</div>
 	 		<br><br>
			<table class="table table-striped" style="border:1px solid #dddddd">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
				<%
					BoardDAO boardDAO = new BoardDAO();
					ArrayList<Board> list;
					if(data == null){
						list = boardDAO.getList(pageNum);
					}else{
						list = boardDAO.getSearchList(pageNum,data);
					}
					
					for(Board b : list){
				%>
					<tr>
						<td><%=b.getBdID() %></td>
						<td>
							<a href="/BBS/board/view.jsp?bdID=<%=b.getBdID()%>">
								<%=ReplaceHtml.getCode(b.getBdTitle()) %>
							</a>
						</td>
						<td><%=b.getMemID() %></td>
						<td><%=b.getBdDate() %></td>
					</tr>
				<%
					}
				%>
				</tbody>
			</table>
			<%
				if(data == null){
			%>
				<%
					if(pageNum != 1){
				%>
				<a class="btn btn-success" href="/BBS/board/board.jsp?pageNum=<%=pageNum-1%>" style="margin:2px">이전</a>
				<%
					}
					if(boardDAO.nextPage(pageNum+1)){
				%>
				<a class="btn btn-success" href="/BBS/board/board.jsp?pageNum=<%=pageNum+1%>" style="margin:2px">다음</a>
				<%
					}
				%>
			<%		
				}else{
			%>	
				<%
					if(pageNum != 1){
				%>
				<a class="btn btn-success" href="/BBS/board/board.jsp?pageNum=<%=pageNum-1%>&data=<%=data %>" style="margin:2px">이전</a>
				<%
					}
					if(boardDAO.nextPage_search(pageNum+1,data)){
				%>
				<a class="btn btn-success" href="/BBS/board/board.jsp?pageNum=<%=pageNum+1%>&data=<%=data %>" style="margin:2px">다음</a>
				<%
					}
				%>
			<%
				}
			%>
			
			
			<a class="btn btn-primary float-right" href="/BBS/board/write.jsp" style="margin:2px">글쓰기</a>
		</div>
		<div class="col-lg-2"></div>
	</div>
</div>












</body>
</html>
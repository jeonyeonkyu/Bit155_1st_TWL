<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Servlet TEST</title>
</head>
<body>
	<h3>servlet 요청하기 </h3>
	<h3>getContextPath() : <%=request.getContextPath() %></h3>
	<!-- /WebServlet_1  이게 받아보는 경로다 -->
	<a href="<%= request.getContextPath() %>/simple">일반 요청하기 </a>
	<br>
	<a href="<%=request.getContextPath() %>/simple?type=date">날짜 요청하기</a>
	<br>
	<a href="<%=request.getContextPath() %>/simple?type=abcd">비정상요청하기 </a>
	<br>
	<hr>
	
	<h3>FrontBoardController 사용하기</h3>
	<a href="<%= request.getContextPath() %>/board?cmd=boardlist">게시판 목록보기 </a>
	<br>
	<a href="<%= request.getContextPath() %>/board?cmd=boardwrite">게시판 글쓰기 </a>
	<br>
    <a href="<%= request.getContextPath() %>/board">error 유도하기 </a>
    <br>
    <a href="<%= request.getContextPath() %>/board?cmd=boarddelete">게시판 삭제하기  </a>
    <br>
     <a href="<%= request.getContextPath() %>/board?cmd=login">페이지 보안(로그인)  </a>
     
     <br>
     <hr>
     <h3>FrontServletController 사용하기</h3>
     <a href="<%= request.getContextPath() %>/action.do?cmd=greeting">요청보내기 </a>
</body>
</html>
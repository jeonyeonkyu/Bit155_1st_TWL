<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Servlet TEST</title>
</head>
<body>
	<h3>servlet 요청하기</h3>
	<h3>getContextPath() ; <%=request.getContextPath() %></h3>
	<!-- getContextPath() >> /WebServlet_1 -->
	<a href="<%=request.getContextPath() %>/simple">일반 요청하기</a>
	<br>
	<a href="<%=request.getContextPath() %>/simple?type=date">날짜 요청하기</a>
	<br>
	<a href="<%=request.getContextPath() %>/simple?type=abcd">비정상 요청하기</a>
	<br>
	<hr>
	<h3>FrontBoardController 사용</h3>
	<a href="<%=request.getContextPath()%>/board?cmd=boardlist">게시판 목록 보기</a>
	<br>
	<a href="<%=request.getContextPath()%>/board?cmd=boardwrite">게시판 글쓰기</a>
	<br>
	<a href="<%=request.getContextPath()%>/board">Error 유도</a>
	<br>
	<a href="<%=request.getContextPath()%>/board?cmd=boarddelete">게시판 삭제하기</a>
	<br>
	<a href="<%=request.getContextPath()%>/board?cmd=Login">페이지 보안 (로그인 처리)</a>
	<br>
	<hr>
	<h3>FrontServletController 사용</h3>
	<a href="<%=request.getContextPath()%>/action.do?cmd=greeting">요청 보내기</a>
	<br>
</body>
</html>


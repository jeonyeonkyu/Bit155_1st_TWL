<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Servlet TEST</title>
</head>
<body>
	<h3>servlet 요청하기</h3>
	<h3>getContextPath() : <%= request.getContextPath() %> -> 경로를 뽑아내는 함수</h3> <!-- /WebServlet_1  -->
	<a href="<%= request.getContextPath() %>/simple">일반 요청하기</a>
	<br>
	<a href="<%= request.getContextPath() %>/simple?type=date">날짜 요청하기</a>
	<br>
	<a href="<%= request.getContextPath() %>/simple?type=abcd">비정상 요청하기</a>
	<br>
	<hr>
	<h3>FrontBoardController의 역할 살펴보기</h3>
	<a href="<%= request.getContextPath() %>/board?cmd=boardlist">게시판 목록보기</a>
	<br>
	<a href="<%= request.getContextPath() %>/board?cmd=boardwrite">게시판 글쓰기</a>
	<br>
	<a href="<%= request.getContextPath() %>/board">파라미터에 아무것도 입력 안하는걸로 에러 발생시켜보기(에러페이지로 잘 넘어가는지)</a>
	<br>
	<a href="<%= request.getContextPath() %>/board?cmd=boarddelete">게시판 삭제라는게 없는게 넣어보기(에러나올듯)</a>
	<br>
	<a href="<%= request.getContextPath() %>/board?cmd=login">페이지 보안(로그인처리)</a>
	<br>
	<hr>
	<h3>FrontServletController의 역할 살펴보기</h3>
	<a href="<%= request.getContextPath() %>/action.do?cmd=greeting">요청보내기</a>
	
</body>
</html>
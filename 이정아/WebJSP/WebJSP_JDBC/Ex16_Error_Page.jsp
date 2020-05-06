<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		404에러 : 요청페이지 없음
		500에러 : 서버 코드문제 (ex: 0으로 나누기, null에 대한 문제...)
	 -->
		<% String data = request.getParameter("name").toLowerCase(); %>
		전달받은 내용 : <%= data %>
</body>
</html>
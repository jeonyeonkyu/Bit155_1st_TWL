<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>FrontServletControlloer 에 의해서 forward 된 페이지</h3>
	기존 : <%= request.getAttribute("msg") %><br>
	지금은 EL&JSTL : ${requestScope.msg}<br>
</body>
</html>
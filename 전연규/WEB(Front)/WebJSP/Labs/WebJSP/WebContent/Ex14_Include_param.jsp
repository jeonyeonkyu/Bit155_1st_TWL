<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h3>request 객체(include) 된 페이지에서는 [공유]</h3>
	<hr />
		<%= request.getParameter("type") %> <br />	
		<%= request.getParameter("userid") %> <br />
		<jsp:include page="Ex14_param.jsp"></jsp:include>
		<!-- 그리고 .. 다른 기능,... 값을  -->
		<jsp:param value="baseball" name="hobby"/>
		<jsp:param value="baseball" name="hobby"/>
		
		
	<hr />
	
</body>
</html>
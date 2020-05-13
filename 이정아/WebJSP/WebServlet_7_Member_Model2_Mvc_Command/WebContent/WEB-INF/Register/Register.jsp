<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%= request.getContextPath() %>/Register.do?cmd=registerok" method="post"> <!-- request.getContextPath() 이게 가상경로라서 다른데서 임포트해도 자동으로 경로를 끌고와줌 -->
		ID: <input type="text" name="id" placeholder="id입력"><br>
		PWD:<input type="password" name="pwd" placeholder="pwd입력"><br>
		EMAIL:<input type="text" name="email" placeholder="email입력"><br>
		<input type="submit" value="회원가입">	
	</form>
</body>
</html>
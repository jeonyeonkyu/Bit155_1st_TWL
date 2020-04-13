<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//JAVA 코드(Back 단 코드 : 서버에서 동작(컴파일) 되는 코드)
	//목적지 주소(Form action="Ex14_Login.jsp")
	//클라이언트가 가지고 있는 데이터를 받아서 처리 ....
	String userID = request.getParameter("userID");
	String userPW = request.getParameter("userPW");
	
	//실제 로그인 처리
	//JDBC 사용 >> DB 연결 >> select ... ? >> 회원인지 아닌지 판단 >> Client에게 응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
</head>
<body>
	<h3>당신이 입력한 데이터</h3>
	ID : <%=userID %>
	PW : <%=userPW %>
	
</body>
</html>
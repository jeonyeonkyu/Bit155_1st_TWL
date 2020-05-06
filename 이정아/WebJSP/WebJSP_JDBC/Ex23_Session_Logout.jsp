<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//로그아웃 개념은 (sessionID에 해당하는 session 객체 소멸)
	session.invalidate(); //서버에 있는 session 객체를 통째로 소멸시키는 것.
	out.print("<script>location.href = 'Ex23_Session_Login.jsp'</script>");
	
	//session.removeAttribute(name); //session 객체 안의 특정 변수만 소멸시키는 것

 %>
</body>
</html>
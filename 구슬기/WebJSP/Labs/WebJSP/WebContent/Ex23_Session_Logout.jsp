<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
<%
	//로그아웃 (sessionID에 해당하는 session 객체를 소멸)
	session.invalidate(); //server 객체 소멸
	out.print("<script>location.href='Ex23_Session_Login.jsp'</script>");
	
	//session.removeAttribute("memberid") //객체 안에 있는 특정 변수만 소멸 . 필요에 따라 골라쓰세요.
%>

</body>
</html>
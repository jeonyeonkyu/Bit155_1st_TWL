<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

String uid = request.getParameter("userId");
String uname = request.getParameter("userName");
String upwd = request.getParameter("userPass");
String upwdcheck = request.getParameter("userPassCheck");
String gender = request.getParameter("gender");
String uemail = request.getParameter("userEmail");
 

String[] hobby = request.getParameterValues("hobby");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	아이디 = <%=uid %> <br />
	   이름 = <%=uname %> <br />
	패스워드  = <%=upwd %> <br />
	패스워드체크 = <%=upwdcheck %> <br />
	성별 = <%=gender %> <br />
	아이디 = <%=uid %> <br />
	아이디 = <%=uid %> <br />
	
</body>
</html>
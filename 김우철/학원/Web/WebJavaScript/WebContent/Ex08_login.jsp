<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //name="txtuserid"
    //name="txtpwd" id="txtpwd"
    //Ex08_login.jsp?txtuserid=hong&txtpwd=1004
    	String id = request.getParameter("txtuserid");
    	String pwd = request.getParameter("txtpwd");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
서버전송완료.
<%=id %>
<%=pwd %>
</body>
</html>
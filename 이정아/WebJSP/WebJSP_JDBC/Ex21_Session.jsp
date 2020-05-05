<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<!-- Session 객체 : 브라우져(접속한 사용자)마다 서버에서 고유하게 부여하는 고유한 객체 (유일값을 보장한다)

	session 값 : 웹 서버가 접속한 클라이언트(브라우져)에게 부여하는 고유한 아이디 값(식별값)
	
	A사용자 : 웹 서버에 접속을 하면 서버에서 session 객체를 생성한다. 그리고 이 session 객체에 고유한 ID값을 부여한다. 그리고 이 ID값을 접속한 A사용자의 웹브라우저(클라이언트)에 response
	B사용자 : 웹 서버에 접속을 하면 서버에서 session 객체를 생성한다. 그리고 이 session 객체에 고유한 ID값을 부여한다. 그리고 이 ID값을 접속한 A사용자의 웹브라우저(클라이언트)에 response
	
	
	각 접속한 사용자의 고유정보(공유되지 않는 고유한 정보) >>쇼핑몰에서 구매한 물건에 대한 정보, 로그인한 아이디 정보...
	처음 접속한 시간, 마지막 접속한 시간
	
 -->
 <%
 
 Date date = new Date();
 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 
 %>
<h3> 세션 정보 </h3>
session객체의 식별값 : <%= session.getId() %> <br>
<!-- 3E20DD822B5D88AFB5095D7D90873446 -->
<hr>
<%

date.setTime(session.getCreationTime()); //세션이 만들어진 시간

%>	
[session이 생성된 시간] : <%= formatter.format(date) %>
<hr>
<%
	date.setTime(session.getLastAccessedTime()); 

%>
[session의 마지막 접속 시간(client가)] : <%= formatter.format(date) %> <!-- 마지막으로 접속한 시간 -->
</body>
</html>




















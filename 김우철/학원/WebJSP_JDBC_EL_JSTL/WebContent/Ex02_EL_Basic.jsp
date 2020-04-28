<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    	//EL : 출력하는 script (서버쪽 자원) << <%= 를 대체하는 스크립트
    	//EL을 사용한다고 해서 모든 자바객체를 지원하는 것은 아니다
    	Date today = new Date();
    	request.setAttribute("day", today);
    	session.setAttribute("day2", today);
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>EL의 목적은 화면 출력</h3>
	<%= request.getAttribute("day") %><br>
	EL(추천) : ${requestScope.day}<br>
	EL : ${day}<br> <!-- 이런식으로 생략하면 request인지 session인지 처음엔 잘 모름 -->
	Session EL : ${sessionScope.day2}<br>
	<!-- EL : WAS안에 들어있는 서버쪽 자원을 해석(출력)하는 스크립트 -->
</body>
</html>


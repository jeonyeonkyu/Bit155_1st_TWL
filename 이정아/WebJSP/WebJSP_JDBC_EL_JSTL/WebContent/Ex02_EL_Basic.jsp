<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   		//EL은 "출력"을 담당하는 스크립트이다. (서버쪽 자원을 출력하는 스크립트 = EL = <%= 을 대체)
   		//EL을 사용한다고 해서 모든 자바코드를 대체 할 수 있는 것은 아니다.
   		
   		Date today = new Date();
   		request.setAttribute("day", today);
   		session.setAttribute("day2", today);
   %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL의 목적은 화면출력이다.</h3>
	<%= request.getAttribute("day") %><br> <!-- 이 방식 추천 -->
	${requestScope.day}<br>
	${day}<br>
	
	${sessionScope.day2}<br>
	${day2}<br>
</body>
</html>
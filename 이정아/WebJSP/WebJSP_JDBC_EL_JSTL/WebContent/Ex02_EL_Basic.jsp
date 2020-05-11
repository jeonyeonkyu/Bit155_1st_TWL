<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//EL 출력 담당하는 script (서버쪽 자원) >> <%= 대체 해줌!
	//EL 사용한다고 해서 모든 JAVA 객체를 지원하는 것은 아니다. 
	
	Date today = new Date();
	request.setAttribute("day", today);    //day 라는 키값으로 오늘 날짜를 저장합니다.
	session.setAttribute("day2", today);
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>EL 목적 (화면 출력)</h3>

<%= request.getAttribute("day")  %> <br>

생략해도 문제는 없지만, 나중에 볼때 헷갈리니까 습관적으로 생략하지 않은 코드를 쓰자 . <br>
EL : ${requestScope.day}<br>
EL : ${day} <br>
Session EL : ${sessionScope.day2}<br>
Session EL : ${day2}<br>


</body>
</html>
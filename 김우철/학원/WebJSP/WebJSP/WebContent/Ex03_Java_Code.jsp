<%@page import="kr.or.bit.Emp" %>
<%@page import="java.util.*;" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	Emp e = new Emp();
	e.setEmpno(1000);
	e.setEname("홍길동");
	
	//Calendar 객체 만들고
	//화면에 년 월 일 출력
	
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	int date = cal.get(Calendar.DATE);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
출력 표현식<br>
사번:<%=e.getEmpno() %>
이름:<%=e.getEname() %>
전체:<%=e.toString() %>
<hr>
현재 날짜 : <%=year %>년 <%=month %>월 <%=date %>일
</body>
</html>
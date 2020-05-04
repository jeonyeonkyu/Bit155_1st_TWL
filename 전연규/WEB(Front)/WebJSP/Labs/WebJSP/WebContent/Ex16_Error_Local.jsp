<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page errorPage = "/error/commonError.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 페이지 마다 고유한 에러 페이지 설정
	
		설정 : 최종 배포시 하시는 것이 ^^
		
		고민 : 모든 페이지에 설정 >> 안하고 >> 전역 (web.xml)에다가 설정  >> 자동적용(페이지마다 설정하지 않고도)
	  -->
		
	<%
		String data = request.getParameter("name").toLowerCase();
	
	%>
	전달받은 내용 : <%= data %>
</body>
</html>
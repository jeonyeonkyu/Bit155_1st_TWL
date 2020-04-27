<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="./error/commonError.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--
	페이지 마다 고유한 에러 페이지 설정
	설정 : 최종 배포시 하는것이 좋음.
	그전까지는 에러를 봐야됨
	
	고민 : 모든 페이지에 설정 X >> 전역적으로 설정 가능(web.xml) 설정 >> 자동적용
	
	
	
	
  -->
  <%
  	String data = request.getParameter("name").toLowerCase();
  %>
  전달받은 내용 : <%= data %>
</body>
</html>
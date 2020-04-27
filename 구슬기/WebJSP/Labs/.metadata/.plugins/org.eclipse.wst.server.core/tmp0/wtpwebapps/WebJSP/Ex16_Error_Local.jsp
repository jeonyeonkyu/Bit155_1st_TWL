<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page errorPage="/error/commonError.jsp" %>  <!--  web.xml 에서 전역설정해놔도 안쪽꺼가 우선순위 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
</head>
<body>

<!-- 
	페이지 마다 고유한 에러 페이지 설정
 -->
 
 
 <%
 	String data=request.getParameter("name").toLowerCase();
 %>
 클라이언트가 전달 받은 내용 :   <%= data %>
 
 error 500 나오면 개발자 실수 안좋은 에러임 
 
 
 commonError 에러처리는 최종배포시에하는것이 좋음 
 
 
 
 고민~~~ 모든 페이지에 설정 해야하나?  안하고 >> WEB-INF 폴더 안의 전역(web.xml) 설정>> 자동적용 
 
 
</body>
</html>
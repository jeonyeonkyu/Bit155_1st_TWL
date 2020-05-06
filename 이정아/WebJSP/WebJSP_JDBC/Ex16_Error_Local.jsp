<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page errorPage="/error/commonError.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 페이지마다 고유한 에러에 대한 페이지를 설정 할 수 있다.
		그러나 개발시에는 에러를 봐야하므로 에러페이지 설정은 최종 배포시에 한다.
		
		고민 : 그런데 모든 페이지마다 에러 페이지에 대한 설정을 해야하나?
		NONONO 전역적으로 설정이 가능하다. web.xml에다가!
	 -->
	<% String data = request.getParameter("name").toLowerCase(); %>
	전달받은 내용 : <%= data %>
</body>
</html>
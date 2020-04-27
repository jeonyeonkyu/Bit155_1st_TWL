<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error web.xml (전역설정)사용</title>
</head>
<body>
<!-- 
		404 : 요청페이지 없는것
		500 : 서버쪽 코드 문제 > 0으로 나누는 것, null 처리 연산, 함수
 -->


<%
 	String data=request.getParameter("name").toLowerCase();
 %>
 클라이언트가 전달 받은 내용 :   <%= data %>
 
 
 
 <!--  
     http://192.168.0.25:8090/WebJSP/EX16_Error_Page1.jsp 이러면 404 뜸
  -->

</body>
</html>
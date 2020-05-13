<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	/* 
 		요청에 대한 흐름 제어
 		
 		**include
 		**forward
 		
 		공통점 : request 객체를 공유한다
 		차이점 : include 제어권 가지고 있다 
 			  forward 제어권을 넘겨준다 (POINT : 요청 주소는 동일한데 다른 Page 의 내용을 서비스)
 			  why ? 처음 요청했던 주소의 Buffer 를 그대로 사용
 			 192.168.0.12:8090/WebJSP/login.jsp ..... forward >> A.jsp, B.jsp, C.jsp ...
 		담는 그릇은 login.jsp 이지만 내용은 A.jsp, B.jsp, C.jsp 중에 하나일수 있다
 		
 		http://192.168.0.169:8090/WebJSP/Ex15_forward_main.jsp?code=A
 		code=C 값에 따라서 forward 페이지가 달라진다^^
 		
 	*/
 	String code= request.getParameter("code");
 String viewURI = null;
 if(code.equals("A")){
	 viewURI ="/forward/A.jsp";
			 // /표시는 웹컨텐트
 }else if(code.equals("B")){
	 viewURI = "/forward/B.jsp";
 }else if(code.equals("C")){
	 viewURI = "/forward/C.jsp";
 }
 %>
 <jsp:forward page="<%=viewURI %>"></jsp:forward>
 <!-- 아래 코드가 의미가 있을까????? -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	나는 forward 페이지 입니다 ^^
</body>
</html>
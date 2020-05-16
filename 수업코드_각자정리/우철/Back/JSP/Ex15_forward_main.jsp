<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	/*
    	forward ★★★★ (스프링에도 또나옴) : controller가 하는 방식임
    		요청에 대한 흐름 제어
    		
    		include
    		forward
    		
    		공통점 : request 객체를 공유한다.
    		차이점 : include는 제어권을 가지고 있다.
    		       forward는 제어권을 넘겨준다.(POINT : 요청 주소는 동일한데 다른 Page의 내용을 서비스 할 수 있음)
    		       - 상황에 따라 클라이언트가 바라보는 내용이 달라짐
    		       why ? : 처음 요청했던 주소의 Buffer를 그대로 사용
    		    	192.168.0.12:8090/WebJSP/login.jsp ..... forward >> A.jsp, B.jsp, C.jsp
    				담는 그릇은 login.jsp 이지만 내용은 A.jsp or B.jsp or C.jsp 
    				
    				http://192.168.0.62:8090/WebJSP/Ex15_forward_main.jsp?code=B
    				code값에 따라서 forward 페이지를 달리할 수 있음
    		    		 
    	*/
    	String code = request.getParameter("code");
    	String viewURI = null;
    	if(code.equals("A")){
    		viewURI = "/forward/A.jsp";
    	}else if(code.equals("B")){
    		viewURI = "/forward/B.jsp";
    	}else if(code.equals("C")){
    		viewURI = "/forward/C.jsp";
    	}
    %>
<jsp:forward page="<%=viewURI%>"></jsp:forward>
<!-- 아래 코드가 의미가 있을까 ????  -->
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
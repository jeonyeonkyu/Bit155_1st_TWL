<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	/*
    		요청에 대한 흐름제어
    		
    		include :  
    		forward :
    			
    		공통점 : request 객체를 공유 할 수 있다.
    		차이점 : include는 제어권을 다시 가져오지만, forward는 제어권을 넘겨준다. (forward를 만나면 그 페이지로 넘어가고, 다시 원래 페이지로 돌아오지 않음 but 요청 주소는 동일함) 주소는 동일, 다른페이지 내용을 서비스
    		
    		왜? 처음에 요청했던 주소의 Buffer를 그대로 사용한다.
    				192.168.0.12:8090/WebJSP/login.jsp..... 요청을 보냈는데 forward가 A.jsp에 걸려있다면(혹은 B.jsp, C.jsp에 걸려있다면)
    				실제 클라이언트가 요청했던건 login.jsp이므로, login.jsp그릇(주소)에 담겨지지만, 내용은 A.jsp 혹은 B.jsp, C.jsp가 담긴다.
    				
    				http://192.168.0.213:8090/WebJSP/Ex15_forward_main.jsp?code=A ->마지막 파라미터 값에 따라서 보여지는 페이지의 내용이 달라진다.
    				요청 주소는 http://192.168.0.213:8090/WebJSP/Ex15_forward_main.jsp로 동일ㅁ12	`   				
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
    <jsp:forward page="<%= viewURI %>"></jsp:forward>
    <!-- 아래의 코드가 의미가 있을까? -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	나는 forward 페이지 입니다. <!-- 이 내용은 의미가 없다. forward를 만나면서 이 내용은 버려지기 때문. -->
</body>
</html>
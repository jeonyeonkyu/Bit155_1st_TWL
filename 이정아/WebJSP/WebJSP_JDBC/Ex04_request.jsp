<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% //1. 한글처리(페이지 상단에 제일 먼저 하기!)
    	request.setCharacterEncoding("UTF-8");
    	String id = request.getParameter("id");
    	/*
    		WAS가 내장하고 있는 request라는 객체를 쓴 것
    		[JSP 파일에서는 Default로 내장객체를 선언 없이 사용 할 수 있다.]
    		
    		***request 객체(요청객체)
    		1. 요청페이지당 한개의 request 객체가 생성이 된다. 중요!
    		2. 클라이언트의 정보를 서버에서 read 할 수 있다. (request 객체를 사용하면) 클라이언트가 서버로 정보를 전송 할 때 입력값, ip, 브라우저의 버전 등을 같이 보내므로
    		
    		request 내장객체는 클라이언트에서 서버로 요청 할 때 생성되는
    		HttpServletRequest 라는 타입을 갖는 객체가 자동 생성되고, 그 주소를 request가 참조한다. 자동으로 new하지 않아도 만들어짐
    	
    	*/
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
id : <%=id %><hr>
접속한 클라이언트 IP : <%= request.getRemoteAddr() %> <br>
서버(요청한 방식: 인코딩 방식) : <%= request.getCharacterEncoding() %><br>
전송방식 : <%= request.getMethod()%><br>
포트번호 : <%= request.getServerPort() %><br>
context root(홈 디렉토리, 가상 디렉토리, 웹경로) : <%= request.getContextPath() %>

<!-- request.getContextPath()
	는 가상경로를 가져오는 함수인데, 웹에서 받아보는 경로라고 한다.
	가상경로라고 하는 이유는 실제경로가 따로 있기 때문이다.
	
	http://192.168.0.213:8090/WebJSP/Ex04_request.jsp
	
	/WebJSP 서비스 하는 내용은 어디에 들어있을까?
	C:\Users\bitcamp\Desktop\공부내용 깃\이정아\WebJSP\WebJSP\WebContent 여기에 들어있음!
	/WebJSP는 이 경로를 줄여서 표현한 것
	이 실경로가 필요할 때는 실제로 파일 업로드를 할 때 필요하다.
	
 -->
 <br>
 <%= request.getRequestURI() %>
 <!-- /WebJSP/Ex04_request.jsp 현재 서비스 중인 페이지의 경로 -->

</body>
</html>




















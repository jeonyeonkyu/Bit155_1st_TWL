<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//1. 한글처리(페이지 상단에)
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	/*
		WAS 내장하고 있는 request 객체
		[JSP 파일에서는 Default 내장객체 선언없이 사용 가능]
				
		request 객체(요청 객체)
		1. 요청 페이지당 한개의 request 객체 생성(^^**)
		2. 클라이언트의 정보(입력값, IP, 브라우져 버전)를 서버 read(request)
		
		request 내장 객체는 클라이언트에서 서버로 요청할때 생성되는 
		HttpServletRequest 타입을 갖는 객체가 자동 생성되고 그 주소를 request 참조
		
	*/
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	id:<%=id%><hr>
	접속한 클라이언트 IP : <%=request.getRemoteAddr() %> <br />
	서버(요청한 방식 : 인코딩) : <%= request.getCharacterEncoding() %> <br />
	전송방식: <%= request.getMethod() %> <br />
	포트 : <%= request.getServerPort() %> <br />
	context root (홈 디렉토리, 가상디렉토리, 웹 경로) : <%=request.getContextPath() %> <br />
	
	<!--
		request.getContextPath()
		가상경로(웹 경로) :/WebJSP
		실경로 : D:\bit155\WebJSP\Labs\WebJSP
		
		http://192.168.0.169:8090/WebJSP/Ex04_request.jsp
		/WebJSP 서비스하는 내용 : D:\bit155\WebJSP\Labs\WebJSP\WebContent
		
		파일 업로드(실경로) >> 웹 경로(가상) >> 실경로
		
	 -->
	 <%= request.getRequestURI()%>
	 <!-- /WebJSP/Ex04_request.jsp -->
</body>
</html>
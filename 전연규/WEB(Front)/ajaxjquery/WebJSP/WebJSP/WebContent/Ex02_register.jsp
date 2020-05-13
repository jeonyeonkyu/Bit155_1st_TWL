<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//서버(객체 제공)
	//아파치 톰켓 : 웹 전용 객체를 제공(request, response) : 내장객체(new 없이 사용 가능)
	//request 요청 객체(클라이언트 정보를 얻음(입력한 데이터, 브라우저 버전, IP정보 등))
	//response 응답 객체(서버.. 클라이언트에게 write ....)
	

	//클라이언트 서버 요청
	//Ex02_register.jsp?userid=hong&pwd=1004&hobby=baseball&hobby=soccer
    	String uid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		//String hobby = request.getParameter("hobby");
		String[] hobby = request.getParameterValues("hobby");
		
		/*
			한글처리...(GET) (Tomcat9 버전 (한글출력))
			**Tomcat9 버전 이하
			1.페이지 상단에 인코딩 : request.setCharacterEncoding("UTF-8");
			2.server.xml 63 라인
			 <Connector URIEncoding="UTF-8" connectionTimeout="20000" port="8093" protocol="HTTP/1.1" redirectPort="8443"/>
			
			한글처리 ...(POST)
			1.Tomcat 버전에 상관없이 ..
			2.받는 페이지 상단에 무조건 : request.setCharacterEncoding("UTF-8");
			
			JSP 페이지 상단에 무조건** (한글이 깨짐은 없다)
			request.setCharacterEncoding("UTF-8");		
			
			*/
    %>
    
    <%!//java code (공통함수) >>잘안씀, 이 페이지를 벗어나면 못쓰므로
	public int add(int i, int j) {
		return i + j;
	}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	서버에서 응답<br>
	ID입력값:<%= uid %><br>
	PWD입력값:<%= pwd %><br>
	당신의 취미는 : <br> 
	
	<%
		for(String str : hobby){
	%>
		hobby:<%=str %><br>
	<%
		}
	%>
	<!-- 스파게티 코드 -->
</body>
</html>

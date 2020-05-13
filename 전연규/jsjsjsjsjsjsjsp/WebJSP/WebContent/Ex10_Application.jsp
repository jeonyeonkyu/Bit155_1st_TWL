<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 /* 
 	web.xml(환경설정 파일은 서버가 시작되면 가장 먼저 로딩된다)
 	 <welcome-file>index.html</welcome-file>
 	 웹사이트 기본 페이지 설정 : http//192.168.0.169:8090/WebJSP/  >> index.html
 
	WAS 는(웹서버는 : [여러개의 웹 어플리 케이션]을 서비스 할수 있다)
	>>http//192.168.0.169:8090/Web/index.html >> webAPP
	>>http//192.168.0.169:8090/WebJSP/index.html  >> webAPP
	
	/WebJSP >> 웹 프로젝트 이름, 가상디렉토리, 웹 프로젝트
	실경로 : D:\bit155\WebJSP\Labs\WebJSP
	가성경로(웹) : http//192.168.0.169:8090/WebJSP/
	
	\WebJSP 서비스하는 파일들의 기본 경로 (default)>> WebContect(Context root) 
	>> http//192.168.0.169:8090/WebJSP/ >>WebContect 안에 있는 파일을 서비스
	
	
	**우리가 만드는(서비스) 하는 소스파일은(html, htm, css, jc, json, jsp)
	**WebContent 폴더 안에 있어야 서비스가 된다
	**WebContent >> a.jsp, b.jsp, c.jsp 3개의 페이지가 공유할 수 있는 자원?
			
	a.jsp >> <% String str="A" 자기페이지
	b.jsp >> <% String str="A" 자기페이지
	c.jsp >> <% String str="A" 자기페이지
	
	어떤 자원은 3개의 jsp 페이지에서 모두 사용하고 싶어요
	**웹 APP 은 설정파일을 가진다(web.xml)
	**web.xml 웹 환경 설정 파일>> 서버 시작>> 가장 먼저 해석 실행
	**WebContent > WEB-INF > we./mxl
	 ex)reisterok.jsp >> reister.html 요청해서...
	 ex)http//192.168.0.169:8090/WebJSP/registerok.jsp(500 for sull.....)

	위와같은 문제에 대응하기 위해서>> 만들어진 폴더 >> WEB-INF(보안폴더)
	CLIent 아래 주소 접근(404...)
	
	실제프로젝트에서는
	1.Client 직접 요청 하는 파일 :  main, login, register >> WebContent
	2.Client 요청 해서는 안되는 파일 : WEB-INTF -values >> member> rehisterok.jps
										q WEB-INTF -values >> member> writeok 
									
												
	appliction 객체
	
	현재page
	int num = 0; 현재 페이지 유효...
	
	web.xml >> 사이트 전체 에서 공유할 수 있는 자원 생성...
	
	
*/	
 %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Application 객체</title>
</head>
<body>
	<%
	   //application
	   //new 하지 않아도 제공받는 객체  application
	   
	   String param = application.getInitParameter("email");
		out.print("<h3>"+param +"</h3>");	   
		
		String param2 = application.getInitParameter("FilePath");
		out.print("<h3>"+param2 +"</h3>");	   
	%>
</body>
</html>
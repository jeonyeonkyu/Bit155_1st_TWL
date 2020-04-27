<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--session, application 1순위중요 / includes, ?? 2순위중요  -->
<!-- xml은 웹 페이지의 환경설정 파일  -->

<%
	/*
		web.xml(서버가 시작하면 가장 먼저 읽혀짐)
	   <welcome-file>index.html</welcome-file>
	    웹사이트 기본 페이지 설정 : http://IP주소/WebJSP/ >> index.html
	
		WAS는 (웹서버는  여러개의 웹 어플리케이션을 서비스 할 수 있다. / 하지만 성능이 떨어짐 / 이렇게 절대 하지마라!!!!!)
		//컴파일을 필요없는거 까지 다하기 때문에 느림
		>> http://IP주소/WebJSP/index.html >>webAPP
		>> http://IP주소/Web/index.html    >>webAPP
		
		/WebJSP >> 웹 프로젝트 이름, 가상 디렉토리, 웹 프로젝트
		실경로 : D:\bit155\WebJSP\Labs\WebJSP
		가상경로(웹경로) :  http://IP주소/WebJSP/
		
		\WebJSP 서비스하는 파일들의 기본 경로(default) >> WebContent (Context root)
		http://IP주소/WebJSP/ >> WebContent 안에 있는 파일을 서비스 ★★★★★★★★★★★
		**WebContent >> a.jsp, b.jsp, c.jsp 3개의 페이지가 공유할 수 있는 자원이 없을까?
				
		a.jsp > <% String str="A" 스코프가 자기 페이지
		b.jsp > <% String str="A" 스코프가 자기 페이지
		c.jsp > <% String str="A" 스코프가 자기 페이지
		
		어떤 자원은 3개의 JSP 페이지에서 모두 사용하고 싶어요
		**웹 APP은 설정파일을 가진다(Web.xml)
		**web.xml 웹 환경 설정 파일 >> 서버 시작 >> 가장 먼저 해석 실행
		**WebContent > WEB-INF > web.xml
		ex) registerok.jsp >> register.html에서 요청을 해서 처리하는 페이지
		ex)  http://IP주소/WebJSP/registerok.jsp( 500 for null...)
		순차적으로 접근하지 않고 url로 다이렉트로 접근시 500 error 발생 가능성 농후
		
		위와 같은 문제에 대응 >> 폴더 >> WEB-INF (보안폴더)
		client 아래 주소 접근(404..)
		http://IP주소/Web/WEB-INF/web.xml 
		
		WEBContent에는 client가 꼭 봐야되는 페이지만..
		ex) 회원가입 페이지 등
	
		실제 프로젝트(중간프로젝트 이후)부터는..
		1.Client가 직접 요청 하는 파일 : main, login, register >> WebContent
		2.Client가 요청해서는 안되는 파일 : WEB-INF >> views >> member >> registerok.jsp
									WEB-INF >> views >> board >> writeok.jsp
		views : 개발자들간의 관습적인 표현(스프링에서도 씀)
			내부에서는 html -> jsp 가능
			
		application 객체
		현재 page
		int sum = 0; 현재 페이지 에서만 유효..
		
		web.xml >> 사이트 전체에서 공유할 수 있는 자원 생성 .....
		email
		FilePath
		application 객체 환경설정 정보를 read ....
		
		
	
	
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
		String param = application.getInitParameter("email");
		out.print(param + "<br>");
		
		String param2 = application.getInitParameter("FilePath");
		out.print(param2);
	%>


</body>
</html>
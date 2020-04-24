<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    /*
    
	       <welcome-file>index.html</welcome-file>
	       웹사이트 기본 페이지 설정 >> http://192.168.0.213:8090/WebJSP/ 이렇게 입력하면 index.html이 서비스가 된다.
    
	    <welcome-file>index.html</welcome-file>
	    <welcome-file>index2.html</welcome-file>
	    <welcome-file>index3.html</welcome-file> 과 같이 여러개가 있다면 처음 페이지가 없을경우 index2을, 없으면 index3을 찾는다.(후보군)
	    만약 해당 html문서가 아무것도 없을 경우 오류화면이 나온다.
	    
	    환경설정 파일은 서버가 시작되면 가장 먼저 로딩된다.
	    
	    WAS (웹서버)는 여러개의 웹 어플리케이션을 서비스 할 수 있다(아파치톰캣 하나로 홈페이지 여러개를 구동하도록 할 수 있다)
	    이유는 포트 뒤의 프로젝트명(가상 디렉토리)이 다르기 때문에 가능하다.
	    가상디렉토리는 웹용 경로이고, 실경로가 따로 존재한다. 가상경로를 통해 실경로로 접근
	    
	    서비스하는 파일들의 기본경로는 default >> WebContent(context root) 이다. WebContent 안의 파일들을 실행하는 것 WebJSP/WebContent 이렇게 하위경로를 굳이 표시하지 않음
	    디폴트이기때문~!
	    
	    **앞으로 우리가 서비스하는 소스파일은 (html, htm, css, js, ,json...) WebContent 폴더 안에 있어야 서비스가 가능하다.
	    WebContent 폴더 >> 예를들어 a.jsp, b.jsp, c.jsp와 같은 파일들이 있을 때 이 세 개의 페이지가 공유 할 수 있는 자원이 없을까 ? (java의 static처럼)
	    
	    	a.jsp >> <% String str = "A" >>A의 범위가, 해당하는 페이지 내부이기 때문에 내용이 같아도 오류가 나지 않는다.
	    	b.jsp >> <% String str = "A"
	    	c.jsp >> <% String str = "A"
	    	
	    	이 A의 자원을 3개의 다른 jsp 페이지에서 같이 사용하고 싶다면,
	    	**웹 APP은 설정 파일을 가질 수 있다. >> web.xml ! 웹 사이트에 대한 전체 설정을 집어넣을 수 있다. 이 공통된 xml파일을 각각의 페이지에서 가지고 있어야하지 않을까?
	    	**web.xml은 웹 환경 설정파일이고, 서버를 시작하면 가장 먼저 해석되고 실행된다. 
	    	**web.xml은 WebContent 폴더가 아닌, WEB-INF 아래에 존재한다.
	    	
	    	ex)register.jsp >> register.html 파일에서 요청을 받아서 만들어지는데
			ex)http:// http://192.168.0.213:8090/WebJSP/registerok.jsp( 500 for null... ) 에러가 뜬다. html이 아닌 jsp로 접속하려고했기 때문?
			
			위와 같은 문제에 대응하기 위해서 만들어진 폴더가 WEB-INF 이다. (보안폴더, 클라이언트가 주소를 알고 있다고 해도 접근 불가(404에러))
			web.xml이 WEB-INF 아래에 있는 이유는 xml이 환경정보, 암호와 같은 보안을 지켜야 하는 내용들이 담겨지기 때문에 아래에 있는 것
			
			<<즉 WebContent에는 클라이언트에게 공개되어도 되는 파일(메인, 로그인페이지, register)들, 
			WEB-INF에는 공개되어서는 안되는 파일()들을 넣게 된다. WEB-INF >> views >> member >> registerok.jsp //회원정보 >> views 폴더 이름은 관습적인 것
																  WEB-INF >> views >> board >> writeok.jsp //게시판 쓰기 처럼 폴더를 만들어서 나눠서 넣어놓기(유지보수 편리)>>
			
			내부에서는 WEB-INF 폴더를 마음대로 볼 수 있다. 클라이언트에게만 비공개
			
			
			Application 객체
			
			예를들어 현재 page에
			
			int sum = 0; >> 현재 페이지에서만 유효 >> 다른 페이지에서 변수를 가져다 쓸 수 없다.
			
			이 변수를 전역자원으로 만드려면 web.xml에 생성하면 된다.
			현재 email과 FilePath를 설정한 상태인데
			xml파일에서 가져와서 쓰는 방법은
			application 객체의 환경 설정 정보를 read해와서 사용하면 된다. application.getInitParameter();


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
out.print("<h3>"+ param +"</h3>");


String param2 = application.getInitParameter("FilePath");
out.print("<h3>"+ param2 +"</h3>");


%>
</body>
</html>
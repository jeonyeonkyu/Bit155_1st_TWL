<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 
    
    <URI (Universal Resource Identifier)>
- 인터넷상의 자원을 식별하기 위한 표기법 및 규약
- URL + URN = URI
- 인터넷 환경에서 URI는 대부분 URL을 의미, URN은 사용이 제한적


	<URL (Uniform Resource Locator)>
- 물리적인 경로, 즉 자원의 위치 정보를 포함
- 프로토콜, 도메인, 아이피, 포트 등
- 컴퓨터로부터 접근 가능한 형태의 자원만 검색될 수 있어 제한적
- 우리가 흔히 보는 'http://test.com/test.jpg' 형태


	<URN (Uniform Resource Name)>
- 독립적인 이름을 제공하기 위해 존재
- 자원에 대해 영속적이고 유일
- 자원의 위치와는 무관
- 예를들어 우리나라에서는 주민등록번호가 대표적



 StringBuffer url = request.getRequestURL();        // URL : 전체주소 (프로토콜 + IP + 포트 + 상세경로) 를 얻을 수 있다.
 String uri = request.getRequestURI();             // URI : 프로젝트 이하 경로 (CP + SP)
 String cp = request.getContextPath();             // CP : 프로젝트 명
 String sp = request.getServletPath();            // SP : 패키지 + 파일명
 
 System.out.println("URL : " + url);
 System.out.println("URI  : " + uri);
 System.out.println("CP   : " + cp);
 System.out.println("SP   : " + sp);
 

-----------------------------------------------------------------

 URL : http://192.168.0.12:8080/WebJSP/Ex11_WebApp_RealPath.jsp
 URI  : /WebJSP//Ex11_WebApp_RealPath.jsp
 CP   : /WebJSP
 SP   : /WebJSP/Ex11_WebApp_RealPath.jsp

-----------------------------------------------------------------
    
     -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String resourcepath = "/download/note.txt";
	out.print(resourcepath + "<br>");
	
	//http://192.168.0.213:8090/WebJSP/Ex11_WebApp_RealPath.jsp
	
	//WdbJSP의 실제 경로를 확인해보자(아파치톰캣을 통해서 실제로 배포가 되는 경로) >> 파일을 다운로드 하면 배포경로에 저장된다. = 실경로 귀찮으니 가상경로를 받아서 실경로로 바꿔주는 애들이 있음
	//C:\Users\bitcamp\Desktop\공부내용 깃\이정아\WebJSP\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WebJSP\download
	
	//이건 소스경로 C:\Users\bitcamp\Desktop\공부내용 깃\이정아\WebJSP\WebJSP //소스를 복사해서 아파치 톰캣 안에 집어넣어 놓은 것
	
	
	///download/note.txt >> C:\Users\bitcamp\Desktop\공부내용 깃\이정아\WebJSP\WebJSP\WebContent\download\note.txt (소스에 대한 실경로)
	//						C:\Users\bitcamp\Desktop\공부내용 깃\이정아\WebJSP\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WebJSP\download (배포경로)
	
	//경로들이 이렇게 다른 이유는
	//웹을 서비스 하기 위해서는 WAS라는 (서버의 특정 경로에) 소스를 배포해야 한다. WAS를 통해서 배포해야 하기 때문
	//현재 이클립스에 WAS를 내장시켰기 때문에 경로가 길어진 것이고, 내장하고 있기 때문에 run as를 하면 자동으로 소스 실경로의 내용들이 배포경로로 복사가 되어서 서비스가 되는 것이다.
	
	//Linux 서버를 하나 구축하고, 프로젝트를 war(배포용 압축파일), jar 파일로 만들어서 Linux서버의 아파치 톰캣에 복사 붙여넣기를 하면 자동으로 압축이 풀린다.
	
	
	//파일 처리를 할 때 실제경로가 필요하다.
	//Application 객체가 가진 getRealPath(배포경로) 함수를 사용하면 얻어 낼 수 있다.
	
	String realContextPath = application.getRealPath(request.getContextPath()); //WEBJSP의 경로(가상경로)를 제공하면, 이 경로의 실제 경로를 알려준다.
	out.print("realPath : " + realContextPath + "<br>");
	//C:\Users\bitcamp\Desktop\공부내용 깃\이정아\WebJSP\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WebJSP\WebJSP
	
	
	String filePath = application.getRealPath(resourcepath); //download/note.txt 이 경로를 제공
	out.print("real : " + filePath + "<br>");
	// C:\Users\bitcamp\Desktop\공부내용 깃\이정아\WebJSP\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WebJSP\download\note.txt 배포경로
	
	
	
	StringBuffer url = request.getRequestURL();        // URL : 전체주소 (프로토콜 + IP + 포트 + 상세경로) 를 얻을 수 있다.
 	String uri = request.getRequestURI();             // URI : 프로젝트 이하 경로 (CP + SP)
	String cp = request.getContextPath();             // CP : 프로젝트 명
 	String sp = request.getServletPath();            // SP : 패키지 + 파일명
 
 	System.out.println("URL : " + url);
 	System.out.println("URI  : " + uri);
 	System.out.println("CP   : " + cp);
 	System.out.println("SP   : " + sp);
 	
 	//URL : http://192.168.0.213:8090/WebJSP/Ex11_WebApp_RealPath.jsp
	//URI  : /WebJSP/Ex11_WebApp_RealPath.jsp
	//CP   : /WebJSP
	//SP   : /Ex11_WebApp_RealPath.jsp
	
%>
	
</body>
</html>



















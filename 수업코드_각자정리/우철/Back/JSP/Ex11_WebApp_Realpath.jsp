<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--
    URI (Universal Resource Identifier)
- 인터넷상의 자원을 식별하기 위한 표기법 및 규약
- URL + URN = URI
- 인터넷 환경에서 URI는 대부분 URL을 의미, URN은 사용이 제한적


URL (Uniform Resource Locator)
- 물리적인 경로, 즉 자원의 위치 정보를 포함
- 프로토콜, 도메인, 아이피, 포트 등
- 컴퓨터로부터 접근 가능한 형태의 자원만 검색될 수 있어 제한적
- 우리가 흔히 보는 'http://test.com/test.jpg' 형태


URN (Uniform Resource Name)
- 독립적인 이름을 제공하기 위해 존재
- 자원에 대해 영속적이고 유일
- 자원의 위치와는 무관
- 예를들어 우리나라에서는 주민등록번호가 대표적


//이 4개는 굳이 외울필요없음, 이걸쓰면 이게나오는구나 정도만 알아두기
 StringBuffer url = request.getRequestURL();    // URL : 전체주소 (프로토콜 + IP + 포트 + 상세경로)
 String uri = request.getRequestURI();            // URI : 프로젝트 이하 경로 (CP + SP)
 String cp = request.getContextPath();           // CP : 프로젝트 명
 String sp = request.getServletPath();            // SP : 패키지 + 파일명 //파일명인데 폴더구조까지 다나옴
 
 System.out.println("URL : " + url);
 System.out.println("URI  : " + uri);
 System.out.println("CP   : " + cp);
 System.out.println("SP   : " + sp);
 

-----------------------------------------------------------------

 URL : http://localhost:8080/TestBoard/JSPBoard/created.jsp
 URI  : /TestBoard/JSPBoard/created.jsp
 CP   : /TestBoard
 SP   : /JSPBoard/created.jsp

-----------------------------------------------------------------
이런것을 쓰는 이유는 실제 경로를 뽑아서 업로드나 이런 파일들을 처리 가능하게 해줄려고
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
		out.print(resourcepath);
		/* 
		http://192.168.0.62:8090/WebJSP/Ex11_WebApp_Realpath.jsp
		 /WebJSP 실경로(소스경로) : C:\Users\bitcamp\Desktop\Bit155_1조 학습 저장소\김우철\학원\WebJSP\WebJSP
		
		프로젝트가 WAS안에 들어가야됨
		WebJSP 실경로(배포경로(=서비스경로)) //소스경로를 복사해서 배포경로에 넣는것..
		C:\Users\bitcamp\Desktop\Bit155_1조 학습 저장소\김우철\학원\WebJSP\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WebJSP
		여기에 파일 업로드한것이 들어가는것
		
		이런것을 위에주석으로 적은걸로 해결할꺼임
		
		 /download/note.txt(소스) >> C:\Users\bitcamp\Desktop\Bit155_1조 학습 저장소\김우철\학원\WebJSP\WebJSP\WebContent\download\note.txt
		 /download/note.txt(배포 경로) >> //C:\Users\bitcamp\Desktop\Bit155_1조 학습 저장소\김우철\학원\WebJSP\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WebJSP\WebContent\download\note.txt
		
		WHY ?
		웹을 서비스 하기 위해서는 WAS(서버의 특정 경로에) 소스를 배포
		우리는 이클립스 WAS에 내장 그래서 경로가 복잡..
		
		Linux 서버안에 war(배포용) or jar(배포용) 파일을 만듬 >> 리눅스서버에 있는
		아파치 톰캣에 복사 붙여넣기하면 압축이 풀림
		배포서버로 거의 리눅스 or 유닉스를 사용(왜? 공짜 and ?)
		
		리눅스에 jdk설치 -> apt-get update -> apt-get install tomcat9(톰캣 설치)
		-> 톰캣 재부팅 -> 톰캣이 설치된 경로에 war 파일 넣기 -> 자동으로 압축이 풀림
		
		파일 처리(실경로)
		getRealPath(배포경로)
		
		 */
		String realContextPath = application.getRealPath(request.getContextPath()); //getRealPath() 하나할려고 이만큼...
		// /WebJSP의 실경로 반환
		// C:\Users\bitcamp\Desktop\Bit155_1조 학습 저장소\김우철\학원\WebJSP\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WebJSP\WebJSP
		out.print("ContextPath real path : " + realContextPath + "<br>");

		String filePath = application.getRealPath(resourcepath);
		// /download/note.txt 경로를 제공
		out.print("filePath real path : " + filePath + "<br>");
		//C:\Users\bitcamp\Desktop\Bit155_1조 학습 저장소\김우철\학원\WebJSP\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WebJSP\download\note.txt

		StringBuffer url = request.getRequestURL(); // URL : 전체주소 (프로토콜 + IP + 포트 + 상세경로)
		String uri = request.getRequestURI(); // URI : 프로젝트 이하 경로 (CP + SP)
		String cp = request.getContextPath(); // CP : 프로젝트 명
		String sp = request.getServletPath(); // SP : 패키지 + 파일명

		System.out.println("URL : " + url);
		System.out.println("URI  : " + uri);
		System.out.println("CP   : " + cp);
		System.out.println("SP   : " + sp); //파일명인데 폴더구조까지 다나옴
		/*
		URL : http://192.168.0.62:8090/WebJSP/Ex11_WebApp_Realpath.jsp
		URI  : /WebJSP/Ex11_WebApp_Realpath.jsp
		CP   : /WebJSP
		SP   : /Ex11_WebApp_Realpath.jsp
		*/
	%>

</body>

	



</html>
<%@page import="java.util.Date"%>	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	Date day = new Date();
/* 
JSP 페이지 : UI > (html + css + javascript) + (JAVA 코드 : JDBC) >> <% 안에서 구현
>> 디자인 코드 + 서버 로직코드 >> 혼재된 방식(불편하다.. JSP 웹 페이지를 구성하는 것은)
>>[결론]
>> Servlet(Java 페이지로 web 서비스 기술) >> 디자인 작업 어려움
>>JSP(UI)
>> Servlet(Controller(조정:요청 응답처리))
>> MVC(model(dao,dto,service)>> JAVA : view(UI >> JSP, HTML : Controller >> Servelt))
>>잘 하는 것만 해... model2기반의 MVC 패턴(중간 프로젝트)

>> JSP 와 HTML의 차이점
>> Tomcat(WAS) 처리
>> 1. html 로 구성 : Web Server (클라이언트 요청... 응답)
>> 2. jsp로 구성 : WAS 를 통해서 컴파일 >> 변환(text , html,  script) >> 응답
>>WAS(jsp) > compile(1.jsp.java) > 1.jsp.class > 실행 > 정적 + 동적 > 정적 파일 > 전달
>> 주의 1.jsp.class 파일은 (코드 변환(java)) >> 재컴파일 >> WAS 알아서 처리
>> 컴파일 된 코드 확인
>>D:\bit155\WebJSP\Labs\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\WebJSP\org\apache\jsp
>>Ex01_005fBasic_jsp

JSP 구성 요소 
1. 선언부(jsp 페이지에 대한 기본 설정 세팅)
<%page language = "java" ....
page 지시자 : 사용언어, 인코딩, import 지원 ...

2. 스크립트 요소
2.1 스크립트 릿 <% ...java 코드 구현
2.2 표현식(출력방법) : 출력하는 대상(client 웹 브라우져) : <%= 내용을 전달...
2.3 선언부(공통적인 자원(scope page 안에서) : 공통함수 >> <%! ... 코드)
*/	
%>

<%!
	//java code(공통함수)
	public int add(int i,int j ){
	return i+j;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%= day %><br>
		<%= add(10,20) %><br>
		<%
			int result = add(100,200);
		%>
		<hr>
		최종결과<%= result %>
		
</body>
</html>
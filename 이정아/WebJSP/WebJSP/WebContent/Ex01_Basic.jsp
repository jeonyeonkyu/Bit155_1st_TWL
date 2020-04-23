<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
   <%
   
    /*
    JSP페이지 : UI > (html + css + javascript) + (JAVA코드 : JDBC) >> <%  안에서 구현
    >>디자인 코드 + 서버 로직 코드 >> 혼재된 방식 (불편하다 JSP 웹페이지를 구성하는 것은)
    >>결론 []
    		>>Servlet (Java 페이지로 web 서비스 기술) >> 디자인이 불편함
   
   			>>JSP(UI)
   			>>Servlet(Controller의 역할) -> 조정 : 요청 응답 처리
   			>>MVC(model(dao,dto,service) >> java 전문 
   				  view 부분은 화면단을 담당하는 부분>> jsp , html 전문
   				  controller의 역은 servlet이 담당하게 되었다.
   			>>잘 하는 것만 시키는걸로 ! ! model2기반의 MVC패턴이라고 한다.
   				  
   			>>JSP와 Html의 차이점
   			>>Tomcat(WAS) 처리
   			>>1.html로만(정적페이지) 구성되어 있는 경우 : web서버만 있으면 된다. (web서버란 클라이언트의 요청을 받고 응답하는 역할)
   			>>2.jsp로 구성을 하게되면(동적페이지) back단 작업이 포함되어있기때문에
   				  : WAS가 필요하게 된다. back단 코드를 컴파일 해서 변환(text, html, script)해서 클라이언트의 브라우저가 읽을 수 있도록 해줘야하기 때문
   				  : WAS는 jsp를 만나게 되면 컴파일을 하게 되는데(class파일을 만드는 것 = 1.jsp.java) > 1.jsp.class > 실행
   				         실행 후 정적자원과 동적자원을 결합시킴 > 최종적으로 정적파일을 생성해서 클라이언트에게 전달
   				    >> 주의 할 점 :  1.jsp.class 파일은 언제라도 코드수정이 될 수 있기 때문에 재컴파일 과정이 필요하다.(WAS가 처리)
   				    
   			JSP의 구성 요소 (페이지 내부에 가질 수 있는 자원들)
   			1. 선언부(jsp 페이지에 대한 기본 설정을 셋팅하는 곳)
   			<%@ page language="java" ....
   			page 지시자 : 사용언어, 인코딩방식 import 지원여부  등등을 알려줌
   			
   			2. 스크립트 요소
   			2-1) 스크립트 릿 : <% ~~~~~ java코드를 구현하는 영역
   			2-2) 표현식(출력방법) : 출력 대상  client의 웹 브라우저 이므로 전달식은 <%= 이다.
   			2-3) 선언부(공통적인 자원을 쓰기 위한 영역이 따로 있다) : 범위는 한 페이지 내부  = 공통함수 >> <%! ....코드
			   				  
   				  */
    %>
    
    <%! //java코드 (공통함수)
    	public int add(int i, int j){
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

	<%= add(10,20) %> <br>
	<% int result = add(100,200); %>
	
	<hr>
	최종결과 : <% %>
	
</body>
</html>




















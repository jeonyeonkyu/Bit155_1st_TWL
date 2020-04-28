<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% String id = request.getParameter("userid");
    	
    	request.setAttribute("name", "korea");
    	session.setAttribute("user", "bit");
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 	EL(출력에 관련된 표현식) : JSP 페이지에서 사용되는 화면출력을 담당하는 스크립트 언어 ////화면에 출력하는 언어 퍼센트 는 을 대체
이유 :  스파게티코드가 불편해서( % 부분과 html(정적구조) 가 혼재되어있어서 유지보수, 코드해석면에서 불편해서)
	   이 문제를 해결, 개선하기 위해 고민을 했던 부분은
	   html하고도 잘 어울려야하고, 서버쪽 코드도 출력해야한다. => 그러한 script를 만든 것이 >> EL & JSTL (단점 : JSP페이지에서만 사용 할 수 있다.)
	   
	   즉 EL은 JSP페이지에서 화면에 무엇인가를 출력하려는 목적으로 만든 script 언어이다. (% 없이 출력)
	   
	   <EL이 가지고 있는 객체들을 살펴보기>
	   paramValues : 요청 파라미터의 <파라미터 이름, 값배열> 매핑을 저장한 Map 객체 (체크박스 같은 값이 여러개인 것들)
	   param : 요청 파라미터의 <파라미터이름, 값 > 매핑을 저장한 Map객체 (파라미터 값)
	   requestScope : request 기본 객체에 저장된 속성의 <속성, 값> 매핑을 저장한 Map 객체 (리퀘스트객체)
	   sessionScope : session 기본 객체에 저장된 속성의 <속성, 값> 매핑을 저장한 Map 객체 (세션객체)
	   applicationScope : application 기본 객체에 저장된 속성의 <속성, 값> 매핑을 저장한 Map객체 (어플리케이션 객체)
 -->
 
스크립트릿 : <b><%= id %></b> <!-- 기존에 쓰던 방법 서버의 자원을 가지고 와서 %=으로 출력 --><br>
스크립트릿 : <%= request.getAttribute("name") %><br>
스크립트릿 : <%= session.getAttribute("user") %><br>
parameter : <%= request.getParameter("userid") %><br>
<hr>
EL parameter : ${param.userid}<br> <!-- parameter 값 받아오기 처음 할 때에는 객체명 적기 헷갈리므로-->
EL parameter : param 생략 가능 : ${userid}<br>
EL request value : ${requestScope.name}<br>
EL request value : (requestScope 객체명 생략) : ${name}<br>
EL session value : ${sessionScope.user }<br>
El session value : (sessionScope 객체명 생략) : ${user}<br>

<h3>EL 기본 문법(출력)</h3>
스크립트 릿 <%= 100 + 200 %><br>
EL : ${100+200}<br>
EL : ${"1" + 1}<br><!-- 문자형 숫자 (java는 11이었겠지만, +연산에 대해서 숫자형태로 자동 형변환해서 2가 출력) -->
EL : ${1==1 }<br><!-- EL이 논리연산도 제공한다. true, false -->
EL : ${false}<br>
EL : ${!false}<br>
EL : ${empty x}<br> <!-- x라는 변수값이 비어있는지 아닌지 -->

</body>
</html>

























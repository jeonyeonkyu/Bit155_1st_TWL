
.



 page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("userid");

	request.setAttribute("name", "korea");   //이 페이지안     스콥
	session.setAttribute("user", "bit");     //WebContent 전체
	
	//request.getParameter("name") >> paramValues
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 표현식 </title>
</head>
<body>
<!--   EL 은  WAS 안에 들어있는 서버쪽 자원을 해석(출력)하는 script  



	EL(출력 표현식) : JSP 페이지에서 사용되는 스크립트 언어(화면출력)
	이유 : 스카게티 (% 부분과 html 혼재되는 코드) >> 유지보수, 코드의 해석(가독성)
		 문제를 해결(개선) 위해서  [html 잘 어울려야 되고 서버쪽 코드도 출력 함 ] Script
		>> !!!!! EL & JSTL 탄생 !!!!!  (단점 : JSP 페이지에서만 사용가능) 
	EL : JSP 페이지에서 화면 출력 목적으로 만든 script 언어 ..  즉! %= 없이 살자!	   
	
	
	[EL 가지고 있는 객체]
	
	paramValues  :  요청 파라미터의 <파라미터이름, 값배열> 매핑을 저장한 Map 객체
	param        :  요청 파라미터의 <파라미터이름, 값> 매핑을 저장한 Map 객체
	requestScope :  request 기본 객체에 저장된 속성의 <속성,값> 매핑을 저장한 Map 객체
	sessionScope :  session 기본 객체에 저장된 속성의 <속성,값> 매핑을 저장한 Map 객체
	applicationScope : application 기본 객체에 저장된 속성의 <속성,값> 매핑을 저장한 Map 객체
	
	
 -->
  스크립트릿 표현식 <br>
 스크립트릿 : <b><%= id %></b>    ///서버쪽 자바자원을 출력하기 위해서 이렇게 썻는데 이제 바뀜 <br>
 스크립트릿 : <%= request.getAttribute("name") %><br>
 스크립트릿 : <%= session.getAttribute("user") %><br>
 parameter : <%= request.getParameter("userid") %><br>
 
 <hr>

 EL 표현식 &nbsp;  %= 을 대체할수 있는 언어   <br>
 EL parameter : ${param.userid}<br>    
 EL request value : ${requestScope.name}  &nbsp; 생략이 가능하지만 초반엔 써주는게 좋다. <br>
 EL request value : (requestScope 객체명 생략) : ${name}<br>
 EL session value : ${sessionScope.user}<br>
 EL session value : (sessionScope 객체명생략) : ${user}
 <hr>
 
 <h3>EL 기본 문법(출력)</h3>
 스크립트 릿 :  <%= 100 + 200 %><br>
 EL : ${100 +200} <br>
 EL : ${"1" + 1}<br>  <!-- 문자형 숫자 (자동 형변환) >> 숫자  >> 2 -->
 EL : ${1==1}<br>   <!--  이런식의  논리연산도 제공  true, false -->
 EL : ${false}<br>
 EL : ${!false}<br>
 EL : ${empty x}<br>  <!-- x 라는 변수의 값이 비어있니?  -->

</body>
</html>















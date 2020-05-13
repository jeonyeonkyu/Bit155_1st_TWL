<%@page import="java.util.HashMap"%>
<%@page import="kr.or.bit.Emp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    Emp e = new Emp();
    e.setEmpno(2000);
    e.setEname("bituser");
    /* 이런건 자바로 해야됨  어쩔수 없음 */
    
    HashMap<String, String> hp = new HashMap<>();
    hp.put("data", "1004");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
기존방식 : <%=e %> <br>
기존방식 : <%=e.getEmpno() %> <br>
기존방식 : <%=e.getEname() %> <br>

<h3>EL (출력)</h3>
자바객체를 출력하기(객체에 대한 직접접근 불가) : ${e}<br> 
자바객체가 가지는 속성 출력하기(안됨) : ${e.getEmpno()}<br> 

1. JSTL(core) : 변수를 생성하거나 제어문을 쓸 수 있는 자원을 제공<br> <!-- %안에 변수 만든거랑 같음 , JSTL은 서버쪽에서 해석되는 언어 -->
<c:set var="m" value="<%= e %>"></c:set>
JSTL을 사용해서 변수 m을 생성(e라는 객체의 주소값) : ${m}<br>
<!-- jstl을 이용해 변수를 만들면 그 변수를 이용해 el로 객체 출력 가능 (쌤은 이방법이 맘에 안들어하심) -->
<hr>
EL 출력 : JSTL 변수값을 출력 : ${m}<br> 
EL 출력 : JSTL 변수(가능 : 그러나 이방법 잘안씀) : ${m.getEmpno()}<br>
EL 출력 : JSTL 변수(m이라는 변수는 자동으로 getter 함수 호출)(m.member field명) : ${m.empno}<br>
 <!-- 이 방법 권장(단 getter함수를 반드시 구현해야함 -> 내부적으로 getter함수를 호출하는 것이기 때문에 -->
EL 출력 : JSTL 변수(m이라는 변수는 자동으로 getter 함수 호출)(m.member field명) : ${m.ename}<br> 
<!-- private으로 막아도 자동으로 getter 함수 호출  -->
<hr>
<h3>EL & JSTL 사용하기</h3>
**** EL을 통해서 JAVA 객체에 대한 직접적인 접근 불가 ****<br>
**** JSTL이 가지고 있는 set 구문을 사용해서 변수를 생성..이용 ****
<%-- **1. EL : Parameter 값 받기 (${param.})<br> --%>
<!-- **2. 객체(requestScope, sessionScope) 가지고 있어서 <br>
	request객체, session객체가 가지고 있는 값을 출력<br> -->
<c:set var="username" value="${m.ename}"></c:set>	
<!-- c:set태그의 value값으로 el구문이 올 수 있다. -->
변수값 출력 : ${username}<br> 
<hr>
<h3>JSTL 변수 만들고 SCOPE 정의하기</h3>
<%-- <%
	String job = "농구선수"
%> --%>
<!-- 스크릿트 립을 쓰기 싫어 c:set 사용 -->
<!-- 사실 JSP에서 EL과 JSTL만 알면 끝임, 하지만 request를 하는 이유는 이전코드를 유지보수하기 위해서...  -->
<c:set var="job" value="농구선수" scope="request"></c:set>
<!-- scope="session"을 주면 모든 페이지에서 접근 가능 -->
<!-- request면  -->
당신의 직업은 : ${job}<br>
만약에 당신이 [include], [forward] 한 페이지가 있다면 그 페이지에서도 job이라는 변수를 사용할 수 있다.
<hr>
<c:set var="job2" value="야구선수" scope="request" />
값을 출력<br>
${job2}<br>
변수를 삭제 가능
<c:remove var="job2"/><br>
job2변수 삭제 : ${job2}<br>
<!-- EL과 JSTML은 500에러를 내지않음,없으면 그냥 화면에 출력안함  -->
<hr>
hp객체(객체에 대한 직접 접근 불가) : ${hp}<br>
<c:set var="vhp" value="<%=hp %>" /> 
<!-- value부분에 스크립트릿을 쓰는 것도 어쩔수없음  -->
hp객체 : ${vhp}<br>
hp객체 : ${vhp.data}<br>
<!-- ★★★★객체는 c:set으로 받고 el로 출력하자★★★★  -->
<!-- 
	hp.put("color", "red")
 -->
 <c:set target="${vhp}" property="color" value="red" />
 <!--이런방법 (직접 값을 할당하는 것) 거의 안함(몰라도 상관없음) / 있는 객체,자원을 출력하는 것이 el,JSTL의 주 목적임(퍼센트를 없에자!!)  -->
 hp객체 : ${vhp}<br>
</body>
</html>
<%@page import="java.util.HashMap"%>
<%@page import="kr.or.bit.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    	Emp e = new Emp();
    	e.setEmpno(2000);
    	e.setEname("bituser");
    	
    	HashMap<String, String> hp = new HashMap<>();
    	hp.put("data", "1004");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

기존방식 : <%= e %><br>
기존방식 : <%= e.getEmpno() %><br>
기존방식 : <%= e.getEname() %><br>

<h3>EL(출력)</h3>
자바 객체 출력하기(el은 자바 객체에 직접적으로 접근을 못한다... 출력안됨) : ${e}<br>
자바 객체가 가지는 속성은 출력이 가능할까? 안됨안됨안됨 : ${e.getempno() }<br>

그래서 사용하게 된 것이 JSTL(core 라이브러리) : [변수를 생성, 제어문을 쓸 수 있는 자원] 이 또한 서버에서 해석하는 단어이다. <br>
<c:set var="m" value="<%= e %>"></c:set> <!-- m이라는 변수에다가 e의 정보(주소값을 넘겨준 것) 변수에 담아서 써야한다. -->
JSTL을 사용해서 변수 m을 생성(e 객체의 주소값) : ${m}<br>
<hr>
EL 출력 : JSTL 변수값을 출력 : ${m}<br>
EL 출력 : JSTL 변수(값이 출력되긴 하지만 잘 안쓴다... getEmpno로 getter 함수를 직접 호출했는데 getter를 통해서 가져오지 않아도 아래처럼 변수값으로 바로 호출이 가능) : ${m.getEmpno()}<br>
EL 출력 : JSTL 변수값 출력(자동으로 getter를 호출해서 가져오기 때문에 멤버필드만으로도 가져올 수 있다. 전제조건은 getter가 정의되어 있는 상태여야 한다.) : ${m.empno}<br>
EL 출력 : ${m.ename}<br>
<hr>
<h3>EL & JSTL 같이 사용하기</h3>
★★★EL을 통해서는 자바의 객체에 대한 직접 접근이 불가능하다.★★★<br>
그러므로 JSTL의 set 구문을 통해서 변수를 생성해서 객체에 대한 주소를 받아두고, EL을 다시 사용해서 출력해야 한다.<br>

■ EL이 할 수 있는 일 ■
1. parameter 값을 받을 수 있다. (param)<br>
2. el이 내부적으로 가진 객체를 사용 (requestScope, sessionScope)<br>
	request객체, session객체가 가지고 있는 값을 출력 할 수 있다.<br>

<c:set var="username" value="${m.ename}"></c:set>
변수값 출력 : ${username}<br>

<hr>
<h3>JSTL 변수 만들고 scope 정의하기</h3>
<c:set var="job" value = "농구선수" scope = "request"></c:set> <!-- page, request, session -->
당신의 직업은 : ${job}<br>
만약에 당신이 [include], [forward] 한 page가 있다면, 그 페이지에서도 job이라는 변수를 사용 할 수 있다. scope을 request로 설정해뒀기 때문. default는 page<br>

<hr>

<c:set var="job2" value = "야구선수" scope = "request" /> <!-- 닫는태그 이렇게 써도 됨 -->

값을 출력하고 처리해보기<br>
${job2}<br>
변수 삭제도 가능<br>
<c:remove var="job2"/><br>

job2 변수 삭제 후 출력해보면 에러안나고 그냥 아무것도 안뜸: ${job2 }<br>

<hr>

hp객체에 접근해보기 ${hp }<br>
<c:set var="a" value = "<%=hp%>"></c:set>
${a}<br>
hp객체(key값을 제공하고 value값 가져오기) : ${a.data}<br> 
<!-- 

	hp.put("color", "red")

 -->
 
값을 쓰는 작업은 잘 하지 않는다. 읽고 출력이 주 목적이기 때문 <c:set target="${a}" property="color" value="red"></c:set>
hp객체 : ${a}<br>

</body>
</html>



























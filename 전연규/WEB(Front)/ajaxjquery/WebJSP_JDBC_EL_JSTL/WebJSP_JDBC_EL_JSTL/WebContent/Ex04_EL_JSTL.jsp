<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <%
    
    	/*
    		★<c:set> 		: 변수 생성, 값을 저장, 자바객체 변수 value="<%=객체"
    		<c:remove> 		: 변수 삭제(거의 안씀)
    		★<c:if> 			: 조건문(test라는 속성안에 조건절을 적음 -> EL구문을 사용해서 표기)
    		★<c:choose> 		: 여러가지 조건에 따라서 처리 가능 (우리가 아는 switch문 기능 / if보다 활용도가 높음 -> else if가 없어서)
    		★<c:forEach> 	: 반복문(for문 ....)
    		<c:forTokens> 	: for문과 split과의 결합
    		<c:out>			: JSTL 출력 구문(요놈보다 EL표현식이 훨씬 사용빈도가 높으니 출력할때는 EL쓰셈)
    		<c:catch>		: 예외처리
    	*/
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//http://192.168.0.12:8090/WebJSP_JDBC_EL_JSTL/Ex04_EL_JSTL.jsp?ID=hong
	String id = request.getParameter("ID"); //param.ID
	if(id.equals("hong")){
%>
	<%= id%>
	<img alt="이미지" src="images/1.jpg" style="width: 100px;height: 100px">
<%		
	}
%>

<!-- 위 코드를 EL/JSTL로 전환(서버에서 쓰기위한거)  -->

<h3>EL과 JSTL 사용하기</h3>
<!-- JSTL은 페이지마다 태그라이브러리를 선언해줘야 한다.  -->
	<c:if test="${param.ID == 'hong'}">
		${param.ID}<img alt="이미지" src="images/1.jpg" style="width: 100px;height: 100px">
	</c:if>
<!-- 클라이언트가 받는 코드는 똑같음  -->

<h3>JSTL IF</h3>
	<c:if test="${param.age > 20}" var="result">
		param.value : ${param.age}<br>
	</c:if>
	if 구문에서 만들었던 var 변수값은 : ${result}
	<!-- true or false 나옴  -->
</body>
</html>


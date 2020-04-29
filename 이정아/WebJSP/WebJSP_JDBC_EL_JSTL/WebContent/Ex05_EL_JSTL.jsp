<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%
    	/*
    		*<c:set>       : 변수를 생성하거나 생성된 변수에 값을 저장하거나 java 객체에 대한 변수값을 value에 받아내는 역할 value = "<% = 객체"
    		<c:remove>    : 변수 삭제
    		*<c:if>        : 조건문(test = "조건절을 적는다. ${}") EL구문 사용
    		*<c:choose>    : switch, select와 같음 if문보다 활용도가 높다. else if가 없어서...
    		***<c:forEach>   : 반복문 for문
    		<c:forTokens> : 구분값을 제시하고 뽑아내기 ( for문 + split이 결합된 느낌)
    		<c:out>		  : JSTL의 출력구문인데, 그냥 EL을 쓰자
			<c:catch> 	  : 예외처리도 됨    		
    	
    	*/
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- http://192.168.0.213:8090/WebJSP_JDBC_EL_JSTL/Ex05_EL_JSTL.jsp?id=hong&pwd=1004 -->
	<h3>EL parameter 받기</h3>
	${param.id} - ${param.pwd} <br> <!-- parameter로 받은 값이 출력됨 -->
	
	<h3>EL parameter 값을 변수에 저장하기</h3>
	<c:set var="userid" value="${param.id}"></c:set>
	<c:set var="userpwd" value="${param.pwd }"></c:set>
	<hr>
	<h3>받은 변수를 출력하기</h3>
	id : ${userid}<br>
	pwd : ${userpwd }<br>
	<hr>
	<c:if test="${!empty userpwd }"> <!-- else if가 없어서 if문을 계속해서 써야 함 -->
	<h3>not empty userpwd</h3>
	<c:if test="${userpwd == '1004'}">
	<h3>welcome Admin page</h3>
	</c:if>	
	</c:if>
</body>
</html>



















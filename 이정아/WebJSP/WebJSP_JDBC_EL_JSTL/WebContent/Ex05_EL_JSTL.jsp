<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	/*
		**<c:set>     : 변수 생성, 값을 저장, 자바객체 변수 value ="<%=객체"
		<c:remove>    : 변수 삭제
		**<c:if>      : 조건문 (text="조건절(EL 구문)")
		**<c:choose>  : 여러가지  조건에 따라서 처리 가능 (if 보다 활용도가 높다)
		***<c:forEach>: 반복문(for ...)
		<c:forTokens> : for 문 + split 으로 보면 이해가 빠르다 
		<c:out>       : JSTL 출력 구문 (요놈보다 EL(표현식)이 훨씬 사용 빈도가 높다 )
		<c:catch>     : 예외처리 할수 있다. 
	*/
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제어문</title>
</head>
<body>
	<h3> EL parameter 받기</h3>
	http://192.168.0.25:8090/WebJSP_JDBC_EL_JSTL/Ex05_EL_JSTL.jsp?id=hong&pwd=1004 테스트 방법 <br>
	${param.id} - ${param.pwd}<br>
	
	<h3>EL parameter 값을 변수에 저장</h3>
	<c:set var="userid" value="${param.id}" />
	<c:set var="userpwd" value="${param.pwd}"/>   
	 <!-- String userid = request.getParameter("id"); 와 똑같은거 -->
	
	<hr>
	
	<h3>JSTL 변수값 출력하기</h3>
	id:${userid}<br>
	pwd:${userpwd}<br>
	<hr>
	<c:if test="${!empty userpwd}">
		<h3>not empty userpwd</h3>
		<c:if test="${userpwd =='1004'}">
		<h3>welcome Admin page</h3>
		</c:if>
	</c:if>

</body>
</html>
















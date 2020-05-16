<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL parameter 받기</h3>
	${param.id} - ${param.pwd}
	<br>
	<!-- http://localhost:8090/WebJSP_JDBC_EL_JSTL/Ex05_EL_JSTL.jsp?id=hong&pwd=1004 -->
	<!-- postman -> 파라미터 넘겨주면 결과값 출력해주는 테스트 사이트  -->

	<h3>EL parameter 값을 변수에 저장</h3>
	<c:set var="userid" value="${param.id}" />
	<c:set var="userpwd" value="${param.pwd}" />
	<hr>
	<h3>JSTL 변수값 출력하기</h3>
	id:${userid}<br>
	pwd:${userpwd}<br>
	<hr>
	<c:if test="${!empty userpwd}">
		<h3>not empty userpwd</h3>
		<c:if test="${userpwd == '1004'}">
			<h3>Welcome Admin page</h3>
		</c:if>
	</c:if>
</body>
</html>
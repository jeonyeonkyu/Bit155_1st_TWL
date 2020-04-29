<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- JSTL 은 페이지마다 선언해주어야 한다  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>If 문</title>
</head>
<body>

<% //http://192.168.0.25:8090/WebJSP_JDBC_EL_JSTL/Ex04_EL_JSTL.jsp?ID=hong  테스트는 이렇게 하세용 
	String id = request.getParameter("ID"); //24줄 코드랑 같은 뜻 
	if(id.equals("hong")){
%>
	<%= id%><img alt="이미지" src="images/1.jpg" style="width:100px; height:100px">
<% 
	}
%>

<h3>EL 과 JSTL 사용하기</h3>

	<c:if test="${param.ID=='hong'}">
	${param.ID}<img alt="이미지" src="images/1.jpg" style="width:100px; height:100px">
	</c:if>
	
	
<h3>JSTL IF문</h3>

<!-- http://192.168.0.25:8090/WebJSP_JDBC_EL_JSTL/Ex04_EL_JSTL.jsp?ID=hong&age=30  테스트 방법  -->
	<c:if test="${param.age > 20}" var="result">
	param.value : ${param.age}<br>
	</c:if>	
	if 구문에서 만들었던 var 변수값 : ${result} <!--  if 구문에서 만든 변수에는 결과 값이 들어간다. true -->
	


</body>
</html>


























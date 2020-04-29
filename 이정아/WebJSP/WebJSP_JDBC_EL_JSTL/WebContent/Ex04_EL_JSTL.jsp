<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("ID"); //param.ID
	if(id.equals("hong")){
%>
	<%= id %><img alt = "이미지" src = "images/1.jpg" style = "width: 100px; height: 100px;">

<%		
	}

%>
<h3>EL, JSTL로 전환</h3>
<!-- http://192.168.0.213:8090/WebJSP_JDBC_EL_JSTL/Ex04_EL_JSTL.jsp?ID=hong&age=30 뒤에 파라미터 값 입력해야 함. -->
<c:if test="${param.ID == 'hong'}">
	${param.ID}<img alt = "이미지" src = "images/1.jpg" style = "width: 100px; height: 100px;">
</c:if>

<h3>JSTL IF</h3>
<c:if test="${param.age > 20 }" var = "result">
	param.value : ${param.age}
</c:if>
 
	if 구문에서 만들었던 var 변수값을 출력해보기: ${result}
	
	
</body>
</html>
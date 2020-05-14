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

<c:set var="emp" value="${requestScope.emp}" />
${emp.sal}
${emp.job}
<table border="1">
		<tr><td>직업</td><td>급여</td></tr>
		<c:forEach var="e" items="${list}">
			<tr><td>${e.job}</td><td>${e.sal}</td></tr>
		</c:forEach>
	</table>


</body>
</html>
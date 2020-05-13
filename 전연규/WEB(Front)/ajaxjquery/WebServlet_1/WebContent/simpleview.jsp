<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple view</title>
</head>
<body>
	<h3>simplecontroller에서 forward 된 페이지</h3>
	요청한 결과 출력 <%=request.getAttribute("result") %>
	<br>
	<h3>EL & JSTL 표기 권장</h3>
	EL 요청 결과 : ${requestScope.result}<br> 

</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple view</title>
</head>
<body>
	<h3>simplecontroller���� forward �� ������</h3>
	��û�� ��� ��� <%=request.getAttribute("result") %>
	<br>
	<h3>EL & JSTL ǥ�� ����</h3>
	EL ��û ��� : ${requestScope.result}<br> 

</body>
</html>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    	//EL : ����ϴ� script (������ �ڿ�) << <%= �� ��ü�ϴ� ��ũ��Ʈ
    	//EL�� ����Ѵٰ� �ؼ� ��� �ڹٰ�ü�� �����ϴ� ���� �ƴϴ�
    	Date today = new Date();
    	request.setAttribute("day", today);
    	session.setAttribute("day2", today);
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>EL�� ������ ȭ�� ���</h3>
	<%= request.getAttribute("day") %><br>
	EL(��õ) : ${requestScope.day}<br>
	EL : ${day}<br> <!-- �̷������� �����ϸ� request���� session���� ó���� �� �� -->
	Session EL : ${sessionScope.day2}<br>
	<!-- EL : WAS�ȿ� ����ִ� ������ �ڿ��� �ؼ�(���)�ϴ� ��ũ��Ʈ -->
</body>
</html>


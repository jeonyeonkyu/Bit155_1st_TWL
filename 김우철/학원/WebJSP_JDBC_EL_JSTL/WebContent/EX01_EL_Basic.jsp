<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String id = request.getParameter("id");

	request.setAttribute("name", "korea");
	session.setAttribute("user", "bit");
	
	//request.getParameterValues(name) >> paramValues
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!--
	EL(��¿� ���õ� ǥ����) : JSP ���������� ���Ǵ� ��ũ��Ʈ ���(ȭ�� ��� ���)
	���� : �츮�� ���� �ڵ尡 ���İ�Ƽ(% �κа� ������ html�� ȥ��Ǵ� �ڵ�) >> ��������, �ڵ��� �ؼ�(������)
	   ������ �ذ�(����) ���ؼ� html�ϰ� �� ������ �ǰ� ������ �ڵ嵵 ����ؾ���] Script
	   EL & JSTL ź��(���� : JSP ������������ ��밡��)
	  EL : JSP ���������� ȭ�� ��� ��������  ���� script ��� (% ���� ����)
	  ����Ƽ ��Ĺ�ȿ� el���̺귯���� �������
	 
	 
	 EL�� ������ �ִ� ��ü(���߿��Ѱ�)
		paramValues  :  ��û �Ķ������ <�Ķ�����̸�, ���迭> ������ ������ Map ��ü
		param        :  ��û �Ķ������ <�Ķ�����̸�, ��> ������ ������ Map ��ü
		requestScope :  request �⺻ ��ü�� ����� �Ӽ��� <�Ӽ�,��> ������ ������ Map ��ü
		sessionScope :  session �⺻ ��ü�� ����� �Ӽ��� <�Ӽ�,��> ������ ������ Map ��ü
		applicationScope : application �⺻ ��ü�� ����� �Ӽ��� <�Ӽ�,��> ������ ������ Map ��ü
	 
-->
	��ũ��Ʈ��:<b><%=id%></b>
	<br> ��ũ��Ʈ��:<%=request.getAttribute("name")%><br> 
	��ũ��Ʈ��:<%=session.getAttribute("user")%><br>
	parameter : <%=request.getParameter("userid") %><br>
	<hr>
	EL request value : ${requestScope.name}<br> <!-- �������� ��κ� ���ڵ� ��  -->
	EL request value : (requestScope ��ü�� ����) : ${name}<br> <!-- ������ ������ ���, request�� ����ִ��� session�� ����ִ��� ��  -->
	<!-- ���м�  --> 
	EL session value : $(sessionScope.user}<br>
	EL session value : (sessionScope ��ü�� ����)${user}
	<!-- ���м�  -->
	EL parameter : ${param.userid}<br>
			
	<h3>EL �⺻ ����(���)</h3>
	��ũ��Ʈ �� <%= 100 + 200 %><br>
	EL : ${100+200}<br>
	EL : ${"1"+1}<br> <!-- ������ ����(�ڵ� ����ȯ) >> ���� >> 2 -->
	EL : ${1==1}<br>
	EL : ${false}<br>
	EL : ${!false}<br>
	EL : ${empty x}<br><!-- x��� ������ ���� ����ִ�-->
</body>
</html>
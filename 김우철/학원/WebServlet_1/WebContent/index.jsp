<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Servlet TEST</title>
</head>
<body>
	<h3>servlet ��û�ϱ�</h3>
	<h3>getContextPath() ; <%=request.getContextPath() %></h3>
	<!-- getContextPath() >> /WebServlet_1 -->
	<a href="<%=request.getContextPath() %>/simple">�Ϲ� ��û�ϱ�</a>
	<br>
	<a href="<%=request.getContextPath() %>/simple?type=date">��¥ ��û�ϱ�</a>
	<br>
	<a href="<%=request.getContextPath() %>/simple?type=abcd">������ ��û�ϱ�</a>
	<br>
	<hr>
	<h3>FrontBoardController ���</h3>
	<a href="<%=request.getContextPath()%>/board?cmd=boardlist">�Խ��� ��� ����</a>
	<br>
	<a href="<%=request.getContextPath()%>/board?cmd=boardwrite">�Խ��� �۾���</a>
	<br>
	<a href="<%=request.getContextPath()%>/board">Error ����</a>
	<br>
	<a href="<%=request.getContextPath()%>/board?cmd=boarddelete">�Խ��� �����ϱ�</a>
	<br>
	<a href="<%=request.getContextPath()%>/board?cmd=Login">������ ���� (�α��� ó��)</a>
	<br>
	<hr>
	<h3>FrontServletController ���</h3>
	<a href="<%=request.getContextPath()%>/action.do?cmd=greeting">��û ������</a>
	<br>
</body>
</html>


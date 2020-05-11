<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tomcat Connection Pull</title>
</head>
<body>

<%
	Connection conn = null;
	
	Context context = new InitialContext();
	//현재 프로젝트에서 이름을 기반으로 검색 할 수 있는 객체 (윈도우 탐색기에서 특정단어를 검색)   그게 바로 Context 객체,  javax.naming
	DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle"); //"java:comp/env" default 이름 ... + 내가 만든 이름 jdbc/oracle 이걸 준다 
												 // 이렇게 주면 찾는다    java:comp/env/jdbc/oracle
												 
	//대여소(pool) 안에서 이제 빌린다! connection....빌려줘..반납할게~~!
	conn = ds.getConnection();  //대여
	 
	out.print("db 연결여부:" + conn.isClosed() +"<br>");
	
	//반드시 반납해야함
	//Pool connection  반환
	conn.close(); //반환 (Pool)     
	out.print("db 연결여부:"+conn.isClosed() +"<br>");
	
%>
</body>
</html>
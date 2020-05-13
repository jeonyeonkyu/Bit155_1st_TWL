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
<title>Tomcat Connection Pool</title>
</head>
<body>
	<%
		Connection conn = null;

	Context context = new InitialContext();
	//현재 프로젝트에서 이름을 기반 검색 객체(윈도우 탐색기 >> 특정 단어 검색)
	DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle"); //"java:comp/env" 이건  default로 붙는 이름이다
	//"java:comp/env" + 여러분이 만든 이름 + "jdbc/oracle"
	//DataSource 는 연결에대한정보를 저장하는 객체

	//대여소(pool) 안에서 connection 빌려줘 ..  반납할게
	conn = ds.getConnection(); //대여

	out.print("db 연결 여부 : " + conn.isClosed() + "<br>");
	//false가 나와야 연결 된거임

	//반드시 (반납)
	//POOL connection .. 반환
	conn.close(); // 반환(POOL)   pool에서는 close가 반환이다

	out.print("db 연결 여부 : " + conn.isClosed() + "<br>");
	//true나와야 함
	%>

</body>
</html>
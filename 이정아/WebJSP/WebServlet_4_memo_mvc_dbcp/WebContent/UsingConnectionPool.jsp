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
<title>Tomcat Connection Poll</title>
</head>
<body>
<%
   Connection conn = null;
   //커넥션풀안의 name값을 찾는 기능을 구현해야함(암기)
   Context context = new InitialContext();
   //현재 프로젝트에서 이름을 기반으로 검색하는 객체(윈도우 탐색기 >> 특정 단어 검색)
   DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle"); //lookup : 당신이 주어진 이름을 기반으로 찾는 함수
   
   //context.lookup : Object타입 반환하기 때문에 다운 캐스팅 필요
   //java:comp/env << 커넥션풀 설정시 default 이름 + 만든이름 "jdbc/oracle"
   //대여소(당구) 안에서 connection 하나만 빌려줘.. 나중에 반납할께
   //ds에 연결에 대한 정보가 들어감 
   conn = ds.getConnection(); //대여 
   
   out.print("db 연결여부 : " + conn.isClosed() + "<br>");
   
   //★★★★ 반드시 반납!! (굉장히 중요)
   //POOL connection ..반환
   conn.close(); //닫는게 아니라 반환하는 거임
   
   out.print("db 연결여부 : " + conn.isClosed() + "<br>"); //false 나옴
   

%>

</body>
</html>

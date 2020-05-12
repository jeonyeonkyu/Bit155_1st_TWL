<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DB Connection Test</title>
</head>
<body>

<%
/*   conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","c##book_ex","rladncjf1"); */
String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
String DB_USER = "c##book_ex";
String DB_PASSWORD= "rladncjf1";

Connection conn;
Statement stmt;

try {
 Class.forName("oracle.jdbc.driver.OracleDriver");
 conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
 stmt = conn.createStatement();
 conn.close();
 out.println("Oracle jdbc test: connect ok!!");
} catch(Exception e) {
 out.println(e.getMessage());
}
%>
</body>
</html>



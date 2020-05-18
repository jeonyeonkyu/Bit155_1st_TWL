<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	클라이언트 브라우저가 가지고 있는 Cookie값들을 읽어올 수 있음
	//사이트 주소마다 각각 갖는 쿠키가 다름
	내 domain에 해당하는 cookie값을 가지고옴
		
-->
<%
	/* 쿠키 배열  */
	Cookie[] cs = request.getCookies();
	if(cs != null || cs.length > 0){
		for(Cookie c : cs){
			out.print(c.getName() + "<br>");
			out.print(c.getValue() + "<br>");
			out.print(c.getMaxAge() + "<br>");
			out.print(c.getDomain() +"<hr><br>");
			/*지금 IP라 도메인은 null  */
		}
	}
%>
</body>
</html>
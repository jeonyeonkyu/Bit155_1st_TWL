<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 클라이언트 브라우저가 가지고 있던 쿠키값을 읽어오면 된다. 쿠키값들이 여러개일 것이므로 한꺼번에 다 가져오기위해 배열
	내 도메인에 해당하는 쿠키값들을 다 가져온다. -->
	
	<% Cookie[] cs = request.getCookies();
	
	if(cs != null || cs.length > 0){
		for(Cookie c : cs){
			out.print(c.getName()+"<br>");
			out.print(c.getValue()+"<br>");
			out.print(c.getMaxAge()+"<br>");
			out.print(c.getDomain()+"<hr>");
		}
	}
	%>
	
</body>
</html>
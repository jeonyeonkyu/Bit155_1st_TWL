<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h3>request 객체 (include) 된 페이지에서는 [공유] 할 수 있다.</h3>
	<hr>
	<%= request.getParameter("type") %><br>
	<%= request.getParameter("userid") %><br>
	<hr>
	<h3>main 페이지에서 param 액션 태그로 전달 된 값을 이 페이지(include된)에서 잡아올 수 있다.</h3>
	
	<%
		String hobby = request.getParameter("hobby");
		String pwd = request.getParameter("pwd");
		
		out.print("비번: " + pwd + "<br>");
		
		if(hobby.equals("baseball")){
			out.print("<i>당신의 취미는 "  + hobby + "</i>" );
		}else{
			out.print("다른 취미 이군요");
		}
	
	
	%>
</body>
</html>
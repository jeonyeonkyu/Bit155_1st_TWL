<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h3>request 객체 (include) 된 페이지에서는 [공유]</h3>
	<!-- 원래는 페이지 하나에 request 객체 하나 -->
	<hr>
		<%= request.getParameter("type") %><br>
		<%= request.getParameter("userid") %><br>
	<hr>
	<h3> main 페이지에서 param 액션태그로 전달된 값</h3>
	
	<%
		String hobby= request.getParameter("hobby");
		String pwd = request.getParameter("pwd");
		out.print("비번: " +pwd + "<br>");
		if(hobby.equals("basesball")){
			out.print("<i>당신의 취미는 "+hobby+ "</i>");
		}else{
			out.print("다른 취미가 있네요<br>");
		}
	%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<!--★★★★★★★★ 제일 중요  
		request객체에서는 하나의 페이지만 존재가능
		하지만 그request객체에 다른 페이지를 includes하면 
		
		한줄 암기 : include된 페이지에서는 request 객체를 공유할 수 있다
		
	-->
	<h3>request 객체(include) 된 페이지에서는 [공유]</h3>
	<hr>
		<%= request.getParameter("type") %><br>
		<%= request.getParameter("userid") %><br>
	<hr>
	<h3>main 페이지(Ex14_Include_param.jsp)에서 param 액션태그로 전달된 값</h3>
	<%
		String hobby = request.getParameter("hobby");
		String pwd = request.getParameter("pwd");
		out.print("비번:" + pwd + "<br>");
		if(hobby.equals("baseball")){
			out.print("<i>당신의 취미는 " + hobby + "</i>");
		}else{
			out.print("다른 취미가 있네요.");
		}
		
	%>

</body>
</html>
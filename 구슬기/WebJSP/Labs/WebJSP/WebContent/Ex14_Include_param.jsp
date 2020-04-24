<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("UTF-8");
    String type=request.getParameter("type");
    String userid = request.getParameter("userid");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	type:<%=type %><br>
	userid:<%=userid %><br>
		<!--  그리고 다른기능...값을 넘길수있다     주석이 21번줄에 잇었을대는 에러남 -->
	<jsp:include page="Ex14_param.jsp">
		<jsp:param value="baseball" name="hobby"/>
		<jsp:param value="1004" name="pwd"/>
	</jsp:include>
		
	
	include 된 페이지에서 request 객체를 공유 할 수 있다.

</body>
</html>
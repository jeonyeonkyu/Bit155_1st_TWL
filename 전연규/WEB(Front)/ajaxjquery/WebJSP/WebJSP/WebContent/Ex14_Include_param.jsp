<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	String type = request.getParameter("type");
	String userid = request.getParameter("userid");
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 한줄 암기 : include된 페이지에서는 request 객체를 공유할 수 있다 -->
	type:<%= type %><br> 
	userid:<%= userid %><br>
	<!-- ★ type과 userid를 Ex14_param.jsp에서도 사용 가능 ★-->
	<jsp:include page="Ex14_param.jsp">
		
		<jsp:param value="baseball" name="hobby" />
		<jsp:param value="1004" name="pwd" />
	</jsp:include>
	<!-- 그리고.. 다른 기능... incldue된 페이지에 값을 넘길수 있음.(잘안씀)  
		jsp:include안에 주석까지 전달하면 에러발생
	-->

</body>
</html>

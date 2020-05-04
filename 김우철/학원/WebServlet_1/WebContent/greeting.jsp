<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 서버에 의해 forward된 페이지라 사용자가 직접 확인해서는 안됨, 회원가입,로그인 뺴고는 다 보안폴더에 들어간다?  -->
	<h3>FrontServletController에 의해서 Forward된 페이지</h3>
	기존 : <%=request.getAttribute("msg") %><br>
	EL&JSTL : ${requestScope.msg}<br>
	
</body>
</html>

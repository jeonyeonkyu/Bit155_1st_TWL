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
1.메모리 쿠키 (브라우저가 떠있는 동안에만 유효) : Client가 강제로 삭제하지 않는 한
									브라우저 닫기 전까지는 유효(소멸타임 : -1)
									: Expires에 Session이 있음
									
2.파일 쿠키(소멸 시간을 가지고 있음) : Client가 강제로 삭제하지 않는 한
									브라우저 닫아도 소멸 X, 정해진 시간까지는 유효(2020년12월25일)
	setMaxage(60) >> 60초
	30일 
	(30*24*60*60) 일*시*분*초
	setMaxage(30*24*60*60)
-->
<%
	Cookie co = new Cookie("bit", "hong");
	co.setMaxAge(30*24*60*60);
	response.addCookie(co);
%>
</body>
</html>
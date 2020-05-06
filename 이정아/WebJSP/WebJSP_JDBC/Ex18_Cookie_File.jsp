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
		Memory Cookie(브라우저 쿠키) : Client가 강제로 삭제하지 않는 한, 브라우저가 닫힐 때 까지 유효하다. (소멸시한이 -1이다.)
		
		File Cookie(소멸시한을 가지고 있다) : Client가 강제로 삭제하지 않는 한, 정해진 시간까지 유효하다.(2020/12/25) 이런식으로... 브라우저를 닫고 다시 확인해봐도 남아있음
		
		setMaxage() 함수를 사용해서 파라미터에 값을 주면 그 기한대로 설정이 된다.
		setMaxage(60) >>60초
		setMaxage(30*24*60*60) 일*시*분*초 (30일, 24시, 60분, 60초)
	 -->
	 <%
	 	Cookie co = new Cookie("bit", "lee");
	 	co.setMaxAge(30*24*60*60);
	 	response.addCookie(co);
	 %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Simple View</title>
</head>
<body>
	<h3>simplecontroller 에서 forward(주소는 그대로고 내용만 바뀜) 된 페이지 </h3>
	요청한 결과 출력 <%= request.getAttribute("result") %>
	<br>
	<h3>EL & JSTL 표기를 권장해용</h3>
	EL 요청결과 : ${requestScope.result}<br> 새로고침 하면 생성자호출은 변경없이  클라이언트 요청이 계속 찍힌다. 
	
	
</body>
</html>
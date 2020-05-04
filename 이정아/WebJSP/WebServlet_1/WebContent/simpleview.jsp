<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Simple View</title>
</head>
<body>
	<h3>SimpleController에서 forward 된 페이지 = 주소값은 변경되지 않고 내용만 바뀐다.</h3>
	요청한 결과를 출력해보기 <%= request.getAttribute("result") %>
	<br>
	<h3>EL & JSTL을 이용해서 출력하는것을 권장하므로</h3>
	 el 요청 결과 ${requestScope.result}<br>
	
</body>
</html>
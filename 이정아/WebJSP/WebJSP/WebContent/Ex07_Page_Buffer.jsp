<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page buffer="8kb" autoFlush = "true" %>
    <!-- 위의 설정값을 줄 필요가 없다. default라서
    	8kb가 차면 true설정이므로 자동으로 내보냄.
    	page 내용이 buffer를 채우면 자동으로 flush한다.
     -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

//출력객체라는 것이 있음. (System.out.println() >> 동일한 역할을 하는 객체 = out 객체)
//페이지에서 더 이상 출력할 내용이 없으면 자동으로 내보낸다(flush).
for(int i = 0; i < 10; i++){
		out.print("<b>" + i +"<b><br>");
	}

%>

</body>
</html>
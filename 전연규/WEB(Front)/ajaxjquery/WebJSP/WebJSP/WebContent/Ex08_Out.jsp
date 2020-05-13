<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 out</title>
</head>
<body>
	<!-- 퍼센트안에 퍼센트를 사용못함  -->
	<!-- 스파게티 코드 : 장점 UI하기 편함 -->
	<%
		boolean b = true;
		if (10 > 5) {
	%>
	IF(true)
	<font color="red"><%=b%></font>
	<%
		} else {
			b = false;
	%>
	<font color="blue"><%=b%></font>
	<%
		}
	%>
	
	
	
	<h3>out 객체(서버코드 작업이 편함 >> UI 작업이 불편)</h3>
	
	<%
		boolean b2 = true;
		if(10 > 5){
			out.print("IF(true):<font color='red'>" + b2 + "</font>");
		}else {
			out.print("IF(true):<font color='blue'>" + b2 + "</font>");
		}
	%>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 out</title>
</head>
<body>


<% 
	boolean b = true;
	if(10> 5){
%>
	if(true)<font color="red"><%= b %></font>
<% 		
	}else{
		b = false;
	
%>
	if(false)<font color="blue"><%=b %></font>
<%
	}
%>

<h3> out 객체(서버코드 작업이 편해요 >>반면에 UI 작업이 불편해용)</h3>
<p><b>똑같은 결과인데 쓰는 방법이 다르다 . 스파게티 코드? 랑 아웃 객체 사용</b></p>
<%
	boolean b2 = true;
	if(10>5){
		out.print("If(true):<font color='red'>"+b2+"</font>");
	}else{
		out.print("If(false):<font color='red'>"+b2+"</font>");
	}
%>

</body>
</html>
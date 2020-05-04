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
	TODAY POINT
	서버 자원(WAS : memory 사용하기)
	 
	-Application 객체 (전역자원) >> 접속하는 모든 사용자가 다룰 수 있는 자원
	-Session 객체 >> 접속하는 브라우져 마다(SessionID) 고유하게 부여되는 객체(고유한 자원)
					(접속하는 사용자마다 고유하게 부여되는 자원)
					
	사이트접속(전체 접속자 수: 100000명)
	application.setAttribute("count", 0); //count 변수는 전역자원
	사이트에 접속하는  모든 session 은 count 라는 변수에 접근 가능
	
	
	[session]
	session.setAttribute("ID","kglim") // ID 변수는 session 객체 안에 생성
	접속한 모든 사용자 마다 고유하게 부여되는 객체 안에 생성...
	
	A 라는 사용자가 웹 서버 접속
	서버 고유한 session 객체 자동 생성 > 객체 식별값(A001) > 식별값 > 접속한 client response
	AA05BBAC key에 해당하는 session 객체를  /....
	
		B 라는 사용자가 웹 서버 접속
	서버 고유한 session 객체 자동 생성 > 객체 식별값(B001) > 식별값 > 접속한 client response
	AA05BBAC key에 해당하는 session 객체를  /....
	

 -->
<h3> 세션정보</h3>
 웹서버가 부여하는 고유한 sessionID : <%= session.getId() %> <br />
  <%
 	String userid = request.getParameter("userid");
 	session.setAttribute("id",userid); //id가 session변수
 %>
 <h3>세션 변수값</h3>
<%
	String id = (String)session.getAttribute("id");
	out.print("당신의 ID는 <b> " + id + "</b>");
%>
</body>
</html>
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
	
	2가지 방법
	1.Application 객체 (전역자원) >> 접속하는 모든 사용자가 다룰 수 있는 자원
	2.Session 객체  >> 접속하는 브라우저 마다 (SessionID) 고유하게 부여되는 객체(고유한 자원)
					(접속한 사용자마다 고유하게 부여되는 자원)
			
	[Application]		
	사이트 접속(전체 접속자 수 : 10만명)
	application.setAttribute("count", 0); //count 변수는 전역자원이 된다
	사이트에 접속하는 모든 세션은 count라는 변수에 접근이 가능하다
	
	[Session]
	session.setAttribute("ID", "kglim"); //ID 변수는 session 객체안에 생성
	접속한 모든 사용자 마다 고유하게 부여되는 객체안에 생성 ...
	
	A라는 사용자가 웹 서버 접속
	서버가 고유한 session 객체 자동 생성 > 객체 식별값(A001) > 식별값을 접속한 Client에게 response
	A001... key에 해당하는 session객체를 Client가 가지고 놈
	

	B라는 사용자가 웹 서버 접속
	서버가 고유한 session 객체 자동 생성 > 객체 식별값(B001) > 식별값을 접속한 Client에게 response
	B001... key에 해당하는 session객체를 Client가 가지고 놈
	
-->
	<h3>세션정보</h3>
	웹서버가 부여하는 고유한 sessionID :
	<%=session.getId()%><br>

	<!--★★★★  -->
	<h3>세션 변수값</h3>
	<%
		String userid = request.getParameter("userid");
		session.setAttribute("id", userid); //id가 세션변수
	%>
	<h3>세션 변수값</h3>
	<%
		String id = (String) session.getAttribute("id");
		/* Object를 String으로 다운 캐스팅 */
		out.print("당신의 ID는 <b> " + id + "<b>");
	%>
	
	<!--세션 객체는 접속한 Client 브라우저마다 부여되는 고유한 객체  
		사용자의 고유한 정보를 세션에 담는다.
		세션은 도메인당 하나씩 생성되는거
	-->
</body>
</html>
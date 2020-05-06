<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 가장 중요한 부분

	서버자원(WAS : 의 메모리를 사용하는 방법)
	
	1. Application 객체를 사용하는 방법(전역자원) >> 접속하는 모든 사용자가 다룰 수 있는 자원 , 현재 접속자 수 표시라던지...
	
	2. Sesstion 객체를 사용하는 방법 >> 접속하는 브라우저마다 고유하게 부여되는 객체 (고유자원)
	
	사이트 접속(전체 접속자 수 : 10000명)
	
	application.setAttribute("count", 0); //count 변수는 전역자원
	사이트에 접속하는 모든 session은 count라는 변수에 접근이 가능하다.
	
	반대로 Session은 
	session.setAttribute("ID", "lee"); //ID라는 변수는 session 객체 안에 생기고, 이 객체는 클라이언트의 고유한 자원이 된다.
	접속한 모든 사용자마다 고유하게 부여되는 객체 안에 생성이 된다.

	A라는 사용자가 웹 서버에 접속을 시도
	서버가 고유한 session 객체를 자동생성하고, 그 객체에 식별값을 부여한다. (A-001) 이런식으로 > 이 식별값을 접속한 클라이언트에게 response한다.

 -->
 <h3>세션정보</h3>
 웹 서버가 부여하는 고유한 sessionID : <%= session.getId() %><br>

 <h3>세션 변수값</h3>
 <%
 
 String userid = request.getParameter("userid");
 session.setAttribute("id", userid); //id라는 키 값을 이용해서 사용자에게 받은 userid값을 셋팅하겠다. id가 session 변수 값
 
 %>
 
 <h3>세션 변수값</h3>
 <%
 
 String id = (String)session.getAttribute("id"); //세션객체가 저장을 받을 때 오브젝트타입으로 받아두기 때문에 다시꺼낼 때에는 받는 변수가 string타입이므로 string타입으로 다운캐스팅 해줘야한다.
 out.print("당신의 ID는 <b> " + id + "<b>");

 
 %>
</body>
</html>
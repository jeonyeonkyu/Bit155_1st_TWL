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
	정보(데이터) > where 저장
	클라이언트(개인 로컬 PC 브라우저) : 서버(웹 서버 또는 DB서버)
	
	정보(데이터, 자료) >> 어디에 저장(보관)
	고민 : 보안 요소(정보의 중요성), 소멸(일시적, 영속적)
	
	Client(Local PC : 웹 브라우저) / client pc에 저장
	1.Cookie(메모리 쿠키, 파일 쿠키(local에 txt파일로 저장 : 암호화) >> 소멸시기
	- 쿠키는 해커들이 가장 많이 노림 
	2.Local Storage : 쓰는데도 있고 없는데도 있음(아마 규모가 크고 좋은 사이트만 쓸듯?)
	- 저장소 : key, value
	
	Server(WebServer : Tomcat)
	1.Server memory : Session 객체(접속한 사용자의 식별값(key), 개인정보, 접속시간) >> 보안성은 좋은데 영속적 X, 서버가 꺼지거나 리부팅 하면 메모리가 사라짐
	2.Server memory : Application 객체(접속한 모든 사용자가 공유하는 객체) >> 서버가 꺼지거나 리부팅 하면 메모리가 사라짐
	3.Server 영속적 : 파일 >> login.txt >> 영속적이긴 하지만 데이터로써 쓰기엔 관리가 힘듬
	4.DB Server : 보안도좋고 영속적 >> 단점이라면 개발자들이 더 노력을 들어야됨
	
  -->
  <%
  	Cookie mycookie = new Cookie("cname", "1004");
  	//생성 
  	//만든 쿠키를 Client 브라우저에게 전달 >> response
  	response.addCookie(mycookie);
  	
  	//★
  	//JSESSIONID : 서버가 클라이언트에게 부여하는 식별값
  	//브라우저를 닫으면 클라이언트가 받은 식별값은사라짐(모든 브라우저 닫아야함), 
  	//허나 서버는 식별값을 가지고 있음(영원히 보관은 x / 보통 20분)
  	//새로접속하면 클라이언트가 부여받은 식별값은 다름
  	//식별값과 쿠키값의 운명은 같다()
  	
  %>
  <a href="Ex17_Cookie_Read.jsp">Cookie read</a><br>
  서버에서 설정한 쿠키 이름 : <%= mycookie.getName() %><br>
  서버 설정한 값 : <%= mycookie.getValue() %><br>
  서버 설정한 쿠키 소멸설정 : (session 소속[-1 리턴됨]) : <%= mycookie.getMaxAge() %> <!--최대 수명 -->
  <!-- 브라우저가 떠있는 동안에만 확인 가능  -->
</body>
</html>
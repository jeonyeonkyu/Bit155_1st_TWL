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
	정보(데이터)를 저장하는 장소는?
	지금까지는 서버에 저장했다. (클라이언트의 개인 local PC의 브라우저)  : 서버(웹 서버 또는 DB서버)	
	
	정보(데이터, 자료)들의 보관에 대해
	고민 : 보안 요소(정보의 중요성) , 소멸(일시적, 영속적)
	
	<Client (Local PC = 웹 브라우저)에 저장하는 방법은>
	
	1. Cookie = 메모리쿠키(브라우저가 떠있는 동안에만 유효) 
			  = 파일쿠키(브라우저를 닫아도 남아있음, local에 텍스트파일로 저장, 암호화되어있음)
			  메모리쿠키와, 파일쿠키의 구분점은 소멸시기로 나뉘어진다. 개발자도구(Application)로 보면 Expires가 정해져 있다면 파일쿠키이다. 파일쿠키는 PC주인이 제어를 할 수 있기 때문에(삭제가 가능) 
			  															회원정보와 같은 정보는 넣어두면 안된다. 그리고 암호화되어있어도 해킹의 대상이 될 수 있기 때문에
			  															
	2. Local Storage(클라이언트의 저장소) = Key, Value로 저장
	
	<Server (WebServer : Tomcat)>
	1. server memory : session 객체(접속한 사용자의 식별값, 개인정보, 접속시간) >> 서버가 꺼지거나 리부팅하면 소멸
					   Application 객체(접속한 모든 사용자가 공유하는 객체) >> 역시 서버가 꺼지거나 리부팅하면 소멸
	
	2. server에 영속적으로 저장하는 법 : file형태로 저장 >> login.txt >> 영속적이긴 하나 관리가 힘들다. 
	3. server에 영속적으로 저장하면서 효율적으로 관리하는 방법 >> DB서버 사용 (보안우수, 영속적, 편리함) 이 있다.
	
-->
<% Cookie mycookie = new Cookie("cname", "1004"); 
	//쿠키생성
	//만든 쿠키를 클라이언트 브라우저에게 전달해야 함 >> response 객체를 통해서
	
	response.addCookie(mycookie);

%>
<a href = "Ex17_Cookie_Read.jsp">Cookie read</a><br>
서버에서 설정한 쿠키 이름 : <%= mycookie.getName() %> <br>
서버에서 설정한 값(value값 얻을 수 있음) : <%=mycookie.getValue() %><br>
서버에서 설정한 쿠키 소멸설정 : (session 소속 : 소멸시한이 없음, 리턴값이 -1이면 브라우저쿠키(브라우저 닫히면 같이 소멸)): <%= mycookie.getMaxAge() %><br>

</body>
</html>























<%@page import="kr.or.bit.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Object Scope</title>
</head>
<body>

<!-- 

	Tomcat 제공(WAS) 기본적인 내장 객체
	1. request (요청: 클라이언트 정보)
	2. response(응답 : 특정페이지 이동, 정보출력, 쿠키 쓰기)
	3. application(전역객체  : web.xml 자원 read, 전역자원)
	4. session(접속한 사용자(브라우져) 고유하게 부여되는 개체, 고유한 변수) -브라우저는  session 의 key 를 가지고 있음 
	5. out (out.print())
	
	
	session 객체
	[내부에 session 변수 생성]
	scope : a.jsp (session.setAt... "member" 변수 생성)
			b.jsp (session.getAt... "member" read 가능)
			
			
	session 변수는 (현재  WebContent(웹프로젝트) 폴더안에 있는 모든 페이지에서 사용 가능하다)
	Life-cycle : 1. session 변수는  session 객체와  동일하다 ( sessionID 소멸)
				 2. 서버 리부팅, session.invalidate()
				 
	
	
	application 객체
	[객체 내부에  application 변수 생성 :전역 변수 >> 모든  session이 공유가능 >> 접속하는 모든 사용자 ]
	scope : (현재  WebContent(웹프로젝트) 폴더안에 있는 모든 페이지에서 사용 가능) >> java 로 치면 static
	Life-cycle : 소멸 (서버 리부팅)
	
	+
	
	request 객체
	[request 변수 ] : request.setAttribute("type","A");
	scope : 요청 페이지 (login.jsp -> request 객체 >> scope >> 생성된 page)
	*****예외적으로*****
	login.jsp(include , forward) 라면 request 객체는 그 페이지에 공유된다  *****중요!!!!!!
	
	 
	
 -->
 
 <%
 	//session
 	
 	Emp emp = new Emp();
 	emp.setEmpno(2000);
 	emp.setEname("홍길동");
 	
 	//생성은 login.jsp 라고 가정을 한다면 
 	session.setAttribute("empobj",emp);
 	
 	//다른 페이지 가정(member.jsp)
 	Emp e = (Emp)session.getAttribute("empobj");
 	out.print(e.getEmpno() + "<br>");
 	out.print(e.getEname() + "<br>");
 	
 	
 	
 	
 	//request
 	request.setAttribute("who", "king"); //scope 생성된 페이지
 	String who= (String)request.getAttribute("who");
 	out.print("who" + who);
 	
 	//<jsp:include page="b.jsp"></jsp:include>
 	//<jsp:forward page="b.jsp"></jsp:forward>
 	
 	// b.jsp 에서는
 	// session.getAttribute("empobj") >>가능
 	//request.getAttribute("who")  >> 가능 
 	
 	
 	//여기까지가 jsp 끝 
 %>
 
 	
</body>
</html>














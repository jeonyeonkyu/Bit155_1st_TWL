<%@page import="kr.or.bit.Emp"%>
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
		<아파치톰캣(WAS)이 제공하는 기본적인 내장객체들(new 없이도 사용 가능)>
		1. request (요청객체) - 클라이언트의 정보를 읽어냄
		2. response(응답객체) - 특정 페이지를 이동, 클라이언트의 화면단에 정보를 출력, 쿠키를 쓰는 작업...)
		3. application(전역객체) - web.xml 의 자원을 처리한다던지, read하기, 전역자원
		4. session(접속한 사용자(브라우저) 마다 고유하게 부여되는 객체) - 고유한 변수를 만들어서 사용
		5. out(출력객체) out.print...
		
		
		<session 객체>
		[내부에 session 변수를 생성 할 수 있다.]
		생성된 session 변수의 scope는? (유효범위)
		
		a.jsp(session.setAttribute("member" 변수를 생성)
		b.jsp에서 member라는 변수를 사용 할 수 있을까? 가능하다. (session getAttribute 해서 "member"의 read가 가능하다)
		
		session 변수는 (현재 WebContent 폴더 안에 있는 모든 페이지에서 사용 가능하다)
		Life-cycle : 1. session 변수는 session 객체와 라이프사이클이 동일하다.(sessionID가 소멸하면 같이 소멸)
					 2. 서버 리부팅, session.invaildate()... 하면 session변수 사라짐
					 
		<Application 객체>
		[Application 객체 내부에 application 변수를 만들 수 있다. = 전역변수 >> 모든 session이 공유 할 수 있다.]
		접속하는 모든 사용자가 접근 가능하다.
		
		scope는 (현재 WebContent 폴더 안에 있는 모든 페이지에서 사용 가능하다) >> java의 static과 같음
		
		Life-cycle : 소멸(서버가 리부팅 시에)
		
		+
		
		<request 객체>
		[request 변수] : request.setAttribute("type", "A");
		scope : 요청 페이지(login.jsp) 단, 예외적으로 login.jsp가  "include, forward 된다면"  request 객체는 그 페이지에 공유된다.
	
	 -->
	 
	 <%
	 	Emp emp = new Emp();
	 	emp.setEmpno(2000);
	 	emp.setEname("이정아");
	 	
	 	session.setAttribute("empobj", emp); //emp 객체를 통째로 넣은 것
	 	
	 	
	 	
	 	//다른페이지가 있다고 하면 (member.jsp)
	 Emp e =(Emp)session.getAttribute("empobj");
	 out.print(e.getEmpno() + "<br>");
	 out.print(e.getEname() + "<br>");
	 	
	 	
	 %>
</body>
</html>



















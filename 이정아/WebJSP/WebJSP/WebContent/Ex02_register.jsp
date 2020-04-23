<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
    
   
  <% 
  	request.setCharacterEncoding("UTF-8");
   //서버에서는 객체를 제공 받는다.
   //아파치 톰캣이 원래부터 가지고 있던 객체 : 웹 전용 객체를 제공받는다. (request, resuponse) : 내장객체(new 없이도 사용 가능)
   //request를 요청객체라고 한다.= 클라이언트에 대한 정보를 얻는다. (정보에는 입력한 데이터, 브라우저에 대한 버전에 대한 정보, 클라이언트의 ip정보같은 것들이 포함),
   //resuponse를 응답객체라고 한다. = 서버에서 받은 정보를 클라이언트에게 write하는 것
   
  //클라이언트가 서버에 요청을 했을 때
  //Ex02_register.jsp로 요청을 하면서 form태그를 통해 여기로 데이터를 보냄
  //Ex02_register.jsp?userid=hong&pwd=1004&hobby=baseball&habby=soccer 이런식으로
  
  String uid = request.getParameter("userid");
  String pwd = request.getParameter("pwd");
  //String hobby = request.getParameter("hobby"); 하나만 받겟다는 것. 그러나 hobby가 여러개이므로 이렇게 받으면 안됨
  String[] hobby = request.getParameterValues("hobby");
  
  /*
  	한글 처리에 대해서 현재는 GET방식, 아파치톰캣 9버전을 사용중이기 때문에 한글출력을 지원한다.
  	톰캣 9버전 이하에서는 따로 한글처리가 필요한데,
  	
  	1. 페이지 상단에 인코딩 : request.setCharacterEncoding("UTF-8"); 이 필요하다.
  	2. server.xml의 63번째 라인에 아래와 같은 문장에 URIEncoding="UTR-8" 를 추가 해야한다.
  	<Connector URIEncoding="UTF-8" connectionTimeout="20000" port="8090" protocol="HTTP/1.1" redirectPort="8443"/> 
  	
  	그러나 톰캣 9버전이어도 전송 방식이 POST라면 버전에 상관없이 받는 페이지 상단에 무조건 request.setCharacterEncoding("UTF-8"); 을 추가해줘야 한다.
  	
	헷갈리니까 그냥 jsp상단에 무조건 request.setCharacterEncoding("UTF-8"); 을 쓰자
	
  
  */
  
  %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		서버에서 응답<br>
	ID입력값 : <%= uid %><br>
	PWD입력값 :<%= pwd %><br>
	당신의 취미는 : <br>
	<%
		for(String str : hobby){
	%>
		hobby:<%= str %><br>
	<%	
		}
	%>
	<br>
	
</body>
</html>














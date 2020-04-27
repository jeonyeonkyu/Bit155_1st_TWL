<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
  /*
  
  	웹 환경 
  	
  	
  	Client (웹 브라우저로 보면됨)     ->    Server (요청 정보를 read ...처리)
  	                   (request:요청)
  	
  	Server                   ->      Client 
  	                   (response:응답 >> 클라이언트의 브라우저가 해석할 수 있는 내용[text,html,css,js])
  	
  	
  	지원 : 아파치 톰켓 ( 자원: javax 패키지로 시작) 
  	
  	
  	response   
  	1. 표현식(출력) <%=   이거 담당
  	2. 페이지 이동 처리 (sendRedirect)
  	
  	*****: javascript 에서 한거 : location.href ="Ex01_Basic.jsp"  이페이지를 다시 주세요!
  	** 페이지를 서버에게 재요청 : 웹 브라우져 F5 (새로고침)  
  	
  	java : response.sendRedirect("Ex01_Basic.jsp") 이페이지 다시주세요!!!
  	=== location.href ="Ex01_Basic.jsp" 같은 열할
  	 
  	                   
  	                   
  	                   
  */
    
    
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sendRedirect</title>
</head>
<body>

	1. 일반적인 출력(): <%= 100+200+300 %><br>
	2. sendRedirect : response 객체의 함수를 활용 (클라이언트가 서버에게 페이지를 재요청)하게 만드는 효과
	<%
		response.sendRedirect("Ex01_Basic.jsp"); //이걸 54 번줄 코드로 바꿔서 클라이언트에게 넘어감 그래서 54번 방법 으로 많이 씀 
	%>

</body>
<script type="text/javascript">
	//location.href="Ex01_Basic.jsp";  이거 살리고 09번 실행하면 휘리릭하고 저01로 감
</script>
</html>






























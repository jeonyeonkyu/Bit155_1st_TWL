<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
/*
웹 환경

	Client(웹브라우저)    ->     Server (요청 정보를 read... 처리)
				   (request:요청)

	Server				  ->   	 Client (응답)					
				   (response:응답 >> 클라이언트의 브라우저가 해석 가능한...)
				   
	=>아파치 톰캣 환경 아래에서 가능하다. (아파치 톰캣이 지원하는 자원 : javax 라는 패키지로 시작한다.)
	
	response
	1. 표현식(출력 담당) <%=
	2. 페이지에 대한 이동처리(sendRedirect)
	
	***** : javascript에서 배웠음 : setTimeout...? setInterval...? location.href...? = "Ex01_Basic.jsp"
	**** => 페이지를 서버에서 재요청 하는 것과 똑같다. = 웹브라우저에서 f5(새로고침) 누르는 것과 같음****
	
	
	
	java : response.sendRedirect("Ex01_Basic.jsp")
	=== location.href = "Ex01_Basic.jsp" 와 같은 역할이다.
	
*/				


%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	1.일반적인 출력방법() : <%= 100+200+300 %><br>
	2.sendRedirect()를 사용해서 페이지를 이동하는 방법 :response객체의 함수 이용해서 클라이언트가<br>
	서버에게 페이지를 재요청 하도록 하는 효과
	
	<%
	
		response.sendRedirect("Ex01_Basic.jsp");
	%>
	
</body>
<script type="text/javascript">

location.href = "Ex01_Basic.jsp";

</script>

</html>























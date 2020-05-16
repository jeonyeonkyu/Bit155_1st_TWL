<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	/* 
	웹 환경
	
	Client(웹 브라우저)		 -> 		Server (요청 정보를 read ... 처리)
					(request : 요청)
					
	Server 				 -> 		Client
					(response:응답 >> 클라이언트 브라우저가 해석할 수 있는 내용)
	지원 : 아파치 톰캣(자원 : javax)
	
	response
	1. 표현식(출력) <%=
	2. 페이지 이동 처리(sendRedirect)
	
	★★★★★ : javascript : location.href = "Ex01_BAsic.jsp"
	★★ 페이지를 서버에게 재요청 : 웹 브라우저 F5(새로고침)
	
	java :response.sendRedirect("Ex01_Basic.jsp")
	=== location.href = "Ex01_BAsic.jsp"
	
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	1.일반적인 출력() : <%=100 + 200 + 300 %><br>
	<%=%>
	2.sendRedirect : response객체의 함수(클라이언트가 서버에 페이지를 재요청)
	<%
		response.sendRedirect("Ex01_Basic.jsp");
	/*  이 코드가 웹브라우저로 넘어가면 location.href=""로바뀜 */
	%>
</body>
<script>
	location.href = "Ex01_Basic.jsp";
	/* 이걸 많이 씀  */
</script>
</html>
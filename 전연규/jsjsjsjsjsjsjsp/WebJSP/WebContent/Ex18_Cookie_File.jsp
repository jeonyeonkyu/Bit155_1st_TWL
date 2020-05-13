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
 1.메모리 쿠키 (브라우져 쿠키) : Client 강제로 삭제하지 않는 한 ..
        				 브라우져 닫기 전까지 유효(소멸타임 : -1)
  2. 파일 쿠키(소멸 시간을 가지고 있다()) :  Client 강제로 삭제하지 않는 한 ..
  	              				정해진 시간 까지 유효(2020년 12월 25일까지...)
  	setMaxage(60) >> 60초
  	30일
  	(30*24*60*60) 일*시 *분*초    
  	 setMaxage(30*24*60*60)   				
 
  -->
  <%
  	Cookie co = new Cookie("bit","hong");
  	co.setMaxAge(30*24*60*60);
  	response.addCookie(co); //클라이언트에 쿠키 던져주기
  	//이래야 쓸 수 있음 
  %>
</body>
</html>
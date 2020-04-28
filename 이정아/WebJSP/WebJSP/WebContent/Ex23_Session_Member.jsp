<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//session 객체는 WAS 페이지 안에 있는 어떤 페이지던 사용이 가능하다. Ex23_Session 에서 만들었던 것
    	 String memberid = (String)session.getAttribute("memberid");
    boolean loginstate = (memberid == null) ? false : true;
    
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 전용 페이지</title>
</head>
<body>
	<%
		if(loginstate == true){
			out.print(memberid + "님 로그인 상태입니다.<br>");
			out.print("당신은 이 페이지를 볼 수가 있습니다.<br>");
			out.print("<a href = 'Ex23_Session_Logout.jsp'>로그아웃</a> "); //a는 링크를 만들어서 클릭 할 수 있도록
		}else{
			out.print("<script>alert('회원이 아닙니다.')</script>");
			out.print("<script>location.href = 'Ex23_Session_Login.jsp'</script>"); //script문은 바로 이동시키게
		}
	
	%>
</body>
</html>
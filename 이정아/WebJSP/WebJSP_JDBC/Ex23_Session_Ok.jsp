<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	//한글처리
	
	request.setCharacterEncoding("UTF-8");

	//데이터 받기
	String uid = request.getParameter("uid");
	String pwd = request.getParameter("pwd");

	//확인하기
	//out.print(uid + "/" + pwd);

	//로직(비지니스) 업무 처리
	//예를들어 DB연결 > select > 회원테이블 중에서 id, pwd가 존재하는지 확인하겠다.
	//지금은 id, pwd 같으면 회원인정
	
	boolean success = false;
	
	if(uid.equals(pwd)){
		//로그인 성공
		//중요중요중요중요중요중요 session 객체 안에 변수를 만들어서 id를 담기
		session.setAttribute("memberid", uid); //memberid라는 변수를 만들어서 그 변수에 uid(너의 아이디)를 담겠다.
		success = true;
	}

%>
<title>Insert title here</title>
</head>
<body>

	<%
	if(success == true){
	out.print("<b>로그인 성공</b><br>");
	String user = (String)session.getAttribute("memberid"); //session 타입이 담고있는 객체가 오브젝트 타입이라서 받는 타입으로 다운캐스팅 해줘야 함
	out.print(user + "님 로그인 되었습니다. <br>");
	out.print("<a href = 'Ex23_Session_Member.jsp'>회원전용</a>");
	}else{
	%>
		<script type= "text/javascript">
		alert("다시 로그인해주세요");
		//location.href = "이동 페이지 주소를 할당" = 다시 로그인 할수 있도록 로그인 페이지 다시 연결 location.href="Ex23_Session_Login.jsp"
		window.history.go(-1); //방문했던 사이트 중 바로 전 페이지로 = Session_Login.jsp로 이동하라는 것과 같음 위의 코드를 더 많이 씀
		</script>
	<%	
		} 
	%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//java코드(back단 코드 : 서버에서 동작(컴파일)되는 코드))를 쓸 수 있음
	//Ex14_Form~의 Action 속성의 목적지 주소가 됨.
	//클라이언트가 가지고 있는 데이터를 받아서 여기서 처리
	//<input type="text" name="userid"><br>
	//<input type="text" name="userpwd"><br>
	String userid = request.getParameter("userid"); //클라이언트가 입력한 id값을 받아서 변수로 전달
	String pwd = request.getParameter("userpwd"); //클라이언트가 입력한 pwd값을 받아서 변수로 전달

	//받아와서 실제 로그인 처리는
	//JDBC를 사용해서 DB에 연결하여 select... 해보기 ( 회원인지 아닌지 판단 ) -> 이 결과에 따라서 클라이언트에게 응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
</head>
<body>
	<h3>당신이 입력한 데이터</h3>
	ID : <%=userid%><br> <!-- 변수값에 담고 있던 데이터를 클라이언트에게 다시 전달-->
	PWD : <%=pwd%>
</body>
</html>
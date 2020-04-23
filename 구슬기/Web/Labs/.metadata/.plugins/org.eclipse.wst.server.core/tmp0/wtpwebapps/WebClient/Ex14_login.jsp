<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //java 코드 (back 단 코드: 서버에서 동작(컴파일) 되는 코드)
   //목적지 주소(Form action="Ex14_login.jsp") Ex14_Form_Submit 에서  여기오겠다.
   //클라이언트가 가지고 있는 데이터를 받아서 처리.....
   // <input type="text" name ="userid"><br>
   // <input type="text" name ="userpwd"><br>
   String userid= request.getParameter("userid");
   String pwd = request.getParameter("userpwd");
   
   //실제 로그인 처리
   //JDBC 사용 >> DB 연결 >> select....  해서 있나 없나 확인. >> 회원인지, 아닌지 판단 후 >> 클라이언트 응답 
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
</head>
<body>
	<h3>당신이 입력한 데이터</h3>    <!--  데이터를 받아서 변수에 넣고 그걸 다시 클라이언트에게 보내주는것.--> 
	ID : <%= userid %><br>
	PWD : <%=pwd %><br>
</body>
</html>
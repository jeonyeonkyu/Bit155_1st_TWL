<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% 
	String userid = ""; //쿠키 읽기
	Cookie[] cookies = request.getCookies();
	if(cookies == null){
	response.sendRedirect("Ex19_Login.jsp"); //쿠키가 없다면 기존 로그인화면 다시 띄워주면 되고
	}else{
		for(int i = 0 ; i < cookies.length ; i++){ //쿠키가 있다면 쿠키값을 검색해서 그 값을 userid에 넣어줌.
			if(cookies[i].getName().equals("UID")){
				userid= cookies[i].getValue();
		}
	}
}

%>
<title>Insert title here</title>

<script type="text/javascript">
 /**** 주의 사항 : 문자열 처리 하기 ****/ //아래 코드는 서버쪽 코드를 스크립트로 넘겨주는 것. 미리 서버에서 만들어진 값을 제일 먼저 스크립트쪽에 전달
 var userdata = '<%=userid%>';
 let data = document.getElementById("uid");
 //data.value=userdata;
 
</script>
</head>
<body>

	<form action="Ex20_LoginOk.jsp" method="get">
		ID:<input type="text" id="uid" name="uid" value="<%=userid%>"><br> <!-- userid는 읽어온 userid 값을 아이디창에 계속 띄워놓는 용도 -->
		PWD:<input type="password" name="pwd"><br>
		<hr>
		ID값 유지하기<input type="checkbox" name="chk">
		<hr>
		<input type="submit" value="로그인">
		<input type="reset" value="취소">	
	</form>
</body>
</html>

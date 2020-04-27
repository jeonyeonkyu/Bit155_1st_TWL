<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ★★중요!!★★  -->
<%
	//요구사항 : UID 쿠키가 존재하면 input type= text name=uid
	//value값에 cookie 보여주고 싶어요
	Cookie[] cs = request.getCookies();
 	String userid= "";
	if (cs != null || cs.length > 0) {
		for (Cookie c : cs) {
			if (c.getName().equals("UID")) {
				userid = c.getValue();
			}else{
				userid = "";
			}
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
	<form action="Ex20_LoginOk.jsp" method="get">
		ID:<input type="text" id="uid" name="uid" value=""><br>
		<!--스크립트를 안쓰고 value에 <%=userid%>적어도됨  -->
		PWD:<input type="password" name="pwd"><br>
		<hr>
		ID값 유지하기<input type="checkbox" name="chk">
		<hr>
		<input type="submit" value="로그인"> <input type="reset"
			value="취소">
	</form>
</body>
<script type="text/javascript">
	/* 주의 사항 : 문자열 처리 하기 */ 	 /* 서버쪽에 있는 것을 script로 보냄, 싱글쿼터 필수!! */
	var userdata = '<%= userid %>'; 
	console.log(userdata);
	let data = document.getElementById("uid");
	data.value=userdata
</script>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

	//데이터 받기
	String uid = request.getParameter("uid");
	String pwd = request.getParameter("pwd");

	out.print(uid + " / " + pwd);

	//로직(비지니스) 업무 처리)
	//DB 연결 > select > 회원테이블 > id, pwd 존재
	//초보자는 코딩부터하지말고 흐름부터 적어놔라!!
	//지금은 id, pwd 같으면 회원인정
	boolean success = false;
	if (uid.equals(pwd)) {
		//로그인 성공
		//★★★★★★ session객체 안에 변수를 만들어서 ID 담기
		session.setAttribute("memberid", uid);
		success = true;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if (success == true) {
			out.print("<b>로그인 성공</b>");
			session.getAttribute("memberid");
			/* 세션이 가지는 타입은 Object(문자, 숫자, 해쉬맵, 리스트틍 다양한 것을 담을 수 있기 때문에..)  */
			String user = (String) session.getAttribute("memberid");
			out.print(user + "님 로그인 되었습니다. <br>");
			out.print("<a href='Ex23_Session_Member.jsp'>회원전용</a>");
		} else {
	%>
	<script type="text/javascript">
		alert("다시 로그인해 주세요.");
		//location.href="Ex23_Session_Login.jsp" 로그인 페이지(이것이 권장사항)
		window.history.go(-1); //-1은 이전, -3은 이전이전이전페이지
		//
	</script>
	<%
		}
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="member.Member" scope="page" />
<jsp:setProperty name="member" property="memID" />
<jsp:setProperty name="member" property="memPW" />
<jsp:setProperty name="member" property="memName" />
<jsp:setProperty name="member" property="memGender" />
<jsp:setProperty name="member" property="memEmail" />
<!-- memPW SHA1, MD5 로 DB저장 시켜야함. -->
<!DOCTYPE html>
<html>
<head>
<meta content="charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login Action</title>
</head>
<body>
<%
	String memID = null;
	if(session.getAttribute("memID") != null){
		//로그인이 되어있다.
		memID = (String) session.getAttribute("memID");
	}
	
	if(memID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href = '/BBS/main.jsp'");
		script.println("</script>");
	}
	
	//입력되지 않은 사항이 있는 체크
	if(member.getMemID() == null || 
	   member.getMemPW() == null ||
	   member.getMemName() == null ||
	   member.getMemGender() == null ||
	   member.getMemEmail() == null){
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력되지 않은 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		MemberDAO memberDAO = new MemberDAO();
		int result = memberDAO.join(member); //회원가입 DB메서드
		System.out.println("join : "+result);
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			session.setAttribute("memID", member.getMemID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입 성공')");
			script.println("location.href = '/BBS/main.jsp'");
			script.println("</script>");
		}
	}
%>










</body>
</html>
<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta content="charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Delete Action</title>
</head>
<body>
<%
	String memID = null;
	if(session.getAttribute("memID") != null){
		//로그인이 되어있다.
		memID = (String) session.getAttribute("memID");
	}
	
	if(memID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href = '/BBS/member/login.jsp'");
		script.println("</script>");
	}else{
		//bdID가 필요
		int bdID = 0;
		if(request.getParameter("bdID") != null){
			bdID = Integer.parseInt(request.getParameter("bdID"));
		}
		
		BoardDAO boardDAO = new BoardDAO();
		//delete함수 구현하기
		int result = boardDAO.delete(bdID);
		
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삭제 되었습니다.')");
			script.println("location.href = '/BBS/board/board.jsp'");
			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삭제에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		
	}

%>

</body>
</html>






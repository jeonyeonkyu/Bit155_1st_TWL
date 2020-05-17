<%@page import="board.Board"%>
<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="board" class="board.Board" scope="page"></jsp:useBean>
<jsp:setProperty property="bdTitle" name="board"/>
<jsp:setProperty property="bdContent" name="board"/>
<jsp:setProperty property="bdID" name="board"/>

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
		BoardDAO boardDAO = new BoardDAO();
		int result = boardDAO.update(board);
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('수정되었습니다.')");
			script.println("location.href = '/BBS/board/board.jsp'");
			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('수정에 실패하였습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	}

%>

</body>
</html>
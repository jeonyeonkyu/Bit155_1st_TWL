<%@page import="kr.or.bit.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String idx = request.getParameter("idx");
	String pwd = request.getParameter("pwd");
	
	BoardService service = BoardService.getInBoardService();
	int result =service.board_Delete(idx, pwd);
	
	String msg="";
	String url="";
	if(result > 0){
		msg="삭제 성공";
		url="board_list.jsp";
	}else{
		msg="삭제 실패";
		url="board_list.jsp";
	}
	
	request.setAttribute("board_msg",msg);
	request.setAttribute("board_url",url);
%>
<jsp:forward page="redirect.jsp"></jsp:forward>    
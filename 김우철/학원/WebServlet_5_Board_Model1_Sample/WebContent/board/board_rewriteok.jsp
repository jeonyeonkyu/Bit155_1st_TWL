<%@page import="kr.or.bit.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	
	/*  서블리에서 사용하는 정상적인 방법
	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String email = request.getParameter("email");
	String homepage = request.getParameter("homepage");
	String filename = request.getParameter("filename");
	String pwd = request.getParameter("pwd"); 
	
	Board board = new Board();
	board.setSubject(subject) ......
	
	*/
%>

<!-- 클래스명이 정확하고 그안에 setter가 구현되어있다면 자동 넣어줌 -->
<jsp:useBean id="board" class="kr.or.bit.dto.Board" scope="page">
	<jsp:setProperty property="*" name="board"></jsp:setProperty>
</jsp:useBean>


<%
	BoardService service = BoardService.getInBoardService();
	int result = service.rewriteok(board);
	
	String cpage = request.getParameter("cp"); //pagesize
	String pagesize = request.getParameter("ps"); //current page
	//코드는  필요에 따라서  url ="board_list.jsp?cp=<%=cpage..."
	//지금은 그냥 넘김
	
	//list 이동시 현재 pagesize, cpage 
	String msg = "";
	String url = "";
	if(result > 0){
		msg = "rewrite insert success";
		url = "board_list.jsp";
	}else {
		msg = "rewrite insert fail";
		url = "board_content.jsp?idx="+board.getIdx();
	}
	
	request.setAttribute("board_msg", msg);
	request.setAttribute("board_url", url);
%> 

<jsp:forward page="redirect.jsp"></jsp:forward>





<%@page import="kr.or.bit.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	
	/*
	 서블릿에서 사용하는 정상적인 방법 지금은 jsp사용하는 model1이기 때문에 아래코드로 사용	
	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String email = request.getParameter("email");
	String homepage = request.getParameter("homepage");
	String filename = request.getParameter("filename");
	String pwd = request.getParameter("pwd"); */
%>
<jsp:useBean id="board" class="kr.or.bit.dto.Board" scope="page">
	<jsp:setProperty property="*" name="board"></jsp:setProperty>
</jsp:useBean>

<%
	BoardService service = BoardService.getInBoardService();
	int result = service.rewriteok(board);
	
	//답글 달고 이동할 페이지는 list로 하자 pagesize, cpage로 경로를 받아야 함
	  	String cpage = request.getParameter("cp"); //current page
		String pagesize = request.getParameter("ps"); //pagesize
	
	//url 코드는 필요에 따라서 url ="board_list.jsp?cp=<%=cpage"; 이런식으로 해도 됨 
    String msg="";
    String url="";
    if(result > 0){
    	msg ="rewrite insert success";
    	url ="board_list.jsp";
    }else{
    	msg="rewrite insert fail";
    	url="board_content.jsp?idx=" + board.getIdx(); //실패했을 경우 내가 읽었던 글로 다시 돌아가도록 (어떤 글인지 모르므로 글번호를 준 것)
    }
    
    request.setAttribute("board_msg",msg);
    request.setAttribute("board_url", url);
	
	
%>
<jsp:forward page="redirect.jsp"></jsp:forward>





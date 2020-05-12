<%@page import="kr.or.bit.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	
	/* 
		이게 servlet 에서 사용하는 정상적인 방법 
	
	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String email = request.getParameter("email");
	String homepage = request.getParameter("homepage");
	String filename = request.getParameter("filename");
	String pwd = request.getParameter("pwd");
	
	Board board = new Board();
	board.setSubject(subject)......  이렇게 파라메터로 받은 값들을 다 넣어야한다. 왜냐면, 서비스단의 rewriteok()함수에게 보낼라구?
	*/
%>


<<jsp:useBean id="board" class="kr.or.bit.dto.Board" scope="page">
	<jsp:setProperty property="*" name="board" /><!-- 이 클래스에 세터가 있다면 여기서 만들어진 객체안에 주입된다  -->
</jsp:useBean>

<%
	BoardService service = BoardService.getInBoardService();
	int result = service.rewriteok(board);
	
	String cpage = request.getParameter("cp");//current page
	String pagesize = request.getParameter("ps"); //pagesize
	
	
	//url = "board_list.jsp"; 코드는 필요에 따라서 url = "board_list.jsp?cp=<%=cpage 이런식으로...할수있음";
	String msg = "";
	String url ="";
	if(result> 0){
		msg ="rewrite insert success";
		url = "board_list.jsp"; //성공하면 목록
	}else{
		msg ="insert fail";
		url = "board_write.jsp?idx="+board.getIdx();//실패하면 원본글에대한 글쓰기로 간다 
	}
	
	request.setAttribute("board_msg", msg);
	request.setAttribute("board_url", url);
	
	//list 이동시 현재 pagesize , cpage 
%> 

<jsp:forward page="redirect.jsp"></jsp:forward>





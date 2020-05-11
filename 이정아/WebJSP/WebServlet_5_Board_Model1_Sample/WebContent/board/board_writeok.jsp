

<%@page import="kr.or.bit.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//request.getParameter("") ....
	//Board board = new Board();
	//board.setName = 값
%>
<jsp:useBean id="board" class="kr.or.bit.dto.Board">
	<jsp:setProperty property="*" name="board" />
</jsp:useBean>
<%



	//out.print(board.getSubject() + "<br>");
	//out.print(board.getWriter() + "<br>");
	//단 jsp:userBean이 성립하려면 input 태그의 name값(name = "subject") 이 BoardDTO 객체의 memberfiedl명하고 같아야 한다.
	
	
	//DB 컬럼명 == DTO memberfield == input태그의 name속성명 이 3개가 같아야 함! 그러면 자동화가 가능해진다.
	
	//write.jsp(이것을 클라이언트가 화면으로 받으면) 처리는 writeok.jsp가 받는다. 현재는 model1방식이라 writeok가 받고,
	//모델2방식은 .do.java(서블릿)가 받을 것 
	//writeok.jsp 가 DAO 객체 생성, 처리를 하게되는데 이 방식보다는
	//write.jsp(클라이언트 화면) >> 처리(writeok.jsp) >> service만 노출시키자 (업무 분담)


    
    BoardService service = BoardService.getInBoardService();
    int result = service.writeOk(board);
    
    //write.jsp 화면  >> writeok.jsp 처리 >> service >> dao > DB 작업 > 
    //return dao > return service >  writeok.jsp 결과처리 >> 이동 (공통) >> redirect.jsp
    		
    String msg="";
    String url="";
    if(result > 0){
    	msg ="insert success";
    	url ="board_list.jsp";
    }else{
    	msg="insert fail";
    	url="board_write.jsp";
    }
    
    request.setAttribute("board_msg",msg);
    request.setAttribute("board_url", url);
%>
<jsp:forward page="redirect.jsp"></jsp:forward>



















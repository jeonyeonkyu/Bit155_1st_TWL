<%@page import="kr.or.bit.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx_fx = request.getParameter("idx"); //댓글의 원본 게시글 번호 삭제하고 다시 돌아갈 때 필요
	String no = request.getParameter("no"); //댓글의 순번(PK값)
	String pwd = request.getParameter("delPwd"); //댓글의 암호
	System.out.println(idx_fx + "/" + no + "/" + pwd+ "/");
	 
	if(idx_fx == null || no == null || pwd == null || no.trim().equals("")){
		
%>    
	<script type="text/javascript">
	history.back();
	</script>
	<%
	return; //더 이상 코드 실행하지 않음 //if를 타지않는 경우(parameter가 정상인경우, )
	}
	BoardService service = BoardService.getInBoardService();
	int result = service.replyDelete(no, pwd);
	
	   String msg="";
	    String url="";
	    if(result > 0){
	    	msg ="댓글 삭제 성공";
	    	url ="board_content.jsp?idx=" +idx_fx ;
	    }else{
	    	msg="댓글 삭제 실패";
	    	url="board_content.jsp?idx=" + idx_fx ;
	    }
	    
	    request.setAttribute("board_msg",msg);
	    request.setAttribute("board_url", url);
	%>
	<jsp:forward page="redirect.jsp"></jsp:forward>

	%>
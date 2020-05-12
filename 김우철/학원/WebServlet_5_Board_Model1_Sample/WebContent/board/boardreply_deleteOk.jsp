
<%@page import="kr.or.bit.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String idx_fk = request.getParameter("idx"); //댓글의 원본 게시글 번호, 다시 돌아갈때 쓸려고 가져온것
	String no = request.getParameter("no"); //댓글의 순번(PK)
	String pwd = request.getParameter("delPwd"); //댓글의 암호
	
	/* WEB-INF에 넣으면 이런 방어적인 코드 필요없음 */
	if(idx_fk == null || no == null || pwd == null || no.trim().equals("")){
%>

	<script type="text/javascript">
		history.back();
	</script>

<%
	return; //더이상 코드 실행X
	}
	
	//parameter가 정상인경우(if를 타지 않는 경우)
	BoardService service = BoardService.getInBoardService();
	int result = service.replyDelete(no, pwd);
	
	//list 이동시 현재 pagesize, cpage 
	String msg = "";
	String url = "";
	if(result > 0){
		msg = "댓글 삭제 성공";
		url = "board_content.jsp?idx="+idx_fk;
	}else {
		msg = "댓글 삭제 실패";
		url = "board_content.jsp?idx="+idx_fk;
	}
	
	request.setAttribute("board_msg", msg);
	request.setAttribute("board_url", url);
%> 

<jsp:forward page="redirect.jsp"></jsp:forward>



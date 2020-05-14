
<%@page import="kr.or.bit.dto.Reply"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.bit.dto.Board"%>
<%@page import="kr.or.bit.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>board_content</title>
	 <link rel="Stylesheet" href="<%=request.getContextPath()%>/style/default.css" />
</head>
<body>
	<%
		String idx = request.getParameter("idx"); //글번호 받기
		
		//글번호를 가지고 직접 주소값 외워서 접근하지 못하게 예외처리 (문서 체크리스트 시 추가)
		if(idx ==null || idx.trim().equals("")){
			response.sendRedirect("board_list.jsp");
			return; //더이상 아래 코드가 실행되지 않고 클라이언트에게 전달이 되도록 종료시키기
		}
		idx=idx.trim(); //혹시 공백이 넘어올지도 모르니 공백제거
		//board_content.jsp?idx=19&cp=1&ps=5 //글을 보고 다시 목록으로 갈 때 cp,ps를 통해 클라이언트가 접속했었던 페이지로 돌아 갈 수 있도록
		//그래서 이와같은 코드가 필요하다.
		String cpage = request.getParameter("cp"); //current page
		String pagesize = request.getParameter("ps"); //pagesize
		
		//List페이지의 처음을 호출하면 (글이 하나도 없을 때)
		if (cpage == null || cpage.trim().equals("")) {
			//default 값 설정
			cpage = "5"; //5개씩 묶음을 잡겠다
		}

		if (pagesize == null || pagesize.trim().equals("")) {
			//default 값 설정
			pagesize = "1"; //첫번째 페이지를 보겠다
		}
		 
		//상세보기 내용
		BoardService service = BoardService.getInBoardService();
		
		//아래는 옵션
		//조회수 증가
		boolean isread = service.addReadNum(idx); //true,false 리턴
		if(isread)System.out.println("조회수증가:" + isread); // 필요에따라 로직 추가(같은 세션값이면 조회수가 증가 안한다던지...)
		
		
		
		//데이터 조회 //결과값이 무조건 글번호 1건 (row)
		Board board = service.content(Integer.parseInt(idx));
	
	%>
	<%
		pageContext.include("/include/header.jsp");
	%>
	<div id="pageContainer">
		<div style="padding-top: 30px; text-align: center">
			<center>
				<b>게시판 글내용</b>
				<table width="80%" border="1">
					<tr>
						<td width="20%" align="center"><b> 글번호 </b></td>
						<td width="30%"><%=idx%></td> <!-- parameter로 받은 값 -->
						<td width="20%" align="center"><b>작성일</b></td>
						<td><%=board.getWritedate()%></td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>글쓴이</b></td>
						<td width="30%"><%=board.getWriter()%></td>
						<td width="20%" align="center"><b>조회수</b></td>
						<td><%=board.getReadnum()%></td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>홈페이지</b></td>
						<td><%=board.getHomepage()%></td>
						<td width="20%" align="center"><b>첨부파일</b></td>
						<td><%=board.getFilename()%></td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>제목</b></td>
						<td colspan="3"><%=board.getSubject()%></td>
					</tr>
					<tr height="100">
						<td width="20%" align="center"><b>글내용</b></td>
						<td colspan="3">
							<%
								String content = board.getContent();
							if(content != null){
								content = content.replace("\n", "<br>"); //브라우저가 글내용 안에 있는 엔터값을 인식하지 못하기 때문에 추가로 정의를 해준다.
							}
							out.print(content);
							%>
						
						</td>
					</tr>
					<tr>
						<td colspan="4" align="center">
							<a href="board_list.jsp?cp=<%=cpage %>&ps=<%=pagesize %>">목록가기</a> <!-- 3번페이지의 사이즈 5를 가지고 들어오면 거기로 다시 돌아간다 -->
				            |<a href="board_edit.jsp?idx=<%=idx %>&cp=<%= cpage%>&ps=<%=pagesize %>">편집</a> <!-- 글 번호와 현재 페이지. 페이지 사이즈를 유지하려면 필요  -->
				            |<a href="board_delete.jsp?idx=<%=idx %>&cp=<%= cpage %>&ps=<%=pagesize %>">삭제</a>
				            |<a href="board_rewrite.jsp?idx=<%=idx %>&cp=<%= cpage %>&ps=<%=pagesize %>&subject=<%=board.getSubject() %>">답글</a>									
						</td>
					</tr>
				</table>
			<!--  댓글 달기 테이블 -->
			<form name="reply" action="board_replyok.jsp" method="POST">
				<!-- hidden 태그  값을 숨겨서 처리  -->
				<input type="hidden" name="idx" value="<%= idx  %>">
				<input type="hidden" name="userid" value=""><!-- 유저아이디는 현재 비인증형게시판이기때문에 필요없음. 인증형게시판일경우 필요 -->
					<!-- hidden data -->
					<table width="80%" border="1">
						<tr>
							<th colspan="2">덧글 쓰기</th>
						</tr>
						<tr>
							<td align="left">
								작성자 : <input type="text" name="reply_writer"><br />
								내&nbsp;&nbsp;용 : <textarea name="reply_content" rows="2" cols="50"></textarea>
							</td>
							<td align="left">
								비밀번호:<input type="password" name="reply_pwd" size="4"> <!-- 글 수정시에 필요하기 때문 -->
								  	    <input type="button" value="등록" onclick="reply_check()">
							</td>
						</tr>
					</table>
			</form>
	<!-- 유효성 체크 -->	
	<script type="text/javascript">
		function reply_check() {
			var frm = document.reply;
			if (frm.reply_writer.value == "" || frm.reply_content.value == ""
					|| frm.reply_pwd.value == "") {
				alert("리플 내용, 작성자, 비밀번호를 모두 입력해야합니다."); //공백체크
				return false;
			}
			frm.submit(); //서버로 전송
		}
		function reply_del(frm) {
			//alert("del");
			//var frm = document.replyDel;
			//alert(frm);
			if (frm.delPwd.value == "") {
				alert("비밀번호를 입력하세요");
				frm.delPwd.focus();
				return false;
			}
			frm.submit();
		}
	</script>
	<br>
	<!--댓글 목록 테이블 -->
	<%
	  //덧글 목록 보여주기 (달린 댓글 보여주기)
	  List<Reply> replylist = service.replyList(idx); //참조하는 글 번호
	  if(replylist != null && replylist.size() > 0){ //if문이 true면 아래의 테이블 생성 코드가 실행된다.
		%>
		<table width="80%" border="1">
					<tr><th colspan="2">REPLY LIST</th></tr>
		<%	   
		for(Reply reply : replylist){
		%>
					<tr align="left">
						<td width="80%">
								[<%=reply.getWriter()%>] : 
								<%=reply.getContent() %>
							<br> 작성일:<%=reply.getWritedate().toString() %>
						</td>
						<td width="20%">
							<form action="boardreply_deleteOk.jsp" method="POST" name="replyDel"> <!-- 수정,삭제 기능 있어야죠 댓글에 대해서 -->
								<input type="hidden" name="no" value="<%= reply.getNo()%>">
								<input type="hidden" name="idx" value="<%= idx %>">
								password :<input type="password" name="delPwd" size="4">	
								<input type="button" value="삭제" onclick="reply_del(this.form)">
							</form>
						</td>
					</tr>
					<%
					}
					%>
		</table>
		<%
		}
		%>
		</center>
		</div>
	</div>
</body>
</html>
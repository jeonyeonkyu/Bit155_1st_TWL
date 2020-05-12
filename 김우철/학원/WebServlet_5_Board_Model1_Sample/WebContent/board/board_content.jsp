<%@page import="kr.or.bit.dto.Reply"%>
<%@page import="kr.or.bit.utils.ThePager"%>
<%@page import="kr.or.bit.dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.bit.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board_content</title>
<link rel="Stylesheet"
	href="<%=request.getContextPath()%>/style/default.css" />
</head>
<body>
	<%
		String idx = request.getParameter("idx").trim(); //글번호 받기, trim은 혹시몰라서 하는것

		/* 로그인하지 않고 클릭하면...(테스트 체크리스트)  */
		//글 번호를 가지고 오지 않았을 경우 예외처리
		/* WEB-INF 로뺴버리면 아예못옴(이코드 필요없음) */
		if (idx == null || idx.trim().equals("")) {
			response.sendRedirect("board_list.jsp");
			return; //더 이상 아래코드가 실행되지 않고 클라이언트에게 전달
		}

		//board_content.jsp?idx=19&cp=1&ps=5 //다시 목록으로 갔을때 가져온 ps, cp 이용..

		//why: 목록으로 이동시 현재 page를 유지하고 싶어서..
		String cpage = request.getParameter("cp"); //pagesize
		String pagesize = request.getParameter("ps"); //current page

		//LIST 어려움!!

		//LIST 페이지를 처음으로 호출하면 
		if (cpage == null || cpage.trim().equals("")) {
			//default 값 설정
			cpage = "1"; //1번째 페이지를 보겠다.
		}

		if (pagesize == null || pagesize.trim().equals("")) {
			//default 값 설정
			pagesize = "5"; //5개씩 묶음을 잡겠다
		}

		//상세보기 내용 ★★★★★(쌤 피셜 : 상세보기 페이지가 제일 쉬움)
		BoardService service = BoardService.getInBoardService();

		//옵션 
		//조회수 증가(중간프로젝트시 설계시 뺴도됨) - 어려움(왜? 예외사항이 많음)
		//하루에 한번만 클릭, 글작성자 조회수 count X, 
		//삭제가 제일 예외처리 빡셈;; -> 답글이 있으면 원본글을 삭제 못해요 등등
		//이코드에서는 아직 막아논게 없음
		//나중에 비동기로 해야될듯..
		boolean isread = service.addReadNum(idx);
		if (isread)
			System.out.println("조회수 증가");

		//데이터 조회(1건(row))
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
						<td width="30%"><%=idx%></td>
						<!-- DB에서 받은거 혹은 파라미터에서 받은거 써도되ㅓㅁ-->

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
								if (content != null) {
									content = content.replace("\n", "<br>"); /* 이것도 DB에서 해도되긴함 */
								}
								out.print(content);
							%>

						</td>
					</tr>
					<tr>
						<td colspan="4" align="center">
							<a href="board_list.jsp?cp=<%=cpage%>&ps=<%=pagesize%>">목록가기</a> 
							<a href="board_edit.jsp?idx=<%=idx%>&cp=<%=cpage%>&ps=<%=pagesize%>">편집</a>
							<!-- 중요  --> 
							<a href="board_delete.jsp?idx=<%=idx%>&cp=<%=cpage%>&ps=<%=pagesize%>">삭제</a>
							<a href="board_rewrite.jsp?idx=<%=idx%>&cp=<%=cpage%>&ps=<%=pagesize%>&subject=<%=board.getSubject()%>">답글</a>
							<!-- 원본글이 무엇인지가 제일 중요, subject는 굳이 필요없긴 함 [RE]123 -->
						</td>
					</tr>
				</table>
				<!-- 추가 코드  -->
				<!--  꼬리글 달기 테이블 -->
				<!-- 이것도 나중에 비동기로 해야됨  -->
				<form name="reply" action="board_replyok.jsp" method="POST">
					<!-- hidden 태그  값을 숨겨서 처리  -->
					<input type="hidden" name="idx" value="<%=idx%>"> 
					<input type="hidden" name="userid" value=""> <!-- 추후 필요에 따라..  -->
					<!-- hidden data -->
					<table width="80%" border="1">
						<tr>
							<th colspan="2">덧글 쓰기</th>
						</tr>
						<tr>
							<td align="left">작성자 : <input type="text"
								name="reply_writer"><br /> 내&nbsp;&nbsp;용 : <textarea
									name="reply_content" rows="2" cols="50"></textarea>
							</td>
							<td align="left">비밀번호:
							<input type="password" name="reply_pwd" size="4">
							<input type="button" value="등록" onclick="reply_check()">
							</td>
						</tr>
					</table>
				</form>
				<!-- 유효성 체크	 -->
				<script type="text/javascript">
					function reply_check() {
						var frm = document.reply;
						if (frm.reply_writer.value == ""
								|| frm.reply_content.value == ""
								|| frm.reply_pwd.value == "") {
							alert("리플 내용, 작성자, 비밀번호를 모두 입력해야합니다.");
							return false;
						}
						frm.submit();
						/* if를 타지 않으면 서버에 전송 */
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
						/* if를 타지 않으면 서버에 전송 */
					}
				</script>
				<br>
				List<Reply> replylist = request.getAttribute("키값");
				<!-- 꼬리글 목록 테이블 -->
				<%
					//덧글 목록 보여주기
					List<Reply> replylist = service.replyList(idx); //참조하는 글번호
					if(replylist != null && replylist.size() > 0) { //if문을 타면 무조건 데이터가 있음
				%>
				<table width="80%" border="1">
					<tr>
						<th colspan="2">REPLY LIST</th>
					</tr>
					<%
					for(Reply reply : replylist){
					%>
					<tr align="left">
						<td width="80%">
							[<%=reply.getWriter()%>] : <%=reply.getContent()%>
							<br> 작성일:<%=reply.getWritedate().toString()%>
						</td>
						<td width="20%">
							<form action="boardreply_deleteOk.jsp" method="POST" name="replyDel">
								<input type="hidden" name="no" value="<%=reply.getNo()%>"> 
								<input type="hidden" name="idx" value="<%=idx%>"> 
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
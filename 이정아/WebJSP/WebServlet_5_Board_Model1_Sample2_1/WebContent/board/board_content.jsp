
<%@page import="kr.or.bit.dto.Reply"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.bit.dto.Board"%>
<%@page import="kr.or.bit.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>board_content</title>
	 <link rel="Stylesheet" href="<%=request.getContextPath()%>/style/default.css" />
</head>
<body>
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
						<td width="30%">${requestScope.idx}</td> <!-- parameter로 받은 값 -->
						<td width="20%" align="center"><b>작성일</b></td>
						<td>${requestScope.board.getWritedate()}</td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>글쓴이</b></td>
						<td width="30%">${requestScope.board.getWriter()}</td>
						<td width="20%" align="center"><b>조회수</b></td>
						<td>${requestScope.board.getReadnum()}</td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>홈페이지</b></td>
						<td>${requestScope.board.getHomepage()}</td>
						<td width="20%" align="center"><b>첨부파일</b></td>
						<td>${requestScope.board.getFilename() }</td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>제목</b></td>
						<td colspan="3">${requestScope.board.getSubject()}</td>
					</tr>
					<tr height="100">
						<td width="20%" align="center"><b>글내용</b></td>
						<td colspan="3">
								String content = ${requestScope.board.getContent()};
							if(content != null){
								content = content.replace("\n", "<br>"); //브라우저가 글내용 안에 있는 엔터값을 인식하지 못하기 때문에 추가로 정의를 해준다.
							}
							out.print(content);
							%>
						
						</td>
					</tr>
					<tr>
						<td colspan="4" align="center">
							<a href="board_list.jsp?cp=${requestScope.cpage}&ps=${requestScope.pagesize}">목록가기</a> <!-- 3번페이지의 사이즈 5를 가지고 들어오면 거기로 다시 돌아간다 -->
				            <a href="board_edit.jsp?idx=${requestScope.idx}&cp=${requestScope.cpage}&ps=${requestScope.pagesize}">편집</a> <!-- 글 번호와 현재 페이지. 페이지 사이즈를 유지하려면 필요  -->
				            <a href="board_delete.jsp?idx=${requestScope.idx}&cp=${requestScope.cpage}&ps=${requestScope.pagesize}">삭제</a>
				            <a href="board_rewrite.jsp?idx=${requestScope.idx}&cp=${requestScope.cpage}&ps=${requestScope.pagesize}&subject=${board.getSubject()}">답글</a>									
						</td>
					</tr>
				</table>
			<!--  댓글 달기 테이블 -->
			<form name="reply" action="board_content.do" method="POST">
				<!-- hidden 태그  값을 숨겨서 처리  -->
				<input type="hidden" name="idx" value="${requestScope.idx}">
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
	  <c:set var="reply" value = "${requestScope.reply}"></c:set>
	  <c:if test="reply != null && reply.size() > 0">
		<table width="80%" border="1">
					<tr><th colspan="2">REPLY LIST</th></tr>
		<c:forEach var ="i" items="${reply}">
					<tr align="left">
						<td width="80%">
								[${reply.getWriter()}] : 
								${reply.getContent()}
							<br> 작성일:${reply.getWritedate().toString()}
						</td>
						<td width="20%">
							<form action="boardreply.do" method="POST" name="replyDel"> <!-- 수정,삭제 기능 있어야죠 댓글에 대해서 -->
								<input type="hidden" name="no" value="${reply.getNo()}">
								<input type="hidden" name="idx" value="${reply.idx}">
								password :<input type="password" name="delPwd" size="4">	
								<input type="button" value="삭제" onclick="reply_del(this.form)">
							</form>
						</td>
					</tr>
				
				</c:forEach>
				
		</table>

		</c:if>
	
		</center>
		</div>
	</div>
</body>
</html>
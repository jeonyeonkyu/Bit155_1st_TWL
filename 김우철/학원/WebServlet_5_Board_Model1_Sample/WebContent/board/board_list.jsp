<%@page import="kr.or.bit.utils.ThePager"%>
<%@page import="kr.or.bit.dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.bit.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="Stylesheet"
	href="<%=request.getContextPath()%>/style/default.css" />
</head>
<body>
	<c:import url="/include/header.jsp" />
	<%-- <%
		BoardService service = BoardService.getInBoardService();
		out.print("전체 게시물 건수 : " + service.totalBoardCount() + "<br>");
		//out.print("게시물 리스트 : " + service.list(1, 5));
		//서비스를 사용하면 단위별로 테스트, 업무 분담 가능
		
		List<Board> list = service.list(1, 5);
		
		for(Board board : list){
			out.print(board.getIdx() + "/" + board.getSubject() + "/" + board.getWriter() + "<br>");
		}
	%> --%>
	게시판 목록
	<br>
	<%
		BoardService service = BoardService.getInBoardService();

		//게시물 총 건수
		int totalboardcount = service.totalBoardCount();

		//상세보기 >> 다시 LIST 넘어올 때 > 현재 페이지 설정
		String ps = request.getParameter("ps"); //pagesize
		String cp = request.getParameter("cp"); //current page

		//LIST 어려움!!

		//LIST 페이지를 처음으로 호출하면 
		if (ps == null || ps.trim().equals("")) {
			//default 값 설정
			ps = "10"; //5개씩 묶음을 잡겠다
		}

		if (cp == null || cp.trim().equals("")) {
			//default 값 설정
			cp = "1"; //1번째 페이지를 보겠다.
		}

		int pagesize = Integer.parseInt(ps); //pagesize
		int cpage = Integer.parseInt(cp); //current page
		int pagecount = 0; //for문 돌면서 페이지개수만큼 뿌려주기 위한 변수

		if (totalboardcount % pagesize == 0) {
			pagecount = totalboardcount / pagesize; // 100개페이지를 10개씩 묶었으면  10개 페이지 나옴, 5개로 묶었으면 페이지는 20개로 나옴
		} else {
			pagecount = (totalboardcount / pagesize) + 1; //전체 23건, 5개씩 묵으면 else를 탐, 나머지가 0으로 떨어지지 않기 때문에... 
		}

		//102건 : pagesize=5 >> pagecount=21페이지

		//전체 목록 가져오기
		List<Board> list = service.list(cpage, pagesize); //list >> 다섯개씩 묶은 첫번쨰 페이지를 보겠다
	%>
	<!-- 사실 이것보다 짧게 쓸 수 있는ㄷ 수업용 소스임.. EL로 바로 가져갈수 있음 -->
	<c:set var="pagesize" value="<%=pagesize%>" />
	<c:set var="cpage" value="<%=cpage%>" />
	<c:set var="pagecount" value="<%=pagecount%>" />

	<div id="pagecontainer">
		<div style="padding-top: 30px; text-align: cetner">
			<table width="80%" border="1" cellspacing="0" align="center">
				<tr>
					<td colspan="5">
					<!-- form태그에 주소가 없음..
						 form 태그 action 전송 주소(목적지) >> submit()
						 <form name="list"> .... action 없다면
						 >>현재 URL 창에 있는 주소로 날라감
						 >>board_list.jsp?ps=(select 태그 값으로...)를 다시 호출
						 파라미터는 자기껏을 넘김( select name="ps")
						
					  -->
						<form name="list">
							PageSize설정: 
							<!-- 사실 비동기로 하는게 좋음  -->
							<select name="ps" onchange="submit()"> 
								<c:forEach var="i" begin="5" end="20" step="5">
									<c:choose>
										<c:when test="${pagesize == i}">
											<option value="${i}" selected>${i}건<option>
										</c:when>
										<c:otherwise>
											<option value="${i}">${i}건<option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</form>
					</td>
				</tr>
				<tr>
					<th width="10%">순번</th>
					<th width="40%">제목</th>
					<th width="20%">글쓴이</th>
					<th width="20%">날짜</th>
					<th width="10%">조회수</th>
				</tr>
				<!-- 데이터가 한건도 없는 경우  -->
				<%
					if (list == null || list.size() == 0) {
						out.print("<tr><td colspan='5'></td></tr>");
					}
				%>
				<!-- forEach()  목록 출력하기 ★★★★★ -->
				<c:forEach var="board" items="<%=list%>">
					<tr onmouseover="this.style.backgroundColor='gray'" onmouseout="this.style.backgroundColor='white'">
						<td align="center">${board.idx}</td> 	<!-- idx에 getter함수가 구현되어있다면 .으로 출력가능 -->
						<td align="left">
							<c:forEach var="i" begin="1" end="${board.depth}" step="1">
								&nbsp;&nbsp;&nbsp;
							</c:forEach>
							<c:if test="${board.depth > 0}"> <!-- depth가 0보다 크다는것은 원본글이 아니다 -->	
								<img src="../images/re.gif">
							</c:if>
							<a href="board_content.jsp?idx=${board.idx}&cp=${cpage}&ps=${pagesize}">
								<c:choose>
									<c:when test="${board.subject != null && fn:length(board.subject) > 10}">
										${fn:substring(board.subject, 0,10)}... <!-- 사실 DB에서 해도됨 -->
										<!-- DB를 잘하는 사람은 DB에서 다 처리하고 넘기고, 어플리케이션부분을 잘하는 사람은 웹단에서 함  -->
										<!-- 어떤것도 답이아님, 어떤것을 하기에는 팀장 마음..(팀장이 강한쪽으로 함), 쌤은 DB개발을 많이해서 DB가 편함 -->
									</c:when>
									<c:otherwise>
										${board.subject}
									</c:otherwise>
								</c:choose>
							</a>
						</td>
						<td align="center">${board.writer}</td>
						<td align="center">${board.writedate}</td>
						<td align="center">${board.readnum}</td>
					</tr>
				</c:forEach>
				<!-- forEach()  -->
				<tr>
					<td colspan="5" align="center">
						<hr width="100%" color="red">
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<!--  
					원칙적인 방법 아래 처럼 구현
					[1][2][3][다음]
					[이전][4][5][6][다음]
					[이전][7][8][9][다음]
					[이전][10][11]
					
					현재 아래 코드 [][][][][][][]...
					--> 
					
					<!-- 리스트 만드는 제일 간단한 로직, 실제 프로젝트에서는 더 복잡하게 해라!!! 클래스로 빼라!! (ThePager 공부해라) -->
					
					<!--이전 링크 -->
						<c:if test="${cpage > 1}">
							<a href="board_list.jsp?cp=${cpage-1}&ps=${pagesize}">이전</a>
						</c:if>
					
					<!-- 페이지 목록 나열하기  -->	
					<c:forEach var="i" begin="1" end="${pagecount}" step="1">
					<c:choose>
						<c:when test="${cpage==i}">
							<font color="red">[${i}]</font>
						</c:when>
						<c:otherwise>
							<a href="board_list.jsp?cp=${i}&ps=${pagesize}">[${i}]</a>
						</c:otherwise>
					</c:choose>
						
					</c:forEach>
					
					<!--다음 링크 -->
						<c:if test="${cpage < pagecount}">
							<a href="board_list.jsp?cp=${cpage+1}&ps=${pagesize}">다음</a>
						</c:if>

					</td>
					<td colspan="2" align="center">총 게시물 수 :</td> <%=totalboardcount %>
				</tr> 
				<tr>
					<td colspan="5" align="center">
					<%
					/*  개발자들이 만들어놓은거 많으니 찾아서 써라 (위의 생코딩 안쓰고 이것만 하면 됨 )*/
						int pagersize=3; //[1][2][3]
						ThePager pager = new ThePager(totalboardcount,cpage,pagesize,pagersize,"board_list.jsp");
						/* 생코딘보단 알고리즘&모듈화 하는걸 실무에서는 좋아함  */
						/*  화면에 뿌려지는것만 일단봐라, 파라미터는 아직 넣어주지않아서 기능은 X */
						/*  들어가는 파라미터이름만 맞춰주면 기능 다됨 */
					%>
					<%= pager.toString() %>
					</td>
			</table>
		</div>
	</div>


</body>
</html>
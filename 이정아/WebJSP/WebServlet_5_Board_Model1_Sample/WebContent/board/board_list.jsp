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
	<!-- 리스트->서비스(토탈카운트)->보드->보드토탈카운트->서비스->리스트->출력 -->
	<c:import url="/include/header.jsp" />
	<%
	
	BoardService service = BoardService.getInBoardService();

	int totalboardcount = service.totalBoardCount();

	//상세보기 >> 다시 LIST페이지로 넘어올 때 >> 현재 페이지로 다시 돌아오게 설정

	String ps = request.getParameter("ps"); //pagesize
	String cp = request.getParameter("cp"); //currentpage 글을 보러 들어갔다와도 그 정보를 다시 받아 볼 수 있게(현재페이지의)

	//List페이지의 처음을 호출하면 (글이 하나도 없을 때)
	if (ps == null || ps.trim().equals("")) {
		//default 값 설정
		ps = "5"; //5개씩 묶음을 잡겠다
	}

	if (cp == null || cp.trim().equals("")) {
		//default 값 설정
		cp = "1"; //첫번째 페이지를 보겠다
	}

	int pagesize = Integer.parseInt(ps);
	int cpage = Integer.parseInt(cp);
	int pagecount = 0; //아래에 페이지 번호 뿌리기용 ( for문 돌면서 뿌리기 )
	//ex 전체 글이 23건일 경우 else구문을 탄다. 
	if (totalboardcount % pagesize == 0) { //글의 개수와 페이지 개수가 딱 떨어지는 것
		pagecount = totalboardcount / pagesize; //100개의 글을 10개씩 묶으면 10페이지
	} else {
		pagecount = (totalboardcount / pagesize) + 1;
	}

	//102건 : pagesize = 5일경우 ==> pagecount = 21개의 페이지가 생긴다.
	//아래의 함수가 목록을 가져오는 함수
	List<Board> list = service.list(cpage, pagesize); //List를 바로 요청하면 5개씩 묶은 1번째 페이지가 보여짐
	%>
	
	<c:set var="pagesize" value="<%=pagesize%>"/>
	<c:set var="cpage" value="<%=cpage%>"/>
	<c:set var="pagecount" value="<%=pagecount%>" />

	<div id="pagecontainer">
		<div style="padding-top: 30px; text-align: cetner">
			<table width="80%" border="1" cellspacing="0" align="center">
				<tr>
					<td colspan="5">
					<!-- form태그  action 전송 주소(목적지) >> submit()
						>>forme name = "list" ... 
						"action이 없다면
						현재 URL창에 있는 주소로 간다."
						5개씩 볼지,, 10개씩 볼지 클릭 후 board_list.jsp?ps=select태그의 값으로 다시 호출하는 것. 
						내가 보던 페이지에 그대로 있어야하므로!
						onchange할 때 아래의 name=ps의 값으로
					 -->
						<form name="list">
						
							PageSize설정: <select name="ps" onchange="submit()">
								<c:forEach var="i" begin="5" end="20" step="5">
									<!-- 5.10.15 이런식으로 묶임 -->
									<c:choose>
										<c:when test="${pagesize == i }">
											<option value="${i}" selected>${i}건</option>
										</c:when>
										<c:otherwise>
											<option value= "${i}">${i}건</option>
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
					out.print("<tr><td colspan = '5'>데이터가 없습니다.</td></tr>");
				}
				%>
				<!-- forEach()  목록 출력하기 핵심코드  -->
				<c:forEach var="board" items="<%=list%>">
					<tr onmouseover="this.style.backgroundColor='gray'"
						onmouseout="this.style.backgroundColor='white'">
						<td align="center">${board.idx }</td>
						<td align="left"><c:forEach var="i" begin="1"
								end="${board.depth }" step="1">
							&nbsp;&nbsp;&nbsp; <!-- 공백값 주기 -->
							</c:forEach> <c:if test="${board.depth > 0}">
								<!-- depth가 0보다 큰 경우는 원본글이 아님 즉 답글 -->
								<img src="../images/re.gif">
							</c:if> <a
							href="board_content.jsp?idx=${board.idx}&cp=${cpage}&ps=${pagesize}">
								<!-- 글번호, 현재페이지, 몇개로 자를건지에 대한 정보를 가져가서 글을 보고 나가도 그 글이 있던 페이지로
							돌아갈 수 있도록 --> <c:choose>
									<c:when
										test="${board.subject != null &&  fn:length(board.subject) > 10 }">
								${fn:substring(board.subject,0,10)}
								</c:when>
									<c:otherwise>
								${board.subject}
								</c:otherwise>
								</c:choose>
						</a></td>
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
						--> <!--이전 링크 --> <c:if test="${cpage>1 }">
							<!-- 페이지 수가 1개 이상이라면, 이전으로 갈 페이지가 있다는 뜻이므로 -->
							<a href="board_list.jsp?cp=${cpage-1}&ps=${pagesize}">이전</a>
							<!-- 현재 페이지의 -1을 해서 가겠다 -->
						</c:if> 
						<!-- 페이지 목록 나열하기 --> <c:forEach var="i" begin="1"
							end="${pagecount}" step="1">
							<!-- 페이지의 개수만큼 돈다 -->
							<c:choose>
								<c:when test="${cpage == i }">
									<font color="red">[${i}]</font>
								</c:when>
								<c:otherwise>
									<a href="board_list.jsp?cp=${i}&ps=${pagesize}">[${i}]</a>
								</c:otherwise>
							</c:choose>
						</c:forEach> <!--다음 링크 --> <c:if test="${cpage < pagecount}">
							<!-- 현재 당신이 보고있는 페이지가 1번이고, 페이지 카운트 개수가 그것보다 더 크다면 다음으로 갈 수 있다는 뜻이므로 -->
							<a href="board_list.jsp?cp=${cpage+1}&ps=${pagesize}">다음</a>
						</c:if>
					</td>
					<td colspan="2" align="center">총 게시물 수 : <%=totalboardcount%>
					</td>
				</tr>
				<tr>
					<td colspan="5" align="center"></td>
					<%
						int pagersize = 3;//[1][2][3] 페이저사이즈라는 클래스로 미리 로직을 다 정의해놓고 불러와서 파라미터값만 넘겨주기
						ThePager pager = new ThePager(totalboardcount, cpage, pagesize, pagersize, "board_list.jsp");
					%>
					<%=pager.toString()%>
					<!-- 뿌려주기 -->
			</table>
		</div>
	</div>

</body>
</html>


















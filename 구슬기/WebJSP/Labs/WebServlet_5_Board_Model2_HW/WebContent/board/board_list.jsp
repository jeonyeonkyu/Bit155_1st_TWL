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
<link rel="Stylesheet" href="<%=request.getContextPath()%>/style/default.css" />
</head>
<body>
<!-- 리스트->서비스(토탈카운트)->보드->보드토탈카운트->서비스->리스트->출력 -->
	<c:import url="/include/header.jsp" />
	<%
		BoardService service = BoardService.getInBoardService();
	
	int totalboardcount = service.totalBoardCount();
	
	//상세보기 >> 다시 LIST페이지로 넘어올 때 >> 현재 페이지로 다시 돌아오게 설정
		
		String ps = request.getParameter("ps"); //pagesize
		String cp = request.getParameter("cp"); //current page
		
		//List 페이지 처음 호출...
		if(ps == null|| ps.trim().equals("")){
			//default 값 설정
			ps = "5"; //개씩 
			
		}
		if(cp == null|| cp.trim().equals("")){
			//default 값 설정
			cp = "1"; //1번째 페이지 보겠다 
			
		}
		
		int pagesize = Integer.parseInt(ps);  //5개씩 묶을거야
		int cpage = Integer.parseInt(cp); //그중에 첫번째 페이지를 볼거야
		int pagecount = 0;
		
		//23건 있을때 5건씩 묶으면 else 를 탄다  4로 나누면 3이남고 그걸위한 페이지 한개를 만듦 
		if(totalboardcount % pagesize ==0){ //전체 건수와 페이지개수를 알고있으면 ..
			pagecount = totalboardcount / pagesize; // 100/10          페이지개수는 10개 
			
		}else{
			pagecount = (totalboardcount /pagesize)+1; //딱떨어지지 않는경우에는 +1해줌다
		}
		
		//102건 : pagesize =5 >> pagecount=20개 +1 개  해서 21개페이지가 만들어진다 
				
		//전체목록 가져오기 요거 중요 
		List<Board> list = service.list(cpage,pagesize); //list >> 5개씩 묶은 첫번째 페이지 보겠다 

	    %>
	    
		<c:set var="pagesize" value="<%=pagesize%>" />
		<c:set var="cpage" value="<%=cpage%>" />
		<c:set var="pagecount" value="<%=pagecount%>" />
		
		<div id="pagecontainer">
		<div style="padding-top: 30px; text-align: cetner">
			<table width="80%" border="1" cellspacing="0" align="center">
				<tr>
					<td colspan="5">
					<!-- 
						form 태그 action 전송주소 (목적지주소)가 있어야 submit() 함수를 호출하면 목적지로 가는건데!
						문제는 여기에 주소가 없당..<form name="list" >    action이 없어...
						>>[현재 URL 창에 있는 주소]로 날아간다    
						>>board_list.jsp 이게 현재URL 창의 주소 
						>>board_list.jsp?ps=select 태그 값으로 다시호출..
						>>http://localhost:8090/WebServlet_5_Board_Model1_Sample/board/board_list.jsp?ps=15   요렇게 넘어간다 
						
						
					 -->
						<form name="list" >
						PageSize설정: 
							<select name="ps" onchange="submit()">
								<c:forEach var="i" begin="5" end="20" step="5">
									<c:choose>
										<c:when test="${pagesize ==i}">
										<option value="${i}" selected>${i}건</option>
										</c:when>
										<c:otherwise>
											<option value="${i}">${i}건</option>
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
			     		if(list == null || list.size() == 0){
			     			out.print("<tr><td colspan = '5'>데이터가 없습니다.</td></tr>");
			     		}
			        %>
					<!-- forEach()  목록 출력하기  -->
					<c:forEach var="board" items="<%=list%>">
					<tr onmouseover="this.style.backgroundColor='lightgray'" onmouseout="this.style.backgroundColor='white'">
						<td align="center">${board.idx}</td><!-- getter함수 구현되어있으면 가져올수있다  -->
						<td align="left">
							<c:forEach var="i" begin="1" end="${board.depth}" step="1">
								&nbsp;&nbsp;&nbsp;
							</c:forEach>
							<c:if test="${board.depth > 0}">
								<img src="../images/re.gif">
							</c:if>
							<a href="board_content.jsp?idx=${board.idx}&cp=${cpage}&ps=${pagesize}">
								<c:choose>
									<c:when test="${board.subject != null && fn:length(board.subject) > 10}"><!-- DB 에서 다듬냐 여기서 다듬냐의 문제  -->
										${fn:substring(board.subject,0,10)}...<!-- ... 은 뒤에 더있다..머 그런거  -->
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
						
							<!--이전 링크 (4번 페이지일때 이전버튼 누르먄 3번페이지 보여주기 )--> 
							
						<c:if test="${cpage > 1}">
							<a href="board_list.jsp?cp=${cpage-1}&ps=${pagesize}">이전</a>
						</c:if>
						
							<!-- page 목록 나열하기 -->
							
							<c:forEach var="i" begin="1" end="${pagecount}" step="1">
								<c:choose>
									<c:when test="${cpage==i}">
									<font color ="red">[${i}]</font><!-- 페이지 갯수만큼돌면서 보여줌 -->
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
						<td colspan="2" align="center">총 게시물 수 : <%=totalboardcount %>
						</td>
					</tr>
					<tr>
						<td colspan="5" align="center">
						<% // /kr.or.bit.utils/ThePager.java  사용한거
							int pagersize=3; //[1][2][3]
							ThePager pager =new  ThePager(totalboardcount,cpage,pagesize,pagersize,"board_list.jsp"); //이렇게 하는게 좋은거다 
						%>
						<%= pager.toString() %><!-- 이게 화면에 뿌리는 거  아직 파라메터 설정안해서 클릭은안됨 
						구슬기 안뇽~~~~ 열심히해라~~~~~ 케케케케ㅔㅔ -->
				
						</td>
				</table>
			</div>
		</div>
</body>
</html>
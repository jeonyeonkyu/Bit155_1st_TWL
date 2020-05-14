<%@page import="kr.or.bit.dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.bit.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./board.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
	integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ=="
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<title></title>
<style>
tr>th {
	text-align: center;
}
</style>
</head>
<body>
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


	<c:set var="pagesize" value="<%=pagesize%>" />
	<c:set var="cpage" value="<%=cpage%>" />
	<c:set var="pagecount" value="<%=pagecount%>" />

	<div class="container">
		<div style="margin-bottom: 50px;">
			<h3>게시판</h3>
		</div>
			<form name="list">
		<div class="form-group">
			<div class="row ">
				<div class="col-sm-12 col-md-6 ">
					<div class="form-group d-flex align-items-center">
						<div class="col-sm-2" style="padding-left: 0">
							<select name="ps" class="form-control" onchange="submit()">
								<c:forEach var="i" begin="5" end="20" step="5">
									<c:choose>
										<c:when test="${pagesize == i }">
											<option value="${i}" selected>${i}</option>
										</c:when>
										<c:otherwise>
											<option value="${i}">${i}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
						<label for="" style="margin-bottom: 0">개씩 보기</label>
					</div>
				</form>
				</div>
				<div class="col-sm-12 col-md-6">
					<div class="d-flex justify-content-end">
						<div class="col-sm-3" style="padding-left: 25px;">
							<select class="form-control">
								<option value="제목">제목</option>
								<option value="작성자">작성자</option>
							</select>
						</div>
						<label for=""> <input type="search" class="form-control"
							placeholder="Search">
						</label>
					</div>
				</div>

			</div>

			<%
				if (list == null || list.size() == 0) {
				out.print("<tr><td colspan = '5'>데이터가 없습니다.</td></tr>");
			}
			%>

			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row ">
						<div class="col-12">
							<table id="order-listing" class="table text-center">
								<tr class="text-center">
									<th class="text-center" style="width: 50px;">사원번호</th>
									<th style="width: 30px;">이름</th>
									<th style="width: 30px;">직급</th>
									<th style="width: 30px;">부서번호</th>
									<th style="width: 50px;">근무지</th>
								</tr>

								<tbody>
									<c:forEach var="board" items="<%=list%>">
										<tr onmouseover="this.style.backgroundColor='gray'"
											onmouseout="this.style.backgroundColor='white'">
											<td align="center">${board.idx }</td>
											<td align="center"><c:forEach var="i" begin="1"
													end="${board.depth }" step="1">
												</c:forEach> <c:if test="${board.depth > 0}">
													<!-- depth가 0보다 큰 경우는 원본글이 아님 즉 답글 -->
													
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
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div class="d-flex justify-content-between">
				<div class="" style="visibility: hidden;">
					<button type="button" class="btn btn-primary">
						<i class="fas fa-pencil-alt pr-1"></i>글쓰기
					</button>
				</div>
				<!-- 공간차지용 -->
				<ul class="pagination" style="margin: 0 auto">
					<!-- justify-content-end -->
					<c:if test="${cpage>1 }">
						<li class="page-item"><a
							href="boardlist.jsp_2?cp=${cpage-1}&ps=${pagesize}"
							class="page-link"> <i class="fas fa-arrow-left"></i>
						</a></li>
					</c:if>
					<c:forEach var="i" begin="1" end="${pagecount}" step="1">
						<c:choose>
							<c:when test="${cpage == i }">
								<li class="page-item"><a href="" class="page-link">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a
									href="boardlist_2.jsp?cp=${i}&ps=${pagesize}" class="page-link">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${cpage < pagecount}">
						<li class="page-item"><a
							href="boardlist_2.jsp?cp=${cpage+1}&ps=${pagesize}"
							class="page-link"> <i class="fas fa-arrow-right"></i>
						</a></li>
					</c:if>
				</ul>
				<div class="">
					<button type="button" class="btn btn-primary">
						<i class="fas fa-pencil-alt pr-1"></i>글쓰기
					</button>
				</div>
			</div>
		</div>
		</div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

</html>
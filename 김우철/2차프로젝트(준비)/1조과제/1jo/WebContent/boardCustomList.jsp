<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>게시판 UI</title>
<style>
tr>th {
	text-align: center;
}
</style>

<script>
	console.log($("#kwc option:checked").text());

</script>
</head>

<body>
	<div class="container">
		<div style="margin-bottom: 50px;">
			<h3>게시판</h3>
		</div>
		<div class="form-group">
			<div class="row ">
				<div class="col-sm-12 col-md-6 ">
					<div class="form-group d-flex align-items-center">
						<div class="col-sm-2" style="padding-left: 0">
							<form name="list">
								<select name="ps" class="form-control" onchange="submit()">
									<c:set var="pagesize" value="${requestScope.pagesize}" />
									<c:forEach var="i" begin="5" end="20" step="5">
										<c:choose>
											<c:when test="${pagesize == i}">
												<option value="${i}" selected>${i}</option>
											</c:when>
											<c:otherwise>
												<option value="${i}">${i}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</form>
						</div>
						<label for="" style="margin-bottom: 0">개씩 보기</label>
					</div>

				</div>
				<div class="col-sm-12 col-md-6">
					<div class="d-flex justify-content-end">
						<div class="col-sm-3" style="padding-left: 25px;">
							<select id="kwc" class="form-control">
								<option value="제목">제목</option>
								<option value="작성자" selected>작성자</option>
							</select>
						</div>


						<label for=""> <input type="search" class="form-control"
							placeholder="Search">
						</label>
					</div>
				</div>

			</div>

			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row ">
						<div class="col-12">
							<table id="order-listing" class="table text-center">
								<thead>
									<tr class="text-center">
										<th class="text-center" style="width: 25px;">번호</th>
										<th style="width: 250px;">제목</th>
										<th style="width: 25px;">글쓴이</th>
										<th style="width: 30px;">날짜</th>
										<th style="width: 25px;">조회수</th>
									</tr>
								</thead>
								<tbody>

									<c:set var="list" value="${requestScope.list}"></c:set>
									<c:forEach var="board" items="${list}">
										<tr >
											<td>${board.idx}</td>


											<td align="left"><c:forEach var="i" begin="1" end="${board.depth}"
													step="1">
								&nbsp;&nbsp;&nbsp;
							</c:forEach> <c:if test="${board.depth > 0}">
													<!-- depth가 0보다 크다는것은 원본글이 아니다 -->
													<img src="./images/re.gif">
												</c:if> <a
												href="board_content.jsp?idx=${board.idx}&cp=${cpage}&ps=${pagesize}">
													<c:choose>
														<c:when
															test="${board.subject != null && fn:length(board.subject) > 10}">
										${fn:substring(board.subject, 0,10)}... 
														</c:when>
														<c:otherwise>
										${board.subject}
									</c:otherwise>
													</c:choose>
											</a></td>




											<td>${board.writer}</td>
											<td>${board.writedate}</td>
											<td>${board.readnum}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<c:set var="cpage" value="${requestScope.cpage}" />
			<c:set var="pagecount" value="${requestScope.pagecount}" />
			<div class="d-flex justify-content-between">
				<div class="" style="visibility: hidden;">
					<button type="button" class="btn btn-primary">
					<a href="./boardCustomWrite.jsp">
						<i class="fas fa-pencil-alt pr-1"></i>글쓰기
						</a>
					</button>
				</div>
				<!-- 공간차지용 -->

				<ul class="pagination" style="margin: 0 auto">
					<!-- justify-content-end -->
					<c:if test="${cpage > 1}">
						<li class="page-item"><a
							href="boardCustom.do?cp=${cpage-1}&ps=${pagesize}"
							class="page-link"> <i class="fas fa-arrow-left"></i>
						</a></li>
					</c:if>

					<c:forEach var="i" begin="1" end="${pagecount}" step="1">
						<c:choose>
							<c:when test="${cpage==i}">
								<li class="page-item"><a style="color: red;" href=""
									class="page-link">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a
									href="boardCustom.do?cp=${i}&ps=${pagesize}" class="page-link">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${cpage < pagecount}">
						<li class="page-item"><a
							href="boardCustom.do?cp=${cpage+1}&ps=${pagesize}"
							class="page-link"> <i class="fas fa-arrow-right"></i>
						</a></li>
					</c:if>
				</ul>


				<div class="">
				<a href="./boardCustomWrite.jsp">
					<button type="button" class="btn btn-primary">
						<i class="fas fa-pencil-alt pr-1"></i>글쓰기
					</button>
					</a>
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
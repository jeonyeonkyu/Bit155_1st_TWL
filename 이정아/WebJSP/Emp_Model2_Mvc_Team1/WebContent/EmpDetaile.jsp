<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="pageContainer">
		<div style="padding-top: 30px; text-align: center">

			<b>게시판 글내용</b>
			<table width="80%" border="1">
				<c:set var="list" value="${requestScope.detail}" />
				<c:forEach var="list2" items="${detail}">
					<tr>
						<td width="20%" align="center"><b> 사원번호 </b></td>
						<td width="30%">${list2.empno}</td>
						<!-- parameter로 받은 값 -->
					</tr>
							<td width="20%" align="center"><b> 이름 </b></td>
					<td width="30%">${list2.empno}</td>
					<!-- parameter로 받은 값 -->
					</tr>
					<tr>
						<td width="20%" align="center"><b>연봉</b></td>
						<td width="30%">${list2.sal}</td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>직급</b></td>
						<td>${list2.job}</td>
						<td width="20%" align="center"><b>사원번호</b></td>
						<td>${list2.empno}</td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>입사일</b></td>
						<td>${list2.hiredate}</td>
					</tr>
					<tr height="100">
						<td width="20%" align="center"><b>COMM</b></td>
						<td>${list2.comm}</td>
					</tr>
						<tr height="100">
						<td width="20%" align="center"><b>MGR</b></td>
						<td>${list2.mgr}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4" align="center"><a
						href="board_list.jsp?cp=${cpage}&ps=${pagesize}">목록가기</a> <!-- 3번페이지의 사이즈 5를 가지고 들어오면 거기로 다시 돌아간다 -->
						|<a
						href="board_edit.jsp?idx=${empno}&cp=${cpage}&ps=${pagesize}">편집</a>
						<!-- 글 번호와 현재 페이지. 페이지 사이즈를 유지하려면 필요  --> |<a
						href="board_delete.jsp?idx=${empno}&cp=${cpage}&ps=${pagesize}">삭제</a>
					</td>
				</tr>
			</table>

		</div>
	</div>
</body>
</html>
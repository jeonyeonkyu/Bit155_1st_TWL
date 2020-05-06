<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix = fmt uri ="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		table {
	
		    font-family: arial, sans-serif;
		    border-collapse: collapse; /* 붕괴하다 , 무너지다 */
		    width: 100%;
		}
		
		th {
		    border: 1px solid #dddddd;
		    text-align: center;
		    padding: 8px;
		}
		td{
		    border: 1px solid #dddddd;
			text-align: left;
			padding: 8px;
		}
		tr:nth-child(even) {  /* even 짝수     odd 홀수 */
		    background-color: #dddddd;
		}
	</style>
	
</head>
<body>
<%= request.getAttribute("memolist") %>
<div align=center>
<hr color=green width=400>
<h2> Line Memo List </h2>
<hr color=green width=400>
	
	<table border="1">
		<tr>
			<th>Writer</th>
			<th>MemoContent</th>
			<th>Email</th>
		</tr>
		<c:set var = "memolist" value = "${requestScope.memolist}"/>
		<c:forEach var="memo" items="${ m }">
		
		<tr>
					<td>${memolist}</td>		
					<td>${memo.id}</td>
					<td>${memo.email}</td>
					<td>${memo.content}</td>
		</tr>
		<c:set var= "number" value = "${number-1}"/>
		</c:forEach>
	</table>
</div>
<a href='memo.html'>글쓰기</a>
<!-- 페이지 카운터링 소스를 작성 -->

<c:if test="$(count >0)}">
<c:set var = "pageCount" value = "${count/ pageSize + (count%pageSize == 0 ? 0 : 1 ) }"/>
<c:set var = "startPage" value = "${1 }"/>

<c:if test = "${currentPage % 10 != 0 }"> 
<!-- 결과를 정수형으로 리턴 받아야 한다 -->'
<c:set var = "startPage" value ="${(result-1) * 10+1}"/>
</c:if>

<!-- 화면에 보여질 페이지 처리 숫자를 표현 -->
<c:set var = "pageBlock" value = "${10 }"/>
<c:set var = "endPage" value = "${startPage + pageBlock - 1 }"/>
<c:if test="${endPage > pageCount }">
<c:set var = "endPage" value = "${ pageCount }"/>
</c:if>

<!-- 이전 링크를 걸지 파악 -->
<c:if test= "${startPage > 10" }>
<a href = 'BoardListCon.do?pageNum=${startPage -10 }'> [이전]</a>
</c:if>

<!-- 실질적인 페이징 처리 -->
<c:forEach var ="i" begin = "${startPage }" end="${endPage }">
<a href = 'BoardListCon.do?pageNum = ${i }' > [${i}]</a>
</c:forEach>

<!-- 다음 -->
<c:if test="${endPage < pageCount }">
<a href='BoardListCon.do?pageNum=${startPage+10 }'>다음</a>
</c:if>
</c:if>
</body>
</html>
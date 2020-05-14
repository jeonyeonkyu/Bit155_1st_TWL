<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

			<c:set var = "name" value = "${requestScope.name}"></c:set>
		   <form action="Ex03_upload_detail.jsp" method="get" name="filelist">
		   	<input type="hidden" name="name" value="${name }">
		   	<input type="hidden" name="title" value="<%=title %>">
		   	<input type="hidden" name="filename2" value="<%=filename2 %>">
		   	<input type="hidden" name="orifilename2" value="<%=orifilename2 %>">
		   	<input type="hidden" name="filename1" value="<%=filename1 %>">
		   	<input type="hidden" name="orifilename1" value="<%=orifilename1%>">
		   	<a href="#" onclick="javascript:filelist.submit()">상세보기</a>
		   	</form>



</body>
</html>
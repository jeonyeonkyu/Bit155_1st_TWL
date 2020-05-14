<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="description" content="Sufee Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="apple-icon.png">
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet"
	href="vendors/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="vendors/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="vendors/themify-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet" href="vendors/selectFX/css/cs-skin-elastic.css">
<link rel="stylesheet" href="vendors/jqvmap/dist/jqvmap.min.css">


<link rel="stylesheet" href="assets/css/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- 게시판 디자인 -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">



</head>
<body>
	<jsp:include page="/WEB-INF/common/LeftMenu.jsp"></jsp:include>
	<div id="right-panel" class="right-panel">
	
		<!-- Header-->
		<jsp:include page="/WEB-INF/common/TopMenu.jsp"></jsp:include>
		<!-- /Header -->
	<c:set var="list" value="${requestScope.list}" />
	

	<h1>chartView.jsp</h1>
	<jsp:include page="/kchart.html" ></jsp:include>
	<table border="1">
				<tr>
					<td>직업</td>
					<td>급여</td>
				</tr>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.job}</td>
						<td>${list.sal}</td>
					</tr>
				</c:forEach>

	${jsonArr}<c:set var="jsonArr" value="${jsonArr}" />
	
			</table>
	</div>
	

</body>
</html>
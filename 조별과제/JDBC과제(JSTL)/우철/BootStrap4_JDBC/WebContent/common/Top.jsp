
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ======= Header ======= -->
<header id="header">
	<div class="container">

		<div id="logo" class="pull-left d-flex">
			<a  class="mr-3" href="index.jsp"><img src="./assets/img/thumbs.svg" alt=""></a>
			<h1>
				<a href="index.jsp" class="scrollto">26.8<span>조</span></a>
			</h1>
		</div>
	
		<nav id="nav-menu-container">
			<ul class="nav-menu">
				<li class="menu-active"><a href="#topbar">Home</a></li>
				<li class="menu-has-children"><a href="">Member</a>
					<ul>
					<c:set var="userid" value="${sessionScope.userid}" />
					<c:choose>
						<c:when test="${userid == null}">
							<li><a href="register.jsp">회원가입</a></li>
							<li><a href="login.jsp">로그인</a></li>
						</c:when>
						<c:when test="${userid.equals('admin')}">
							<li><a href="logout.jsp">로그아웃</a></li>
							<li><a href="Memberlist.jsp">회원관리</a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="MemberDetail.jsp?id=<%=session.getAttribute("userid")%>">내정보
									보기</a></li>
							<li><a href="logout.jsp">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
					</ul></li>
				<li class="menu-has-children d-flex">
				
					<c:if test="${userid != null}">
					<img src="./assets/img/user.svg" width="30px" height="30px"
					style="margin-top: 5px;"> 
					<div class="ml-2 mt-2">
						<b>${userid}&nbsp님</b>
					</div>
 					</c:if>
				  
				</li>
			</ul>
		</nav>
		<!-- #nav-menu-container -->
	</div>
</header>
<!-- End Header -->
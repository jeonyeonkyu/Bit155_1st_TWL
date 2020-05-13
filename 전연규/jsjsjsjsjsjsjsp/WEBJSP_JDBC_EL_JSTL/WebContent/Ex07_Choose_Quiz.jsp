<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>                
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>EL & JSTL 사용 (choose 구문 : Java 코드 if(){} else if(){} ,,, 처리)
 Java 코드 :switch~case</h3>

<hr />
	
		
			<c:set var ="username" value="${param.name}"/>
				<c:choose>
					<c:when test="${userid.equals('kglim')}">
							<b>	${username} </b>
					</c:when>
					<c:when test="${userid.equals('hong')}">
							<i>	${username} </i>
					</c:when>
					<c:otherwise>
							<h1>${username} </h1>
					</c:otherwise>
				</c:choose>
			
	

</body>
</html>
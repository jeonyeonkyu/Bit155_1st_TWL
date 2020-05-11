<%@page import="java.util.HashMap"%>
<%@page import="kr.or.bit.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!-- jstl 안의 core 객체들을쓰겟다!    c 라고 줄여줌 --> 
<%
	Emp e = new Emp();
	e.setEmpno(2000);
	e.setEname("bituser");  //이런건 어쩔수 없이 java로 해야함~!!
	
	HashMap<String,String> hp = new HashMap<>();
	hp.put("data","1004");


	//jsp 배우는이유 서버에잇는ㄴ거 화면에 출력하려고
    //EL  하고 JSTL 알면 앞에서 배운게 필요없당  쟤네도 출력이 목적이기떄문에 
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

1. JSTL 변수를 생성하거나 제어문을 쓸수 있는 자원을 제공해준다.서버쪽에서 해석되는 언어
<c:set var="emp" value="<%= e%>"></c:set>
${emp.empno}
${emp.ename}
<br>

EL 을 통해서 java 객체에 대한 직접 접근 불가
jstl set 구문을 사용, 변수 생성하고 이용해야함
이엘은 파라메터 값을 받음
<br>
스콥에 페이지  -> 그 페이지 에서만 
스콥에 리퀘스트 -> include forward 까지 
스콥에 세션 -> 모든 페이지에서 
<br>
<c:set var="me" value="꽤 졸리다" scope="session"></c:set>

${me }  
<br>
<h1>객체는 c:set 으로 받아내고 출력은 el로 하자</h1>
<h5>JSTL 은 페이지마다 선언을 해주는게 있음 3번줄</h5>
<h3>EL 파라메터 받기</h3>
${param.id }
${ param.pwd} <br>

여기서 userid 변수 에게 값을 넣어준다 
<c:set var="userid" value="${param.id }"></c:set>
<c:set var="userpwd" value="${param.pwd }"></c:set>
user id : ${userid }
userpwd : ${userpwd }
<c:if test="${!empty userpwd }">
	<h3> userpwd 는 빈값이 아니야</h3>
	<c:if test="${userpwd == 'me'}">
			<h3>이프문 안에 이프문 마찬가지로 넣을 수 있어 </h3>
	</c:if>
</c:if>

</body>
</html>


















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
<title>JSTL 은 별도로 jar 다운 받아야함  /WEB-INF/lib/안에 있음 </title>
</head>
<body>
기존방식 :  <%= e %><br>
기존방식 :  <%= e.getEmpno() %><br>
기존방식 :  <%= e.getEname() %><br>

<h3>EL (출력)</h3>

자바객체 출력하기(객체에 대한 직접접근 불가) : ${e}    &nbsp; 아무것도 안나오넹 <br> 
자바객체 속성 출력하기 : ${e.getEmpno()} &nbsp; 얘도 아무것도 안나오넹 <br>

1. JSTL (core) : 변수를 생성하거나 제어문을 쓸수 있는 자원을 제공해준다. <br> 서버쪽에서 해석되는 언어<br>
<c:set var="m" value="<%= e %>"></c:set>
<!-- 객체를 직접 쓰지는 못하는데 JSTL 을 사용해서 변수에 넣어주면 그때부터 사용가능하다. 요거 중요! -->
<!-- EL 은 JSTL로 만든 변수에는 접근이 가능하다  -->
JSTL 을 사용해서 변수 m 을 생성(e 객체의 주소값) : ${m}<br> 
<hr>
EL 출력 : JSTL 변수값을 출력 : ${m}<br>
EL 출력 : JSTL 변수(가능한데 잘 안써요) : ${m.getEmpno()}<br>
EL 출력 : JSTL 변수(자동으로 getter 함수를 호출하게 만듦)(m.member field명) : ${m.empno}<br>
$m.empno 는 내부적으로 getter 함수 호출하는 거라서 만들어 놓지 않은 상태라면 오류난다. <br> 
EL 출력 : JSTL 변수(자동으로 getter 함수를 호출하게 만듦)(m.member field명) : ${m.ename}<br>

<hr>

<h3>EL & JSTL 사용하기</h3>
****** EL 을 통해서 JAVA 객체에 대한 직접 접근 불가 ****** <br>
****** JSTL set 구문을 사용, 변수생성하고 이용해야함 *** <br>
** 1. EL : parameter 값 받기 param.<br>
** 2. 객체(requestScope, sessionScope)가지고 있어서 request 객체, session객체가 가지고 있는 값을 출력할수 있다. <br>
<c:set var="username" value="${m.ename}"></c:set>
cset 태그의 밸류값으로 EL 구문이 올수 있다.<br>
변수값 출력: ${username}<br> 

<hr>

<h3>JSTL 변수 만들고 값 설정하고  scope 정의하기</h3>
<c:set var="job" value="농구선수" scope="request"></c:set>
 <!-- scope 에 page 를 쓰면 이 페이지 에서만  job이 유효  얘가 default-->
 <!-- scope 에 request 를 쓰면 include 와 forword 까지 job이 유효 -->
 <!-- scope 에  session 를 쓰면  모든 페이지에서  job이 유효 -->
당신의 직업은 : ${job}<br>
만약에 당신이 [include] , [forward]를  한 페이지가 있다면 그 페이지에서도 job이라는 변수를 사용할 수 있다. <br>

<hr>

<c:set var="job2" value="야구선수" scope="request" />  <!-- 안쪽에 쓸내용 없을때 닫는 태그 생략가능 -->
값 출력<br>
${job2}<br>
변수 삭제 기능 (거의 안쓰지만 있는 문법이다)<br>
<c:remove var="job2"/><br>
job2 변수 삭제  : ${job2}<br><!-- 방금 없앴지만 오류안나고 그냥 안나옴..유연하다 -->

<hr>

hp객체(객체에게 직접 접근 불가함) : ${hp}<br>
<c:set var="vhp" value="<%= hp %>"/>
hp 객체에 지금부터는 접근 가능 : ${vhp}<br>
hp객체 : ${vhp.data}<br>
****************객체는 c:set 이 받아내고 EL 로 출력하자******************<br>

<!-- 
	hp.put("color","red")
 -->

<c:set target="${vhp}" property="color" value="red" /> 
EL JSTL 은 값을 넣는것보다는 읽어오는게 주 목적 !! 그래서 잘 사용하지 않는다 <br>
hp 객체 : ${vhp}<br>

https://cafe.naver.com/opensourceweb/854 
<br>
이 페이지 안의 코드처럼 짜는게 이걸 배우는 이유고 그 안의 forEach var="board" items="${list}" 이거 짠거 보셈 


</body>
</html>
































































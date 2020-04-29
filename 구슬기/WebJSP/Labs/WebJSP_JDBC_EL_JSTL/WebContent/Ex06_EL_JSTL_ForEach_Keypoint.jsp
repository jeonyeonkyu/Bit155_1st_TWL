<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.bit.Emp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 총 망라</title>
</head>
<body>

	<h1> JSTL 기억안나면 여기페이지로 오세용~~</h1>

	<h3>JSTL for </h3>
	<!-- 
		JAVA
		int sum=0;
		for(int i=0; i<=10 ;i++){
			sum += i;
		}
		for(String s : list){}
	 -->
	 
	 
	 <c:forEach var="i" begin="1" end="10">
	 	<c:set var ="sum" value="${sum+i}"/>
	 	${i}<br>
	 </c:forEach>
	sum 누적값 : ${sum}<br>	
	
	<hr>
	<h3>구구단 5단 출력하기</h3>
	
	<ul>
	<c:forEach var="i" begin="1" end="9">
		<li>5 * ${i}= ${5*i}</li>
	</c:forEach> 
	</ul>
	
	
	<hr>
	<h3>EL & JSTL 사용해서 2~9단까지 출력(forEach(중첩))</h3>
	<h5> choose , when, otherwise 사용 </h5>
	<table border="1">
		<c:forEach var ="i" begin="2" end="9">
			<c:forEach var="j" begin="0" end="9">
				<c:choose>
					<c:when test="${j == 0}">
						<tr bgcolor="dodgerblue"><th>${i}단</th></tr>
					</c:when>
					<c:otherwise>
						<tr><td>${i}*${j}=${i*j}</td></tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:forEach>
	</table>
	
	<hr>
	
	
	
	
	<h3> JSTL forEach 출력하기</h3>
	<%
		int[] arr = new int[]{10,20,30,40,50};
		//int[] = {}
		for(int i : arr){
			out.print("출력값:<b> "+i+"</b><br>");
		}
	%>
	
	
	<h3> EL 은 JAVA 객체에 직접적인 접근이 불가능 하다 [JSTL의 변수에 데이터 담은 후에..]</h3>
	<h5> c:set 으로 변수에 데이터 담은 후</h5>
	arr 객체[배열] 접근 불가: ${arr}<br>
	<h5> 그래서 intarr 변수에 arr 정보를 담아준다 </h5>
	<c:set var="intarr" value="<%= arr %>"/>   <!--  어쩔수 없이 밸류안에 한번 % 코드를 써줘야함 -->
	c : set 변수에 접근 : ${intarr}<br>
	
	<h3>JAVA 개선된 for 문 (JSTL 개선된 뭘 써야하지않냐 ?  items 있음)</h3>
	<h5>여기 중요★</h5>
	<c:forEach var="i" items="${intarr}"><!-- 여러가지 정보를 가진 변수를 items 안에 써줌 -->
		배열값 : ${i}<br> 
	</c:forEach>
	
	
	<h3> 단순하고..편하게?</h3>
	<h5> 그냥 바로</h5>
	<c:forEach var="i" items="<%= arr %>"> <!--  c:set 으로 담고 하지 않는 방법 ..어쩔수 없이 밸류안에 한번 % 코드를 써줘야함 --> 
		배열값2 : ${i}<br> 	
	</c:forEach>
	
	<h3>재미 삼아 더 짧게! </h3>
	<h5> 배열 생성 </h5>
	<c:forEach var="i" items="<%= new int[]{1,2,3,4,5} %>">
		배열값3 : ${i}<br>
	</c:forEach>
	
	<hr>
	
	<h3> forEach 활용하기2</h3>
	<h5>varStatus 를 사용하면 forEach 의 논리적인 속성값을 뽑아낼수 있음, 첨자값, 랭스값 등 </h5>
	<c:forEach var="i" items="${intarr}" varStatus="status">
		index:${status.index} &nbsp;&nbsp;&nbsp;
		count:${status.count} &nbsp;&nbsp;&nbsp;
		value:${i}<br>
	</c:forEach>
	
	<hr>
	<h1> ★ TODAY POINT (모르면 게시판 못 만들어요 ^^) ★ </h1>
	<%
		List<Emp> emplist =new ArrayList<>();
	
		emplist.add(new Emp(1000,"A"));
		emplist.add(new Emp(2000,"B"));
		emplist.add(new Emp(3000,"C"));
		
		//출력  >>EL &JSTL 코드로 만들줄 알아야한다 
		for(Emp e: emplist){
			out.print(e.getEmpno() +"/"+e.getEname()+"<br>");
		}
	
	%>
	
	<h3>JSTL 출력하세요</h3>
	<h5>이거 외우세요 </h5>
	
	<c:set var="list" value="<%= emplist %>"/> <!-- 이제 EL 에서 출력가능 -->
	<table border="1">
		<tr><td>사번</td><td>이름</td></tr>
		<c:forEach var="e" items="${list}">
		<!--  e 변수는 EMP 객체의 주소 -->
			<tr><td>${e.empno}</td><td>${e.ename}</td></tr>
		</c:forEach>
	</table>
	
	
	<h3>JSTL 출력하세요2</h3>
	<h5> c:set 구문 사용하지 말고 출력하세요  </h5>
	<table border="1">
		<tr><td>사번</td><td>이름</td></tr>
		<c:forEach var="emp" items="<%= emplist %>">
		<!--  e 변수는 EMP 객체의 주소 -->
			<tr><td>${emp.empno}</td><td>${emp.ename}</td></tr>
		</c:forEach>
	</table>
	
	<hr>
	
	<h3> JSTL 사용 Map 다루기</h3>
	<%
		Map<String,Object> hm = new HashMap<>();
		hm.put("name","hong");
		hm.put("pwd","1004");
		hm.put("date",new Date());
	%>
	<h3> ★ Java Map 객체 EL&JSTL 사용 출력하기( key, value)</h3>
	<c:set var="hm" value="<%=hm%>"/>
	<c:forEach var ="obj" items="${hm}">
		${obj.key} -> ${obj.value}<br>
	</c:forEach>
	
	(key)name : ${hm.name}<br>
	(key)name : ${hm.pwd}<br>
	(key)name : ${hm.date}<br>
	
	<hr>
	
	<h3>JSTL 구분처리</h3>
	<h5> for 문 + split 역할  </h5>
	<c:forTokens var="token" items="A.B.C.D" delims=".">
		${token}<br>
	</c:forTokens>
	
	
	<h3>JSTL 복합구분처리</h3>
	<h5> for 문 + split 역할  </h5>
	<c:forTokens var="token" items="A.B/C-D" delims="./-">
		${token}<br>
	</c:forTokens>
	
	
	
	<hr>
	<h3> 정상적으로 쓰진않지만, 있기한 방법 재미삼아 보세요 </h3>
	<!-- 
		step 이 마이너스 값을 사용할 수 없다   그래서~!
		step = -1 편법적으로 사용합니다 	
	 -->
	 <c:set var="nownum" value="10"/>
	 <c:forEach var="i" begin="0" end="${nownum}" step="1">
	 	${nownum - i}<br> <!-- 거의 안쓰지만 예제를 알려주심  -->
	 </c:forEach>
	 
	 <hr>
	 <h3>연도 고르기 </h3>
	 <select> <!-- 연도 고르기 이런식으로 사용된다  -->
	 <c:forEach var="i" begin="0" end="${2016-1900}">
	 	<c:set var="yearOption" value="${2016-i}"/>
	 	<option value="${yearOption}">${yearOption}</option>
	 </c:forEach>
	 </select>

</body>
</html>































































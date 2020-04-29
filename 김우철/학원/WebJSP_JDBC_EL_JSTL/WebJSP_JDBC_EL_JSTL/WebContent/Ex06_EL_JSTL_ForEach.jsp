<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.bit.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ★★ 여기 페이지 중요 (쌤말로는 이페이지만 다할줄알면 JSTL 할줄안다..★★  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSTL for</h3>
	<!--
		JAVA
		int sum=0;
		for(int i = 0; i < 10; i++){
			sum+=i;
		}
		for(String s : list){}
	 -->
	<c:forEach var="i" begin="1" end="10">
		<c:set var="sum" value="${sum+i}" />
	 	${i}<br>
	</c:forEach>
	sum 누적값 : ${sum}

	<h3>구구단 5단 출력하기</h3>
	<ul>
		<c:forEach var="i" begin="1" end="9">
			<li>5*${i}=${5*i}</li>
		</c:forEach>
	</ul>
	<h3>EL & JSTL 사용해서 2~9단까지 출력(forEach(중첩))</h3>
	<table border="1">
		<c:forEach var="i" begin="2" end="9">>
			<c:forEach var="j" begin="0" end="9">
				<c:choose>
					<c:when test="${j == 0}">
						<tr bgcolor="yellow">
							<th>${i}단</th>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td>${i}*${j}=${i*j}</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:forEach>
	</table>
	<!-- ★★이구문 이해 or 암기해서 재활용 할줄 알아야됨  -->

	<h3>JSTL forEach 출력하기</h3>
	<%
		int[] arr = new int[] { 10, 20, 30, 40, 50 };
		//int[] = {};
		for (int i : arr) {
			out.print("출력값 : <br>" + i + "<b><br>");
		}
	%>
	<h3>EL JAVA 객체에 직접적인 접근이 불가능하다.[JSTL에 변수에 데이터 담은 후에 ...]</h3>
	arr 객체[배열] 접근 불가 : ${arr}
	<br>
	<c:set var="intarr" value="<%=arr%>"></c:set>
	<!-- value에 유일하게 스파게티 코드를 사용할 수 밖에 없음  -->
	c: set 변수에 접근 : ${intarr}
	<br>
	<hr>
	<h3>JAVA 개선된 for문(JSTL 개선... items라는 속성을 제공)</h3>
	<c:forEach var="i" items="${intarr}">
		배열값 : ${i}<br>
	</c:forEach>

	<h3>단순하게 바로 출력하고싶을땐?(c:set에 담기 X)</h3>
	<c:forEach var="i" items="<%=arr%>">
		배열값2 : ${i}<br>
	</c:forEach>

	<h3>재미삼아..(이렇게는 잘 안씀)</h3>
	<c:forEach var="i" items="<%=new int[] { 1, 2, 3, 4, 5 }%>">
		배열값3 : ${i}<br>
	</c:forEach>

	<h3>forEach 활용하기</h3>
	<c:forEach var="i" items="${intarr}" varStatus="status">
		<!-- varStatus를 사용하면 내부적으로 index와 count가 만들어짐  -->
		index:${status.index} &nbsp,&nbsp,&nbsp;
		count:${status.count} &nbsp,&nbsp,&nbsp;
		value:${i}<br>
	</c:forEach>
	<hr>
	<h3>TODAY POINT(모르면 게시판 못 만듬!!)</h3>
	<%
		List<Emp> emplist = new ArrayList<>();

		emplist.add(new Emp(1000, "A"));
		emplist.add(new Emp(1000, "B"));
		emplist.add(new Emp(1000, "C"));

		//출력
		for (Emp e : emplist) {
			out.print(e.getEmpno() + "/" + e.getEname() + "<br>");
		}
	%>
	<h3>JSTL 출력하세요</h3>
	<c:set var="list" value="<%=emplist%>" />
	<table border="1">
		<tr>
			<td>사번</td>
			<td>이름</td>
		</tr>
		<c:forEach var="e" items="${list}">
			<!-- e 변수는 EMP 객체의 주소 -->
			<tr>
				<td>${e.empno}</td>
				<td>${e.ename}</td>
			</tr>
		</c:forEach>
	</table>

	<%
		List<Emp> emplist2 = new ArrayList<>();

		emplist.add(new Emp(1000, "A"));
		emplist.add(new Emp(1000, "B"));
		emplist.add(new Emp(1000, "C"));

		//출력
		for (Emp e : emplist) {
			out.print(e.getEmpno() + "/" + e.getEname() + "<br>");
		}
	%>
	<h3>JSTL 출력하세요2</h3>
	<table border="1">
		<tr>
			<td>사번</td>
			<td>이름</td>
		</tr>
		<c:forEach var="e" items="<%=emplist%>">
			<!-- e 변수는 EMP 객체의 주소 -->
			<tr>
				<td>${e.empno}</td>
				<td>${e.ename}</td>
			</tr>
		</c:forEach>
	</table>

	<h3>JSTL 사용 Map 다루기</h3>
	<%
		Map<String, Object> hm = new HashMap<>();
		hm.put("name", "hong");
		hm.put("pwd", "1004");
		hm.put("date", new Date());
	%>
	<h3>Java Map 객체 EL&JSTL 사용해서 출력하기(key, value)</h3>
	<c:set var="hm" value="<%=hm%>" />
	<c:forEach var="obj" items="${hm}">
		${obj.key} -> ${obj.value}<br>
	</c:forEach>
	(key)name ${hm.name}
	<br> (key)pwd ${hm.pwd}
	<br> (key)date ${hm.date}
	<br>

	<h3>JSTL 구분처리</h3>
	<c:forTokens var="token" items="A.B.C.D" delims=".">
		${token}<br>
	</c:forTokens>

	<h3>JSTL 복합구분처리</h3>
	<c:forTokens var="token" items="A.B/C-D" delims="./-">
		${token}<br>
	</c:forTokens>
	
	<!-- for문의 치명적인 단점(중요하진 않음 / 재미삼아 보시길 / 거의안씀)
		step이 마이너스값을 사용하지 못함
		그래서 step = -1 이라는 것을 편법적으로 사용(정상적인 방법X)
	 -->
	 <h3>forEach 단점(편법)</h3>
	<c:set var="nownum" value="10" />
	<c:forEach var="i" begin="0" end="${nownum}" step="1">
		${nownum - i}<br>
	</c:forEach>
	
	<c:forEach var="i" begin="0" end="${2016-1900}">
		<c:set var="yearOption" value="${2016-i}" />
		<option value="${yearOption}">${yearOption}</option>
	</c:forEach>
</body>
</html>
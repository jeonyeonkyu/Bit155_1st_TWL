<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.bit.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
	<h3>JSTL의 For문</h3>
	<!-- 
		java에서는
		int sum = 0;
		for(int i = 0; i <= 10; i++){
			sum += i;
		}
		
		혹은 개선된 포문
		for(String s : list){
		
		}
		
		JSTL에서는
	 -->
	<c:forEach var="i" begin="1" end="10">
		<c:set var="sum" value="${sum + i}"></c:set>
			${i}<br>
	</c:forEach>
	sum 변수의 누적값은 : ${sum}
	<br>

	<h3>구구단찍기</h3>
	<ul>
		<c:forEach var="i" begin="1" end="9">
			<li>5*${i} = ${5*i}</li>
		</c:forEach>
	</ul>
	<h3>EL & JSTL을 사용해서 2단부터 9단까지 출력하기(forEach(중첩구문))</h3>
	<table border="1">
		<c:forEach var="i" begin="2" end="9">
			<c:forEach var="j" begin="0" end="9">
				<c:choose>
					<c:when test="${j == 0 }">
						<tr bgcolor="yellow">
							<th>${i}단</th>
						</tr>
					</c:when>
					<c:otherwise>
						<!-- switch의 default와 같음 -->
						<tr>
							<td>${i}*${j}= ${i*j}</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:forEach>
	</table>
	<h3>JSTL forEach 출력하기</h3>
	<%
			 	int[] arr = new int[]{10,20,30,40,50};
				for(int i : arr){
					out.print("출력값 : <b>" + i + "<b><br>");
				}			
			%>

	<h3>EL JAVA 객체에 직접 접근 불가능[ 그러므로 JSTL을 이용하여 변수에 담아야 한다.]</h3>
	arr 객체[배열] 접근 불가: ${arr}
	<br>
	<c:set var="intarr" value="<%= arr %>" />
	접근이 가능해진다. : ${intarr}
	<br>
	<hr>
	<h3>java에서 개선된 for문 (JSTL 개선된...무엇인가를 써야 할 것 같다. items(복수일때) 속성을
		이용)</h3>
	<c:forEach var="i" items="${intarr}">
				배열값 : ${i}<br>
	</c:forEach>

	<h3>단순하게 편하게 쓰려면.. 변수에 담아서 무언가 다른 용도로 활용하지 않는다면</h3>
	<c:forEach var="i" items="<%= arr %>">
				2배열값2 : ${i}<br>
	</c:forEach>

	<h3>재미삼아서 보기</h3>
	<c:forEach var="i" items="<%= new int[]{1,2,3,4} %>">
		<!-- 이 안에서 new를 통해 생성해도 된다. -->
			3배열값3 : ${i}<br>
	</c:forEach>

	<h3>forEach 활용하기 2</h3>
	<c:forEach var="i" items="${intarr}" varStatus="status">
		<!-- varStatus는 i라는 변수가 돌아갈 때 어떻게 돌아가는지 내부의 상황을 보여주는 객체 index, count, value, length값 등을 추출해낼 수 있다.-->
				index: ${status.index} &nbsp;&nbsp;&nbsp;
				count: ${status.count} &nbsp;&nbsp;&nbsp;
				value :${i}<br>
	</c:forEach>
	<hr>
	<h1>TODAY POINT(모르면 게시판 못만듭니다...)</h1>
	<%
				List<Emp> emplist = new ArrayList<>();
				emplist.add(new Emp(1000, "A"));
				emplist.add(new Emp(2000, "B"));
				emplist.add(new Emp(3000, "C"));
			
				//출력
				for(Emp e : emplist){
					out.print(e.getEmpno() + "/" + e.getEname() + "<br>");
				}
			%>

	<h1>위의 출력 구문을 EL&JSTL로 할 수 있어야 한다.</h1>
	<c:set var="elist" value="<%= emplist %>" />
	<table border="1">
		<tr>
			<td>사번</td>
			<td>이름</td>
		</tr>
		<c:forEach var="e" items="${elist}">
			<!-- e라는 변수는 emp라는 객체의 주소값을 받는다. -->
			<tr>
				<td>${e.empno}</td>
				<td>${e.ename}</td>
			</tr>
		</c:forEach>
	</table>

	<h1>위의 출력 구문을 EL&JSTL로 할 수 있어야 한다._2</h1>
	<!-- :set 구문 사용하지 말고 출력하기 -->
	<table border="1">
		<tr>
			<td>사번</td>
			<td>이름</td>
		</tr>
		<c:forEach var="e" items="<%= emplist%>">
			<!-- e라는 변수는 emp라는 객체의 주소값을 받는다. -->
			<tr>
				<td>${e.empno}</td>
				<td>${e.ename}</td>
			</tr>
		</c:forEach>
	</table>
	<hr>
	<h3>JSTL 사용 MAP 다루기</h3>

	<%
			
				Map<String,Object> hm = new HashMap<>();
				hm.put("name","hong");
				hm.put("pwd", "1004");
				hm.put("date", new Date());
			%>

	<h3>Java Map 객체 EL&JSTL 사용 출력하기(key, value) Map객체라 출력 순서 보장X</h3>
	<c:set var="hm" value="<%=hm%>" />
	<c:forEach var="obj" items="${hm}">
				${obj.key} - > ${obj.value}<br>
	</c:forEach>
	<hr>
	(key)name(key를 제공하고 value값을 추출) : ${hm.name}
	<br> (key)pwd(key를 제공하고 value값을 추출) : ${hm.pwd}
	<br> (key)date(key를 제공하고 value값을 추출) : ${hm.date}
	<br>

	<hr>
	<h3>JSTL Token (구분처리)</h3>
	<c:forTokens var="token" items="A.B.C.D" delims=".">
		<!-- split과 똑같은 효과 -->
				${token}<br>
	</c:forTokens>

	<h3>JSTL Token (복합구분처리 여러개가 있을 때)</h3>
	<c:forTokens var="token" items="A.B/C-D" delims="./-">
				${token}<br>
	</c:forTokens>
	
	<!-- step 조절이 안된다. (앞,뒤 이동이 불가 즉 -값을 쓸 수 없음) 그래서 -1을 편법으로 사용한다.  -->
	<c:set var = "nownum" value = "10"/>
	<c:forEach var = "i" begin = "0" end="${nownum}" step= "1">
	${nownum - i}
	</c:forEach>
	<hr>
	<select>
	<c:forEach var="i" begin="0" end="${2016-1900}"> <!-- 생년월일 쓸 때 이거 쓰면 좋을듯 범위값을 표현 할 수도 있다. -->
		<c:set var="yearoption" value="${2016-i}"/>
		<option value="${yearoption }">${yearoption}</option>
	</c:forEach>
	</select>

</body>
</html>




















<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kr.or.bit.Member"%>
<%@page import="kr.or.bit.Emp"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="net.sf.json.JSONObject"%>

<!-- 안됨;;  -->

<%
	Emp emp = new Emp();
	request.setCharacterEncoding("UTF-8");
	Member member = new Member();
	//json 객체 형태(문자열)로 만들어서
	//String jsondata = "{" + "username:" + member.getUsername(); 
	//무식한 방법, JSONObject 이용하면 가느편
	JSONObject obj = JSONObject.fromObject(member);
	//자동으로 JSON 객체문자열을 생성
%>

<%-- <%=obj%> --%>
<hr>
<%
	List<Member> memberlist = new ArrayList<>();
 	memberlist.add(new Member("hong", "1004", "서울시 강남구", "0"));
	memberlist.add(new Member("hong", "1004", "서울시 강남구", "0"));
	memberlist.add(new Member("hong", "1004", "서울시 강남구", "0")); 

	//[{}, {}, {}]
	JSONArray objarray = JSONArray.fromObject(memberlist);
%>
<%=objarray%> 
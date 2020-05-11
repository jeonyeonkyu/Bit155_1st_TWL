<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="kr.or.bit.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   <% 
   	Member member = new Member();
   	//member라는 데이터를 json객체 형태의 문자열로 만들어서 보내고 싶다면? java에서는 JSON이라는 개념이 없기때문
   	String jsondata = "{" + "username: " + member.getUsername() +  "}"; //이게 너무 힘든 작업이라 json 라이브러리를 누군가 만들었다. json 객체형태로 만들어줌!
   	
   	JSONObject obj = JSONObject.fromObject(member); //데이터가 1건일때

   %>
   <%= obj %>
   
   <hr>
   
   <%
   	List<Member> memberlist = new ArrayList<>();
   memberlist.add(new Member("hong","1004", "서울시 강남구","0"));
   memberlist.add(new Member("lee","1004", "서울시 강서구","1"));
   memberlist.add(new Member("kim","1111", "서울시 강북구","1"));
   
   //[{},{},{}] = 객체가 여러건 일때
	JSONArray objarray = JSONArray.fromObject(memberlist);
   %>
   <%= objarray %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>
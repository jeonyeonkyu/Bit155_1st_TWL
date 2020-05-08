<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	SimpleDateFormat sdf = new SimpleDateFormat("a hh시 mm분 ss초");
	String msg = request.getParameter("msg");
	String html = "<div>" + msg + sdf.format(new Date().getTime()) + "</div>";
%>

<%= html %>
<!--  주석혹은 html태그 같은것도 response되서 에러뜸!!, 내생각엔 데이터만 넘겨주는게 맞음 -->
<!-- <html></html> -->

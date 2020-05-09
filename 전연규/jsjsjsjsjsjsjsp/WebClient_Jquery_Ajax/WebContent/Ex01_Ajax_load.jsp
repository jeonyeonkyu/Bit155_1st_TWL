<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("a hh시 mm분 ss초");
	String msg = request.getParameter("msg");
	String html="<div>" + msg + sdf.format(new Date().getTime()) + "</div>";
 %>
<%= html %>

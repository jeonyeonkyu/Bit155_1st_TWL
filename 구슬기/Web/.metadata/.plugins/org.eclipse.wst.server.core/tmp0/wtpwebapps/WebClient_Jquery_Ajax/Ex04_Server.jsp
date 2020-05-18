<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   String name = request.getParameter("name");
   String pwd = request.getParameter("pwd");    //8,9 번줄을 클라이언트에게 리턴함 
%>
당신의 이름은:<%= name %>
당신의 비번은:<%= pwd %>    


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    
    String uid = request.getParameter("userId");
    String name = request.getParameter("userName");
    String pwd = request.getParameter("userPass");
    String pwdCheck = request.getParameter("userPassCheck");
    String gender = request.getParameter("gender");
    String email = request.getParameter("userEmail");
    String userSsn1 = request.getParameter("userSsn1");
    String userSsn2 = request.getParameter("userSsn2");
    String userZipCode = request.getParameter("userZipCode");
    String userAddr1 = request.getParameter("userAddr1");
    String userAddr2 = request.getParameter("userAddr2");
    String userPhone = request.getParameter("userPhone");
    String[] hobby = request.getParameterValues("hobby");
    String bYear = request.getParameter("year");
    String bMonth = request.getParameter("month");
    String bDay = request.getParameter("day");
 
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
</head>
<body>
    <hr>
    입력 정보 확인 <br>
    <hr><br>
    아이디    :    <%= uid %><br>
    이름    :    <%= name %><br>
    비밀번호    :    <%= pwd %><br>
    비밀번호 확인    :    <%= pwdCheck %><br>
    성별    :    <%= gender %><br>
    E-mail    :    <%= email %><br>
    주민번호    :    <%= userSsn1 %> - <%= userSsn2 %><br>
    우편번호    :    <%= userZipCode %><br>
    주소    :    <%= userAddr1 %> <%= userAddr2 %><br>
    핸드폰번호    :    <%= userPhone %><br>
         취미    :    
    <%
        for(String str : hobby){
       %>
        <%= str %>,
    <%
        }
    %> <br>
    
    생년월일: <%= bYear %>년 <%= bMonth %>월 <%= bDay %>일<br>
        
 
</body>
</html>

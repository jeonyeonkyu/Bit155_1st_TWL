<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
     	request.setCharacterEncoding("UTF-8");
    	
    //1. request라는 객체를 통해서 클라이언트가 입력한 값을 받을때의 종류는 아래와 같다. 
    //[단일값]
    //input type > text , password, radio, textarea, select(단일)
    //[복수값]
    //input type > checkbox(name 이 같다는 전제 하에) , select(multiple다중)
    
        String uid = request.getParameter("userid");
  		String pwd = request.getParameter("pwd");
  		String[] hobby = request.getParameterValues("hobby");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
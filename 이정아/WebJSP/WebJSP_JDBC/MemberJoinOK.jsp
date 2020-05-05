<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.regex.Matcher"%>
<%@ page import="java.util.regex.Pattern"%>
    
    
    <%
	
     request.setCharacterEncoding("UTF-8");
    
	String uid = request.getParameter("userId"); //아이디
   	String uname = request.getParameter("userName"); //이름
 	String pwd = request.getParameter("userPass"); //비번
 	String pwcheck = request.getParameter("userPassCheck"); //비번확인
 	
	

   //아이디 검증
 		String checkIdpwd = "^[a-zA-z0-9]{4,12}$"; //아이디 패스워드 같이, 영문 대소문자 숫자 4~12자리
    	Pattern p = Pattern.compile(checkIdpwd);
    	Matcher m = p.matcher(uid);
    
     if(!m.matches()){
    	   PrintWriter script = response.getWriter();
    	      script.println("<script>");
    	      script.println("alert('아이디는 영문 대소문자와 숫자 4~12자리로 입력해야 합니다.');");
    	      script.println("location.href = Ex06_register_quiz");
    	      script.println("</script>");
    	      script.close();
    	      return;
    }
   
	//이름 검증
	String checkName = "^[가-힣]{2,4}$"; //한글이름 2~4글자이면 됨
	Pattern p2 = Pattern.compile(checkName);
    Matcher m2 = p.matcher(uname);

	
	     if(m2.matches()){
    	   PrintWriter script = response.getWriter();
    	      script.println("<script>");
    	      script.println("alert('이름을 다시 입력해주세요');");
    	      script.println("location.href = Ex06_register_quiz");
    	      script.println("</script>");
    	      script.close();
    	      return;
    }
   
	
	

	//비밀번호 검증
	//String checkIdpwd = "^[a-zA-z0-9]{4,12}$"; 위에있음
 	Pattern p3 = Pattern.compile(checkIdpwd);
    Matcher m3 = p2.matcher(pwd);
    
    if(m3.matches()){
    	   PrintWriter script = response.getWriter();
    	      script.println("<script>");
    	      script.println("alert('비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야 합니다.');");
    	      script.println("location.href = Ex06_register_quiz");
    	      script.println("</script>");
    	      script.close();
    	      return;
    }
    
    //비밀번호 일치
	Pattern p4 = Pattern.compile(pwd);
    
    if(p3 == p4){
    	 PrintWriter script = response.getWriter();
    	  script.println("<script>");
   	      script.println("alert('비밀번호가 일치하지 않습니다.');");
   	      script.println("location.href = Ex06_register_quiz");
   	      script.println("</script>");
   	      script.close();
    }

    		
  		
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
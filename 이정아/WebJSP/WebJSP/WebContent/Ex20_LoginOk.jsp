<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <% //1. 한글처리(페이지 상단에 제일 먼저 하기!)
    	request.setCharacterEncoding("UTF-8");  //한글처리
  		

	  String uid = request.getParameter("uid");
	  String pwd = request.getParameter("pwd");
		String chk = null;
		chk = request.getParameter("chk");
	
		  
		  if(uid.equals(pwd)){ //로그인 성공시
				if(chk != null){ //체크박스에 체크가 되어있다면 쿠키를 생성
					if(chk.equals("on")){ //쿠키 생성
						Cookie co = new Cookie("UID",uid);
						co.setMaxAge(24*60*60);
						response.addCookie(co);
					}
				}else{ //체크가 안되어있다면 쿠키 삭제
					Cookie delco = new Cookie("UID","");
					delco.setMaxAge(0); //소멸시키는 코드
					response.addCookie(delco);			
				}
				out.print("<script>location.href='Ex19_Login.jsp'</script>"); //로그인에 성공하면 뜨는 페이지
			}else{
				response.sendRedirect("Ex19_Login.jsp"); //서버에게 이 페이지 주세요 //로그인에 실패하면 뜨는 페이지
			}
	
    	%>
<title>Insert title here</title>
</head>
<body>
<!--  
ID , PWD , CHK 값 받아서

1. id, pwd 같다면 로그인 성공 (if(id.equals(pwd)...
   chk 값이 체크되어있다면
   >쿠키를 생성해서 사용자의 id값을 쿠키에 담으세요 : 유효타임(24시간)
   >쿠키 쓰기 완료

2. id, pwd 같아면 로그인 성공
   chk 값이 체크되어 있지 않으면
   >기존 생성했던 쿠키 삭제 :setMaxAge(0)
   
3. id ,pwd 같지 않다면
   response.sendRedirect() >> Ex19_Login.jsp       
-->


</body>
</html>
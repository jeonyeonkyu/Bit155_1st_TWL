<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	/*  
	회원가입 처리 페이지 (디자인 필요 없다)
	1.한글처리
	2.데이터 받기(request)
	3.데이터 확인하기 -- out.print해서 잘 가져왔나 확인 
	4.로직처리 (비지니스 로직)
	  회원가입 -> 데이터 받아서 -> DB 연결 -> Insert -> 유무 -> Client 
	  
	                   (페이지 이동 두가지 sendReDirect, location  --https://cafe.naver.com/opensourceweb/837)
	 Insert 성공 > 회원가입 > 페이지 이동 > 로그인 화면(로그인 요구) 
	 
	  이동 : java: response.sendRedirect("") , javaScript: location.href="" 
	 >> 클라이언트가 서버에게 페이지를 재요청 
	 >> https://cafe.naver.com/bitsmartweb/697
	  
	 Insert 실패 > 경고창 > 회원가입 이동
	 >> <script>alert()</script>
	 
	 DB:
     id, pwd, name, age, gender, email, ip
     ip .....request.getRemoteAddr()
	*/
	
	//한글처리
	request.setCharacterEncoding("UTF-8");
	
	 //데이터 받기
	String id = request.getParameter("id"); 
	String pwd = request.getParameter("pwd"); 
	String name = request.getParameter("mname"); 
	int age = Integer.parseInt(request.getParameter("age")); 
	String gender = request.getParameter("gender"); 
	String email = request.getParameter("email"); 
	
	
	//데이터 잘 가져왔나 확인 
	//out.print(id + "/"+pwd + "/"+name + "/"+age + "/"+gender + "/"+email);
	//out.print(request.getRemoteAddr());  
	
	
	//DB연결
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = null;
	PreparedStatement pstmt=null;
	
	try{//INSERT
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bit","1004");
		String sql="insert into koreamember(id,pwd,name,age,gender,email,ip) values(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		pstmt.setString(3, name);
		pstmt.setInt(4, age);
		pstmt.setString(5, gender);
		pstmt.setString(6, email);
		pstmt.setString(7, request.getRemoteAddr());
		//IP는 다르게 받나?
				
		int result = pstmt.executeUpdate();
		if(result !=0){ //성공한거임
			out.print("<script>");
				out.print("location.href='Ex02_JDBC_Login.jsp'");	
			out.print("</script>");
		}else{ //실행될 확률 거의없다 ... 대부분 예외로 Exception으로 빠진다. 
			out.print("<script>");
				out.print("alert('가입실패');");	
			out.print("</script>");		
		}
		
	}catch(Exception e){
		// pstmt.executeUpdate(); 실행시  PK 위반 예외 발생    if 타지 않고 ....
		out.print("<script>");
			out.print("alert('가입실패');");	
			out.print("location.href='Ex02_JDBC_JoinForm.jsp'");
			//다시 회원가입으로 빠진다. 
		out.print("</script>");
	}finally{
		if(pstmt != null){ try{pstmt.close();}catch(Exception e){} }
		if(conn != null){ try{conn.close();}catch(Exception e){} }
	}
	
	
	
	
%>











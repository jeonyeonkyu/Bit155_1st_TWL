<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%  
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id"); 
	String password = request.getParameter("password"); 
	String passwordCheck = request.getParameter("passwordCheck"); 
	String name = request.getParameter("name"); 
	String email = request.getParameter("email"); 
	String phone = request.getParameter("phone"); 
	
	//out.print(id + "/"+pwd + "/"+name + "/"+age + "/"+gender + "/"+email);
	//out.print(request.getRemoteAddr()); ip받는 메소드
	
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = null;
	PreparedStatement pstmt=null;
	
	try{
		
		 conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","BIT","1004");
		//conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","c##book_ex","rladncjf1");
		String sql="insert into bituser(id,pwd,pwdCheck,name,email,phone,ip) values(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		pstmt.setString(3, passwordCheck);
		pstmt.setString(4, name);
		pstmt.setString(5, email);
		pstmt.setString(6, phone);
		pstmt.setString(7, request.getRemoteAddr());
		
		int result = pstmt.executeUpdate();
		
		if(result !=0){
			out.print("<script>");
			out.print("location.href='login.jsp'");	
			out.print("</script>");
		}else{ //실행될 확률 거의없다 ...(예외로 빠지기 때문에..예외처리 잘해라!! ex)중복값 삽입 등)
			out.print("<script>");
			out.print("alert('가입실패');");	
			out.print("</script>");		
		}
		
	}catch(Exception e){
		// pstmt.executeUpdate(); 실행시  PK 위반 예외 발생    if 타지 않고 ....
		out.print("<script>");
		out.print("alert(' e.printStackTrace()');");	
		out.print("location.href='register.jsp'");	
		out.print("</script>"); 
	}finally{
		if(pstmt != null){ try{pstmt.close();}catch(Exception e){} }
		if(conn != null){ try{conn.close();}catch(Exception e){} }
	}
	
	
	
	
%>











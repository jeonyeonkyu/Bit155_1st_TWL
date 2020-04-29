<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  

	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id"); 
	String pwd = request.getParameter("pwd"); 
	String pwdCheck = request.getParameter("pwdCheck");
	String name = request.getParameter("name"); 
	String email = request.getParameter("email"); 
	String phone = request.getParameter("phone"); 
	//String ip = request.getParameter("ip"); 
	
	//out.print(id + "/"+pwd + "/"+name + "/"+email + "/"+phone);
	//out.print(request.getRemoteAddr()); //IP정보를 받아 올 수 있음
	
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = null;
	PreparedStatement pstmt=null;
	
	try{
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bit","1004");
		String sql="insert into bituser(id,pwd,pwdCheck,name,email,phone,ip) values(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		pstmt.setString(3, pwdCheck);
		pstmt.setString(4, name);
		pstmt.setString(5, email);
		pstmt.setString(6, phone);
		pstmt.setString(7, request.getRemoteAddr()); //IP는 이렇게 받는다.
		
		int result = pstmt.executeUpdate();
		if(result !=0){
			out.print("<script>");
				out.print("location.href='login.jsp'"); //성공하면 로그인페이지로 이동	
			out.print("</script>");
		}else{ //실행될 확률 거의없다 ... 예외로 빠지기 때문에
			out.print("<script>");
				out.print("alert('가입에 실패하였습니다.');");	
			out.print("</script>");		
		}
		
	}catch(Exception e){
		// pstmt.executeUpdate(); 실행시  PK 위반 예외 발생(중복데이터)    if 타지 않고 ....
		out.print("<script>");
			out.print("alert('가입실패');");	
			out.print("location.href='register.jsp'");	
		out.print("</script>");
	}finally{
		if(pstmt != null){ try{pstmt.close();}catch(Exception e){} }
		if(conn != null){ try{conn.close();}catch(Exception e){} }
	}
	
	
	
	
%>











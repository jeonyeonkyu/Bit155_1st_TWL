<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		
	if(session.getAttribute("userid") == null || 
	!session.getAttribute("userid").equals("admin")  
	){

	  out.print("<script>");
	  out.print("location.href='login.jsp'");
	  out.print("</script>");
	}
 
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		conn = Singleton_Helper.getConnection("oracle");
		String sql = "update bituser set id=? , name=? , email=? , phone=? where id=?";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, email);
		pstmt.setString(4, phone);
		int result = pstmt.executeUpdate();
		if(result > 0){
			out.print("<script>");
			out.print("location.href='memberlist.jsp'");
			out.print("</script>");
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		Singleton_Helper.close(pstmt);
	
	}
%>
 
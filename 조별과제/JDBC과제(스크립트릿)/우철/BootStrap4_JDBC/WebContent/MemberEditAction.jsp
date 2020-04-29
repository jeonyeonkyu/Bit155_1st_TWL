<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		
	if(session.getAttribute("userid") == null || 
	!session.getAttribute("userid").equals("admin")  
	){
	  //다른 페이지 이동
	  out.print("<script>");
	  out.print("location.href='index.jsp'");
	  out.print("</script>");
	}
 
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String passwordCheck = request.getParameter("passwordCheck");
	String email = request.getParameter("email");
	//out.print(id + " / " + name + " / " + age + " / " + email);
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		conn = Singleton_Helper.getConnection("oracle");
		String sql = "update bituser set pwd=?, pwdcheck=?, email=? where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, password);
		pstmt.setString(2, passwordCheck);
		pstmt.setString(3, email);
		pstmt.setString(4, id);
		int result = pstmt.executeUpdate();
		if(result > 0){
			out.print("<script>");
			out.print("location.href='Memberlist.jsp'");
			out.print("</script>");
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		Singleton_Helper.close(pstmt);
	
	}
%>
 
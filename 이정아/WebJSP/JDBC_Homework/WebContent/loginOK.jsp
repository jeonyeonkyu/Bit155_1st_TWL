<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		
		//conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bituser","1004"); 싱글톤 헬퍼만들었으므로
		//비기능적 요구사항
		conn = Singleton_Helper.getConnection("oracle");
		String sql="select id, pwd from bituser where id=?"; //?의 의미는 클라이언트가 입력한 id값 // sql에 미리 이 문장을 심어넣고
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();  //rs를 쓸 때 마다 위의 sql문장 + ? 만 넣으면 실행되도록
		
		//업무
		while(rs.next()){
			//데이터가 있다 select 할 때 id값을 ?로 받았는데 그 값이 1개이상 존재한다는 것 (id가 존재)
			
			//ID 존재
			if(pwd.equals(rs.getString("pwd"))){
			  //ID 존재 , PWD(0) 
			  //정상회원
			  
			  //Top.jsp 정보 로그인 상태 ...(~~님 로그인 중)
			  session.setAttribute("userid", rs.getString("id"));
			  
			  //이동처리(메인페이지로 이동시키기)
			  response.sendRedirect("main.jsp");
			}else{
				//ID 존재 , PWD(x)
			response.sendRedirect("login.jsp");
			}
		}
		//while 타지 않는 경우(id가 존재하지 않는 경우)
		out.print("<script>");
			out.print("location.href='login.jsp'");
		out.print("</script>");
		
		
		//
	}catch(Exception e){
		System.out.println(e.getMessage());
	}finally{
		Singleton_Helper.close(rs);
		Singleton_Helper.close(pstmt);
	} 
	
%>    






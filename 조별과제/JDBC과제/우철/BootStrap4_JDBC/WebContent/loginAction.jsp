<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	//Class.forName("oracle.jdbc.OracleDriver"); tomcat 9.0 생략 가능
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		//conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","c##book_ex","rladncjf1");
		//비기능적 요구사항
		conn = Singleton_Helper.getConnection("oracle");
		String sql = "select id, pwd from bituser where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();

		//업무)
		while (rs.next()) {
			//데이터가 있다 (id가 존재)

			//ID 존재
			if (password.equals(rs.getString("pwd"))) {
				//ID 존재 , PWD(0) 
				//정상회원

				//Top.jsp 정보 로그인 상태 ...
				session.setAttribute("userid", rs.getString("id"));
				//session은 서버메모리를 쓴것
				//개발자도구에 따로 표시해주지않는 이상 볼 수 없음

				//이동처리
				response.sendRedirect("index.jsp");
			} else {
				//ID 존재 , PWD(x)
				out.print("<script>");
				out.println("alert('비밀번호가 틀렸습니다.');");
				out.print("location.href='login.jsp'");
				out.print("</script>");
			}
		}
		//while 타지 않는 경우 : id가 빈 공백인 상태서 뒤로가기시 이로직을 타서 id != null 조건 추가
		out.print("<script>");
		out.println("alert('아이디가 존재하지 않습니다.');");
		out.print("location.href='login.jsp'");
		out.print("</script>");

		
		//
	} catch (Exception e) {
		System.out.println(e.getMessage());
	} finally {
		Singleton_Helper.close(rs);
		Singleton_Helper.close(pstmt);
	}
%>















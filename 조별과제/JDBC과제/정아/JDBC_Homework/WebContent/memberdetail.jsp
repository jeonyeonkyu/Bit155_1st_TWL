<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin") ){
		//강제로 페이지 이동
		out.print("<script>location.href='login.jsp'</script>");
	}

%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

				<%
				  		String id = request.getParameter("id");
				  
				  		Connection conn = null;
				  		PreparedStatement pstmt = null;
				  		ResultSet rs = null;
				  		
				  		try{
				  			conn = Singleton_Helper.getConnection("oracle");
				  			String sql = "select id,pwd,name,email,phone from bituser where id=?";
				  			pstmt = conn.prepareStatement(sql);
				  			
				  			pstmt.setString(1, id);
				  			
				  			rs = pstmt.executeQuery();
				  		
				  			while(rs.next()){
				  %>
				  			<div class = "container">
				  			 <table class = "table">
				  			 	<tr>
				  			 		<td>아이디</td>
				  			 		<td><%= rs.getString("id") %></td>
				  			 	</tr>
				  			 	<tr>
				  			 		<td>비밀번호</td>
				  			 		<td><%= rs.getString("pwd") %></td>
				  			 	</tr>
				  			 	<tr>
				  			 		<td>이름</td>
				  			 		<td><%= rs.getString("name") %></td>
				  			 	</tr>
				  			 	<tr>
				  			 		<td>이메일</td>
				  			 		<td><%= rs.getString("email") %></td>
				  			 	</tr>
				  			 	<tr>
				  			 		<td>핸드폰번호</td>
				  			 		<td><%= rs.getString("phone") %></td>
				  			 	</tr>
			
				  			 	<tr>
				  			 		<td colspan="2">
				  			 			<a href="memberlist.jsp">목록으로 가기</a>
				  			 		</td>
				  			 	</tr>
				  			 </table>
				  			</div>	
				  <%				
				  			}
				 
				  		}catch(Exception e){
				  			
				  		}finally{
				  			Singleton_Helper.close(rs);
				  			Singleton_Helper.close(pstmt);
				  		}
				  
				  %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		
</body>

</html>
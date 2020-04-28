<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin") ){
		out.print("<script>location.href='login.jsp'</script>");
	}
    
	request.setCharacterEncoding("UTF-8");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>
<body>
	<div class = "container">
	<table class = "table">
		<tr>
			<td>
			
			 <%
			 	String name=request.getParameter("search");	
			 
			 	Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
			    
				conn = Singleton_Helper.getConnection("oracle");
				String sql="select count(*) from bituser where name like ?"; //전체 몇 건인지 조회
				String sql2 ="select id, name, email from bituser where name like '%"+name+"%'"; //이름으로 개별 검색
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%'+name+'%');
				rs= pstmt.executeQuery();
				int rowcount=0;
				if(rs.next()){
					rowcount = rs.getInt(1); //조회건수
				}
			 %>
				<table class = "table">
							<tr><th colspan="4">회원리스트</th></tr>
							<%
								if(rowcount > 0){
									pstmt = conn.prepareStatement(sql2); 
									rs = pstmt.executeQuery();
									while(rs.next()){
										String id = rs.getString(1);
										String mname = rs.getString(2);
										String email = rs.getString(3);
							%>
									 <tr>
									 	<td><%=id%></td>
									 	<td><%=mname%></td>
									 	<td><%=email %></td>
									 </tr>
							<%			
									} 
									out.print("<tr><td colspan='3'>");
									out.print("<b>[" + name + "] 조회결과" + rowcount + "건 조회</b>");
									out.print("</td></tr>");	
								}else{ 
									out.print("<tr><td colspan='3'>");
									out.print("<b>[" + name + "] 조회결과가 없습니다</b>");
									out.print("</td></tr>");	
								}
							%>
				</table>
				<a href="memberlist.jsp">회원 목록 페이지</a>
			<%
				Singleton_Helper.close(rs);
				Singleton_Helper.close(pstmt);
			%>		
			</td>
		</tr>
	</table>
	</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
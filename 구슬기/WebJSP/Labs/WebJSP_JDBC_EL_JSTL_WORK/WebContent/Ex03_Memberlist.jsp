<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/*  
	
	 1.관리자만 접근 가능한 페이지
	 2.로그인한 일반 회원이 주소값을 외워서 ... 접근불가 
	 3.그러면  회원에 관련되 모든 페이지 상단에는 아래 코드를 ..... : sessionCheck.jsp >> include 
	
*/      //아래의 로그인하러 가라! 코드가 반복되는게 싫으면 common폴더에 빼놓고 필요할때마다 include하면 됨 
	 if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin") ){
		//강제로 페이지 이동
		//out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
		response.sendRedirect("Ex02_JDBC_Login.jsp");
		//로그인하러 가라!
	} 
%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: solid 2px black;
	border-collapse: collapse;
}

tr {
	border: solid 1px blue;
	background-color: white;
	color: black;
}

td {
	border: solid 1px red;
}
</style>
</head>
<body>
	<table style="width: 900px; height: 500px; margin-left: auto; margin-right: auto;">
		<tr>
			<td colspan="2">
				<jsp:include page="/common/Top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td style="width: 200px">
				<jsp:include page="/common/Left.jsp"></jsp:include>
			</td>
			<td style="width: 700px">
			<!--  
				회원 목록(리스트) 출력
				목록 (select id, ip from koreamember)
			-->	
				<%
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try{
						conn = Singleton_Helper.getConnection("oracle");
						String sql="select id, ip from koreamember";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery(); 
					
				%>	
					<table style="width: 400px;height: 100px;margin-left: auto;margin-right: auto">
							<tr><th colspan="4">회원리스트</th></tr>
						<% while(rs.next()){ %>
							<tr>
								<td width="100px">   <!--  요부분 중요 그래서 주석도 많아용! -->
										<a href='Ex03_MemberDetail.jsp?id=<%=rs.getString("id")%>'><%=rs.getString("id")%></a>
								</td><!-- get방식 이 쓰일수밖에 없는 이유. 링크를 만드는거.      아이디를 화면에 뿌려주고 아이디 정보를 가지고 링크로 간다  -->
								<td width="100px"><%=rs.getString("ip")%></td>
								<td>
									<a href="Ex03_MemberDelete.jsp?id=<%=rs.getString("id")%>">[삭제]</a>
								</td><!--  웹에서 '간다'는건 다 링크로 만든다  -->
								<td>
									<a href="Ex03_MemberEdit.jsp?id=<%=rs.getString("id")%>">[수정]</a>
									<!--  만약 게시판이라면 글번호 정보를 가지고 간다    -->
									<!--  http://192.168.0.25:8090/WebJSP_JDBC/Ex03_MemberDetail.jsp?id=admin   
									             이렇게 id= 뒤에 아이디정보 가지고 넘어감 -->
								</td>
							</tr> 
						<% } %>
					</table>
					<hr>
						<form action="Ex03_MemberSearch.jsp" method="post">
							회원명:<input type="text" name="search">
							<input type="submit" value="이름검색하기">
						</form>
					<hr>					
				<%	
					}catch(Exception e){
						
					}finally{
						Singleton_Helper.close(rs);
						Singleton_Helper.close(pstmt);
						//싱글톤헬퍼의 클로즈 함수로 다 닫아준다. 
					}
				%>
			
			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="/common/Bottom.jsp"></jsp:include></td>
		</tr>
	</table>
</body>
</html>
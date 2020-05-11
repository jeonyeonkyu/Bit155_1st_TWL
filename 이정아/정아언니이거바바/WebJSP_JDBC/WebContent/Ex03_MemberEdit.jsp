<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/* 
	회원정보 수정하기
	1.DB 쿼리 : 2개 (수정정보 : select , 수정정보반영 : update)
	 1.1 : select * from koreamember where id=? //기존 정보를 가져와서 보여주기 위함
	 1.2 : update koreamember set ename=? where id=? //기존 정보를 수정해서 업데이트용
	2.화면 1개(기존에 입력내용 보여주는 것)-> 처리 1개 (수정처리)
	 2.1  DB select 한 결과 화면 출력 
	      <input type="text" value="rs.getString(id)">
	      수정안하고 .. 화면 .. 전송 필요없다면 : <td>rs.getString("id")</td>
	      수정안하고 .. 화면 .. 전송 필요하다면   : <input type="text" value="rs.getString(id)" readonly> 
	      수정하고 ..화면  ..전송 필요하다면   :  <input type="text" value="rs.getString(id)">
	
	*/
	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin") ){
		//강제로 페이지 이동
		out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
	}
	
	
    request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		conn = Singleton_Helper.getConnection("oracle");
		String sql="select id,pwd,name,age,trim(gender),email from koreamember where id=?"; 
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,id);
		
		rs = pstmt.executeQuery(); 
		
		//while(rs.next())
		rs.next(); //1건 데이터가 있다면 전제조건 어짜피 데이터가 1건 밖에 없을 것이므로 while문으로 돌릴 필요가 없다.
		//html 안의 코드는 한번만 뿌려지면 되기 때문에
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
	<table
		style="width: 900px; height: 500px; margin-left: auto; margin-right: auto;">
		<tr>
			<td colspan="2"><jsp:include page="/common/Top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td style="width: 200px"><jsp:include page="/common/Left.jsp"></jsp:include>
			</td>
			<td style="width: 700px">
				<form action="Ex03_MemberEditok.jsp" method="post">

					<h3 style="text-align: center;">회원가입</h3>
					<div>
						<table
							style="width: 400px; height: 200px; margin-left: auto; margin-right: auto;">
							<tr>
								<td>아이디</td>
								<td>
								  	<input type="text" name="id" value="<%=rs.getString(1)%>" readonly>
								  	<!-- 아이디값이 업데이트시에 필요하기 때문에 수정을 할 수 없어도 td로 하지 않고 input태그로 해서 DB서버로 id도 전송하도록, 일반 td는 데이터 전송이 안되므로
								  	/ 서버로 보내야하는데 수정을 못하게 하려면 input태그 이용해서 readonly로>
								  	-->
								</td>
							</tr>
							<tr>
								<td>비번</td><!-- 비번은 텍스트로 뿌려져서 수정작업이 안되도록 유도 -->
								<td><%= rs.getString(2) %></td>							</tr>
							<tr>
								<td>이름</td><!-- input태그로 설정해서 수정을 할 수 있게 유도 -->
								<td>
									<input type="text" name="name" value="<%=rs.getString(3)%>" style="background-color: yellow">
								</td>
							</tr>
							<tr>
								<td>나이</td>
								<td>
									<input type="text" name="age" value="<%=rs.getString(4)%>" style="background-color: yellow">
								</td>
							</tr>
							<tr>
								<td>성별</td>
								<td>
									[<%=rs.getString(5) %>] <!-- 남, 여가 들어있는 데이터 현재는 로그인 된 데이터가 여자이므로 [여]로 표시 -->
									<input type="radio" name="gender" id="gender" value="여" 
									<%if (rs.getString(5).equals("여")){ %>checked<%}%>>여자 <!-- 가져온 데이터가 여자라면 checked 속성에 여자에 체크를 하겠다. -->
									<input type="radio" name="gender" id="gender" value="남"
									<%if (rs.getString(5).equals("남")){ %>checked<%}%>>남자
								</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>
									<input type="text" name="email" value="<%=rs.getString(6)%>" style="background-color: yellow">
								</td>
							</tr>
							<tr>
								<td colspan="2">
								<input type="submit" value="수정하기">
								<a href='Ex03_Memberlist.jsp'>리스트이동</a></td>
						</table>

					</div>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="/common/Bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>
<%
	}catch(Exception e){
		
	}finally{
		Singleton_Helper.close(rs);
		Singleton_Helper.close(pstmt);
	}

%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/* 
	회원정보 수정하기
	수정 할 정보와 수정하지 않아야할 정보구분하기
	
	
	1.DB 쿼리 : 2개 (수정정보 : select , 수정정보반영 : update)
	 1.1 : select * from koreamember where id=?
	 1.2 : update koreamember set ename=? where id=?		 
	
    2.화면 1개(기존에 입력내용 보여주는 것)-> 처리 1개 (수정처리)          //가입은 insert  수정은 update  가입과 수정은 비슷하당 
	 2.1  DB select 한 결과 화면 출력 
	      <input type="text" value="rs.getString(id)">
	      수정안하고 .. 화면 .. 전송(x) : <td>rs.getString("id")</td>    
	      수정안하고 .. 화면 .. 전송   : <input type="text" value="rs.getString(id)" readonly>
	      수정하고 ..화면  ..전송   :  <input type="text" value="rs.getString(id)">
	
	*/
	//페이지에 들어올수있나 없나 확인
	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin") ){
		//강제로 페이지 이동
		out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
	}
	
	//한글처리 및 정보 받아오기 
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
		rs.next(); //1건 데이터가 있다면 전제조건
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
								<!--  왜 text로 안하고, input 을 썻지? 근데 왜 readonly? 했을까??  -->
								<!--  text 값은 서버로 못가져감 . input 으로 만들어야 폼에서 액션할때  아이디 값을 가져 갈수 있게함 -->
								<!--  즉, 서버로 보내고 싶은데 편집은 못하게 하려면 input 태그에 readonly 해주면 된다  -->
								  	<input type="text" name="id" value="<%=rs.getString(1)%>" readonly>
								</td>
							</tr>
							<tr>
								<td>비번</td><!-- 이건 그냥 text 라서 보기만 할수 잇음 -->
								<td><%= rs.getString(2) %></td>							</tr>
							<tr>
								<td>이름</td>
								<td><!--  input 태그로 줘서 입력이 가능하게 함  -->
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
								<td><!-- 원래 DB 의 값을 가져와서  [수정] 버튼을 눌렀을대 기존정보에 체크되어있게 함  -->
									[<%=rs.getString(5) %>]
									<input type="radio" name="gender" id="gender" value="여" 
									<%if (rs.getString(5).equals("여")){ %>checked<%}%>>여자
									<!-- 만약에 내가 가져온 값이 여라는 문자면 checked 라는 속성을 인풋태그에 붙여서 클라이언트한테 보낼거얌-->
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.regex.Matcher"%>
<%@ page import="java.util.regex.Pattern"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="javax.servlet.ServletResponse"%>
<%@ page import="javax.servlet.http.*"%>

<%
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("userId"); //아이디
	String checkId = "^[a-zA-z0-9]{4,12}$"; //아이디 패스워드 같이, 영문 대소문자 숫자 4~12자리
	Pattern p_uid = Pattern.compile(checkId);
	Matcher m_uid = p_uid.matcher(uid);

	if (!m_uid.matches()) {
		script(response, "아이디는 영문 대소문자와 숫자 4~12자리로 입력해야 합니다.");
	}

	//---------------------------------

	String uname = request.getParameter("userName"); //이름
	String checkName = "^[가-힣]{2,4}$"; //한글이름 2~4글자이면 됨
	Pattern p_uname = Pattern.compile(checkName);
	Matcher m_uname = p_uname.matcher(uname);

	if (!m_uname.matches()) {
		script(response, "이름은 한글 2~4자리로 입력해야 합니다.");
	}

	//---------------------------------

	String pwd = request.getParameter("userPass"); //비번

	//비밀번호 검증
	String checkpwd = "^[a-zA-z0-9]{4,12}$";
	Pattern p_pwd = Pattern.compile(checkpwd);
	Matcher m_pwd = p_pwd.matcher(pwd);

	if (!m_pwd.matches()) {
		script(response, "비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야 합니다.");
		return;
	}

	String pwcheck = request.getParameter("userPassCheck"); //비번확인
	Pattern p_pwcheck = Pattern.compile(pwd);

	if (!pwd.equals(pwcheck)) {
		script(response, "비밀번호가 일치하지 않습니다.");
		return;
	}

	//---------------------------------

	String userEmail = request.getParameter("userEmail");
	String regUserEmail = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
	Pattern p_userEmail = Pattern.compile(regUserEmail);
	Matcher m_userEmail = p_userEmail.matcher(userEmail);

	if (!m_userEmail.matches()) {
		script(response, "*@*.*) 이메일 양식에 맞춰서 입력해야 합니다.");
		return;
	}

	//---------------------------------

	String userSsn1 = request.getParameter("userSsn1");
	String regUserSsn1 = "[0123456789]{6}";
	Pattern p_userSsn1 = Pattern.compile(regUserSsn1);
	Matcher m_userSsn1 = p_userSsn1.matcher(userSsn1);

	String userSsn2 = request.getParameter("userSsn2");
	String regUserSsn2 = "[0123456789]{7}";
	Pattern p_userSsn2 = Pattern.compile(regUserSsn2);
	Matcher m_userSsn2 = p_userSsn2.matcher(userSsn2);

	if (!(m_userSsn1.matches() && m_userSsn2.matches())) {
		script(response, "주민등록번호 양식에 맞춰서 입력해야 합니다.");
		return;
	}

	//---------------------------------

	String userPhone = request.getParameter("userPhone");
	String regUserPhone = "^01(?:0|1|[6-9])[.-]?(\\d{3}|\\d{4})[.-]?(\\d{4})$";
	Pattern p_userPhone = Pattern.compile(regUserPhone);
	Matcher m_userPhone = p_userPhone.matcher(userPhone);
	if (!m_userPhone.matches()) {
		script(response, "핸드폰 번호 양식에 맞춰서 입력해야 합니다..(OOO-OOOO-OOOO, -는 생략가능)");
		return;
	}

	//---------------------------------

	String[] hobby = request.getParameterValues("hobby");
	if (request.getParameterValues("hobby") == null) {
		script(response, "취미를 1개이상 선택해주세요.");
		return;
	}

	//---------------------------------

	String year = request.getParameter("year");
	String regYear = "([1]{1}[9]{1}[0-9]{1}[0-9]{1})";
	Pattern p_year = Pattern.compile(regYear);
	Matcher m_year = p_year.matcher(year);

	if (!m_year.matches()) {
		script(response, "OOOO, 생년월일 양식에 맞춰서 입력해야 합니다.");
		return;
	}

	//---------------------------------

	String gender = request.getParameter("gender"); //성별
	String month = request.getParameter("month"); //월
	String day = request.getParameter("day"); //일
%>

<%!public void script(HttpServletResponse response, String str) throws Exception {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('" + str + "');");
		script.println("location.href = history.back()");
		script.println("</script>");
		script.close();
	}%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
</script>
</head>
<body>

	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>패스워드</th>
					<th>성별</th>
					<th>이메일</th>
					<th>주민번호</th>
					<th>핸드폰번호</th>
					<th>취미</th>
					<th>생년월일</th>
				</tr>
			</thead>
			<tbody>
				<tr class="table-primary">
					<td><%=uid%></td>
					<td><%=uname%></td>
					<td><%=pwd%></td>
					<td><%=gender%></td>
					<td><%=userEmail%></td>
					<td><%=userSsn1%>-<%=userSsn2%></td>
					<td><%=userPhone%></td>
					<td>
						<%
							for (int i = 0; i < hobby.length; i++) {
								out.print("<b>" + hobby[i] + "<b><br>");
							}
						%>
					</td>
					<td><%=year%>-<%=month%>-<%=day%></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>
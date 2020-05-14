<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	글쓴이 :${param.name}<br>
	제목:${param.title}<br>
	파일_1: ${param.filename1} / 원본파일명 :${param.orifilename1}<br>
	파일_2: ${param.filename2} / 원본파일명 :${param.orifilename2}<br>
	
	<hr>
	<h3>다운로드(특정 경로 저장)</h3> <!-- 다운로드는 이런식으로 프로그램코드로 구현해야함-->
	<a href="Ex04_download.jsp?file_name=${param.filename1}">${param.filename1}</a>
	<hr>
	<a href="Ex04_download.jsp?file_name=${param.filename2}">${param.filename2}</a>
	
	<h3>웹 브라우져 보기</h3>
	<a href="upload/${param.filename1}">브라우져 보기</a>
	<a href="upload/${param.filename2}">브라우져 보기</a> <!-- 다운이 아닌 브라우저가 이미지를 보는것 -->
	<!-- 브라우저가 해석할수 없는 확장자는 다운하긴 하는데 코드로 구현한게 아님  ex) .zip-->
	<img src="upload/${param.filename1}"> 
	<!-- 등록과 반대로 업로드한 이미지는이렇게만 적어줘도 배포경로에 있는 경로로 자동 매핑해줌) ★★★★★ -->
</body>
</html>







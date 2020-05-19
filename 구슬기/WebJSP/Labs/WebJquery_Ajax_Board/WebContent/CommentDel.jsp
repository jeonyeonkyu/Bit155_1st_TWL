<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jquery.ajax.comment.CommentDAO" %>
<%@ page import="com.jquery.ajax.comment.CommentVO" %>
<%@ page import ="java.util.List" %>
<%@ page import="net.sf.json.JSONArray" %>

<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	int bbsSeq = Integer.parseInt(request.getParameter("bbsSeq"));
	//System.out.println(bbsSeq + " / " + comment);
	
	CommentDAO dao = CommentDAO.getInstance();
	
	//덧글삭제
	//dao.addComment(comment);
	dao.removeComment(seq); //입력학 시퀀스 값을 갖기ㅗ 데이터에서 빼는 작업 
	List<CommentVO> commentlist = dao.getCommentList(bbsSeq);
	
	//JSON 데이터
	JSONArray jsonarray = JSONArray.fromObject(commentlist); //제이슨 어레이로 만드러엇 23번 줄에서 던진다 
%>
<%=jsonarray %>












<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jquery.ajax.comment.CommentDAO" %>
<%@ page import="com.jquery.ajax.comment.CommentVO" %>
<%@ page import ="java.util.List" %>
<%@ page import="net.sf.json.JSONArray" %>

<%
	String comment = request.getParameter("comment");
	int bbsSeq = Integer.parseInt(request.getParameter("bbsSeq"));
	//System.out.println(bbsSeq + " / " + comment);
	
	CommentDAO dao = CommentDAO.getInstance();
	
	//덧글등록
	dao.addComment(comment);
	List<CommentVO> commentlist = dao.getCommentList(bbsSeq);
	
	//JSON 데이터
	JSONArray jsonarray = JSONArray.fromObject(commentlist);     //json Array 로 만들어서 던진다 
	//JSON 날짜형식 (DATE 형식 안먹는다) String 으로 바꾸는 작업 해줘야함 
%>
<%=jsonarray %>












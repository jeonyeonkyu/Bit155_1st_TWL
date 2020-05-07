<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	//http://localhost:8090/WebClient_JavaScript_Ajax/Ex03_Server_param.jsp?no=2 파라미터로 이렇게 넣으면 각 인덱스 값이 페이지로 보여진다. 처음엔 동기식
	String strEx="";
	String[][] strArray = {
							{"컴퓨터","노트북","테블릿"},
							{"java" , "jquery" , "oracle"},
							{"AA" , "BB" , "CC"},
	                      };
	for(int i = 0 ; i < strArray.length;i++){
		if(i < strArray.length -1){
			strEx += strArray[no][i] + ",";
		}else{
			strEx += strArray[no][i];
		}
	}
%>
<%=strEx%>
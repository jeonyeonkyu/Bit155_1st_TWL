<!-- 흐름 필수 ★★★★★★★★★★★★★★★★★★★  -->



<%@page import="kr.or.bit.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	//request.getParameter.... 쫙받고
	//Board board = new Board();
	//board.setName = 값..
	
%>
<!-- jsp유지보수 회사는  new 객체를 못만듬(스프링 전 한떄는 굉장히 많이쓰임,  --> 
<!-- 지금은 안쓰지만 한때는 시대를 풍미  -->
<!-- 데이터 한번에 받음  -->
<!-- useBean : 객체를 만들어줌, class에 명시된 객체를 만들어줌 -->
<jsp:useBean id="board" class="kr.or.bit.dto.Board"> 
	<!-- 클라이언트가 서버로 보낸 모든 값들을 dto에 세팅해줌 -->
	<jsp:setProperty property="*" name="board"/>
</jsp:useBean>

<%
	//out.print(board.getSubject() + "<br>");
	//out.print(board.getWriter() + "<br>");
	//단 jsp:useBean 성립  jsp:setProperty 자동화 ... 전제 ...
	//input태그의 name값들이 BoardDto 객체의 멤버필드명들과 동일해야 한다(이부분은 스프링에서도 똑같음)
	
	//이걸 유지하면 에러절대X
	//DB 컬럼명 == DTO memberfield == input태그의 name 속성명과 같다(자동화...)
	
	//write.jsp(클라이언트가 화면으로 받음) >> 처리하는 페이지는 writeok.jsp(서블릿이였다면 action.do)
	//>> DB 연결, insert ... >> DAO 객체 생성, 처리...(이것도 싫다)
	//>> Model1방식이라 할지라도 여기선 service만 노출하겠다. >> 업무 분담
	
	//jsp페이지에서는 dao몰라도됨 서비스만 알아도됨.
	BoardService service = BoardService.getInBoardService();
	int result = service.writeOk(board);
	
	//서블릿에서도 흐름은 같음
	//write.jsp 화면 >> 처리하는 부분은 writeok.jsp >> service 호출 >> dao 호출 >> DB 작업
	//>> return >> dao가 서비스에게 리턴 >> 서비스는 writeok에게 리턴 >> 결과처리 >> 이동(공통) >> redirect.jsp
			
			
	//이런코드를 할줄 아아야됨!!
	//반복적인 코드를 빼야됨(redirect.js에있는 스크립트 코드 반복x)
	//값을 세팅만 해주고 redirect.jsp에 보내주면 거기서 페이지를 이동할게~~
	String msg = "";
	String url = "";
	if(result > 0){
		msg = "insert success";
		url = "board_list.jsp";
	}else {
		msg = "insert fail";
		url = "board_write.jsp";
	}
	
	request.setAttribute("board_msg", msg);
	request.setAttribute("board_url", url);

%>


<jsp:forward page="redirect.jsp"></jsp:forward>





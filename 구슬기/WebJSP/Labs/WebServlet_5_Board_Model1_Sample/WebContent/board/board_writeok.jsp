<%@page import="kr.or.bit.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	
//writeok 는 사실 request.getParameter();로 넘어오는 파라메터 갯수만큼 쭉 작업을하고
//Board board = new Board();
//board.setName = 값  이렇게만 해도 20줄가량이 나오지만 아래 jsp코드로 대체함 
%>
<jsp:useBean id="board" class="kr.or.bit.dto.Board">
	<jsp:setProperty property="*" name="board" /><!--  요세줄의 코드가 보드라는 객체를 만든다  -->
</jsp:useBean><!-- usebean 사용하면 객체가 만들어지는데 class=""안의 객체가 만들어진다  -->

<%
	//out.print(board.getSubject() + "<br>");
	//out.print(board.getWriter() + "<br>");
	//단 jsp:useBean 태그가 jsp:setProperty 자동화를 하려면 전제가 있다. 
	//<input name="subject"...  값이 Board DTO 객체 memberfield 동일 해야함 
	//dto 를 만들때는 db의 컬럼명과 똑같이 만드세요.
	
	//DB  컬럼명 == DTO memberfield == input name 속성명과 같다 (요렇게 성립이 되면 자동화를 보장한다  ) 
	//★★★★★★★★★★★★★★★★★★
	
	//write.jsp(클라이언트 화면)  >> 처리 writeok.jsp >> DAO 객체 생성, 처리 ....(x)
	//write.jsp(클라이언트 화면)  >> 처리 writeok.jsp >> service 만 노출!   
	// jsp 페이지에서는 dao 가 뭔지몰라도 상관 x ,  업무를 분담하는 것 
	
	BoardService service = BoardService.getInBoardService();
	int result = service.writeOk(board);
	
	
	//write.jsp 화면 >> writeok.jsp 처리 >> service >> dao >> DB 작업 > return dao > return service > writeok.jsp 결과처리 >> 이동(공통)적인 부분은 >> redirect.jsp 만듦 
			//요청받고 던지고, 서비스 객체 만들고 결과를 받아서 redirect 에게 주고, 얘(redirect)가 어디로 갈지를 결정한다 
	//이러게 진행되니까 자기 다음거만 알면된다는 거임 
	
	//글씌기가 완료되면 목록으로 보냄
	String msg = "";
	String url ="";
	if(result> 0){
		msg ="insert success";
		url = "board_list.jsp";
	}else{
		msg ="insert fail";
		url = "board_write.jsp";
	}
	
	request.setAttribute("board_msg", msg);
	request.setAttribute("board_url", url);
	
	
%>
<jsp:forward page="redirect.jsp"></jsp:forward>


























package kr.or.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dto.Board;
import kr.or.bit.service.BoardService;

/**
 * Servlet implementation class controller
 */
@WebServlet("*.do")
public class controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public controller() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		try {
			doProcess(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	////////////////////////////////////////////////////////////////////////////////////////////
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		BoardService service = BoardService.getInBoardService();
		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html;charset=UTF-8");
		
		
		String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String command = requestURI.substring(contextPath.length());
    	
    	
    	System.out.println(requestURI);
    	System.out.println(contextPath);
    	System.out.println(command);
		String url ="";
		String msg="";
		
		if(command.equals("/board/delete.do")) { 
			String idx = request.getParameter("idx");
			String pwd = request.getParameter("pwd");
			
			
			int result =service.board_Delete(idx, pwd);
			
			if(result > 0){
				msg="delete success";
				url="board_list.jsp";
			}else{
				msg="delete fail";
				url="board_list.jsp";
			}
			System.out.println("여기오냐111>");
			request.setAttribute("board_msg",msg);
			request.setAttribute("board_url",url);
			
			System.out.println("여기오냐222>");
			
		
			
		}else if(command.equals("/board/editok.do")) {
			 
			String idx = request.getParameter("idx");
			  
			  if(idx == null || idx.trim().equals("")){
				  PrintWriter out = response.getWriter();
				  out.print("<script>");
				  	out.print("alert('글번호 입력 오류')");
				  	out.print("location.href='board_list.jsp'");
				  out.print("</script>");
			  }
			  
			  int result = service.board_Edit(request);
			  
				if(result > 0){
					msg="edit success";
					url="board_list.jsp";
				}else{
					msg="edit fail";
					url="board_edit.jsp?idx="+idx;
				}
				
				request.setAttribute("board_msg",msg);
				request.setAttribute("board_url",url);
				
			
		}else if(command.equals("/board/board_content.do")) {
			String writer = request.getParameter("reply_writer");
			String content = request.getParameter("reply_content");
			String pwd = request.getParameter("reply_pwd");
			String idx_fk = request.getParameter("idx");
			String userid = "empty";

			int result = service.replyWrite(Integer.parseInt(idx_fk), writer, userid, content, pwd);
		
		    
		    if(result > 0){
		    	msg ="댓글 입력 성공";
		    	url ="board_content.jsp?idx="+idx_fk;
		    }else{
		    	msg="댓글 입력 실패";
		    	url="board_content.jsp?idx="+idx_fk;
		    }
		    
		    request.setAttribute("board_msg",msg);
		    request.setAttribute("board_url", url);
		}else if(command.equals("/board/board_rewriteok.do")) {
			
			
			Board board = new Board();
			
			String writer = request.getParameter("writer");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String email = request.getParameter("email");
			String homepage = request.getParameter("homepage");
			String filename = request.getParameter("filename");
			String pwd = request.getParameter("pwd");
			
			System.out.println(writer);
			
			   board.setWriter(writer);
		       board.setSubject(subject);
		       board.setContent(content);
		       board.setEmail(email);
		       board.setHomepage(homepage);
		       board.setFilename(filename);
		       board.setPwd(pwd);
			
		   	System.out.println(writer);
//			String cpage = request.getParameter("cp");//current page
//			String pagesize = request.getParameter("ps"); //pagesize
			
			
			
			int result = service.rewriteok(board);
			if(result> 0){
				msg ="rewrite insert success";
				url = "board_list.jsp"; //성공하면 목록
			}else{
				msg ="insert fail";
				url = "board_write.jsp?idx="+board.getIdx();//실패하면 원본글에대한 글쓰기로 간다 
			}
			
			request.setAttribute("board_msg", msg);
			request.setAttribute("board_url", url);
			
		}
		
		
		
		RequestDispatcher dis = request.getRequestDispatcher(url);
		dis.forward(request, response);
		
		
	}


}


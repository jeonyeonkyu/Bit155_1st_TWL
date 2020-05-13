package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dto.Board;
import kr.or.bit.service.BoardService;

@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Controller() {
        super();
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 BoardService service = BoardService.getInBoardService();

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String command = requestURI.substring(contextPath.length());
		
    	 String msg="";
		    String url="";
    	  if(command.equals("/board/writeok.do")) { 
    		  	String writer = request.getParameter("writer");
    			String subject = request.getParameter("subject");
    			String content = request.getParameter("content");
    			String email = request.getParameter("email");
    			String homepage = request.getParameter("homepage");
    			String filename = request.getParameter("filename");
    			String pwd = request.getParameter("pwd"); 
    			
    			
    			request.setAttribute("writer", writer);
    			request.setAttribute("subject", subject);
    			request.setAttribute("content", content);
    			request.setAttribute("email", email);
    			request.setAttribute("homepage", homepage);
    			request.setAttribute("filename", filename);
    			request.setAttribute("pwd", pwd);
    			
    	         
    	         Board board = new Board();
    	         int result = 0;
				try {
					result = service.writeOk(board);
				} catch (Exception e) {
					e.printStackTrace();
				}
    	         
			   
			    if(result > 0){
			    	msg ="insert success";
			    	url ="board_list.jsp";
			    }else{
			    	msg="insert fail";
			    	url="board_write.jsp";
			    }
			    
			    request.setAttribute("board_msg",msg);
			    request.setAttribute("board_url", url);
    	         
    	      
    	         
    	      }
    	 	RequestDispatcher dis = request.getRequestDispatcher(url);
        	
        	//5. forward(request 객체의 주소값을 공유)
        	dis.forward(request, response);
	}
}

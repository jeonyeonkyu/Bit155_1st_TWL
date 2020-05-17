package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardBean;
import model.BoardDAO;

@WebServlet("/BoardDeleteCon.do")
public class BoardDeleteCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reqPro(request, response);
	}

	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//글 삭제이기에 글번호를 입력
		int num =Integer.parseInt(request.getParameter("num"));
		
		//데이터베이스에 접근하여 하나의 게시글을 리넡하는 메소드
		BoardDAO bdao =new BoardDAO();
		//빈클래스 타입으로 리턴
		BoardBean bean =bdao.getOuneUpdateBoard(num);//조회수를 증가시키지 않은 메소드
		
		request.setAttribute("bean", bean);
		
		RequestDispatcher dis =request.getRequestDispatcher("BoardDeleteForm.jsp");
		dis.forward(request, response);
		
	}
	
	
	
}

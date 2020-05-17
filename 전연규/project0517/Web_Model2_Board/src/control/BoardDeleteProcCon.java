package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;

@WebServlet("/BoardDeleteProcCon.do")
public class BoardDeleteProcCon extends HttpServlet {

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
		
		//사용자로 부터 넘어오 데이터 3개를 받음줌
		int num= Integer.parseInt(request.getParameter("num"));
		String password=request.getParameter("password");
		String pass =request.getParameter("pass");
		
		//패스워드가 같을 경우에는 데이터를 삭제 하고 리스트화면을 보여줌
		if(password.equals(pass)){
			BoardDAO bdao =new BoardDAO();
			bdao.deleteBoard(num);
			
			RequestDispatcher dis =request.getRequestDispatcher("BoardListCon.do");
			dis.forward(request, response);
		}else{
			request.setAttribute("msg", "delete");
			RequestDispatcher dis =request.getRequestDispatcher("BoardListCon.do");
			dis.forward(request, response);
		}
	}
	
	
	

}



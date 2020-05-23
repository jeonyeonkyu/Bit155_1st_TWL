package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.LCalendar;
import Service.add;
import Service.delete;
import Service.edit;
import Service.input;
import Service.list;

@WebServlet("*.do")
public class FrontServletController extends HttpServlet {
	
    public FrontServletController() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage = null;
		LCalendar lc = null;
		request.setCharacterEncoding("UTF-8");

		// 1.��û�ޱ�
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		
		System.out.println("command : " + command);

		// 2.��û�Ǵ�
		if (command.equals("/list.do")) {
			lc = new list();
			lc.execute(request, response);
			System.out.println("�������!!");
			//viewPage = "index.html";
		}else if(command.equals("/input.do")) {
			lc = new input();
			lc.execute(request, response);
			viewPage = "index.jsp";
			// 3.�������

			System.out.println("viewPage : " + viewPage);
			RequestDispatcher dis = request.getRequestDispatcher(viewPage);

			// 5.������ ����
			dis.forward(request, response);
		}else if(command.equals("/add.do")) {
			lc = new add();
			lc.execute(request, response);
		}else if(command.equals("/delete.do")) {
			lc = new delete();
			lc.execute(request, response);
		}else if(command.equals("/edit.do")) {
			lc = new edit();
			lc.execute(request, response);
		}


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

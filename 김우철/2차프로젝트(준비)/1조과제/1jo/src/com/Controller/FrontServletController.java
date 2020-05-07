package com.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Service.BListService;
import com.Service.MJoinService;
import com.Service.MLoginService;
import com.Service.MLogoutService;
import com.Service.Service;

@WebServlet("*.do")
public class FrontServletController extends HttpServlet {

	public FrontServletController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String viewPage = null;
		Service service = null;
		request.setCharacterEncoding("UTF-8");

		// 1.요청받기
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());

		// 2.요청판단
		if (command.equals("/join.do")) {
			service = new MJoinService();
			service.execute(request, response);
			viewPage = "main.jsp";
		} else if (command.equals("/login.do")) {
			service = new MLoginService();
			service.execute(request, response);
			viewPage = "main.jsp";
		} else if (command.equals("/logout.do")) {
			service = new MLogoutService();
			service.execute(request, response);
			viewPage = "main.jsp";
		} else if (command.equals("/boardList.do")) {
			service = new BListService();
			service.execute(request, response);
			viewPage = "boardList.jsp";
		}

		// 3.결과저장

		// 4.view지정
		RequestDispatcher dis = request.getRequestDispatcher(viewPage);

		// 5.데이터 전달
		dis.forward(request, response);
	}

}

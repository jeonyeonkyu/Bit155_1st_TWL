package kr.or.bit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.service.EmpChartService;
import kr.or.bit.service.EmpDetailService;
import kr.or.bit.service.EmpListService;

@WebServlet("*.do")
public class FrontEmpController extends HttpServlet {

	public FrontEmpController() {
		super();
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url_Command = requestURI.substring(contextPath.length());

		Action action = null;
		ActionForward forward = null;

		System.out.println("url_Command : " + url_Command);

		if (url_Command.equals("/EmpTable.do")) {
			action = new EmpListService();
			forward = action.execute(request, response);
			forward.setPath("/WEB-INF/views/EmpTable.jsp");
		} else if (url_Command.equals("/detailView.do")) { // 회원관리 페이지 이동
			action = new EmpDetailService();
			forward = action.execute(request, response);

		} else if (url_Command.equals("/chartView.do")) { // 회원관리 페이지 이동
			System.out.println("elseif는 타니?");
			forward = new ActionForward();
			forward.setPath("/WEB-INF/views/chartView.jsp");
			
		} else if (url_Command.equals("/chartViewok.do")) { // 회원관리 페이지 이동
			System.out.println("elseif는 타니okokokokok?");
			action = new EmpChartService();
			forward = action.execute(request, response);
		}

		// 4. 뷰 지정하기
		// 5. forward(request 객체의 주소값을 공유)
		// RequestDispatcher dis = request.getRequestDispatcher(viewpage);
		if (forward != null) {
			RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
			dis.forward(request, response);
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

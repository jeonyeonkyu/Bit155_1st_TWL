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
import kr.or.bit.service.EmpListService;
import kr.or.bit.service.EmpLoginService;
import kr.or.bit.service.EmpLogoutService;
import kr.or.bit.service.EmpSearchService;

@WebServlet("*.do")
public class FrontEmpController extends HttpServlet {

	public FrontEmpController() {
		super();
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url_Command = requestURI.substring(contextPath.length());

		Action action = null;
		ActionForward forward = null;

		if (url_Command.equals("/Main.do")) { // 메인페이지 이동 : UI
			forward = new ActionForward();
			forward.setPath("/index.jsp");
		} else if (url_Command.equals("/login.do")) { // 로그인 : UI + 로직
			action = new EmpLoginService();
			forward = action.execute(request, response);
		} else if(url_Command.equals("/logout.do")) { // 로그아웃 : UI + 로직
			action = new EmpLogoutService();
			forward = action.execute(request, response);
		} else if(url_Command.equals("/EmpTable.do")) { //전체조회
			action = new EmpListService();
			forward = action.execute(request, response);
		} else if(url_Command.equals("/search.do")) { //전체조회
			System.out.println("컨트로러입니다~");
			action = new EmpSearchService();
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
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}

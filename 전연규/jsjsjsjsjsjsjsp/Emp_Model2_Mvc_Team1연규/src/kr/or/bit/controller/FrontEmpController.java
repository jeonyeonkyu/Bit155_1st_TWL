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
import kr.or.bit.service.EmpAddService;
import kr.or.bit.service.EmpDeleteService;
import kr.or.bit.service.EmpDetailService;
import kr.or.bit.service.EmpEditService;
import kr.or.bit.service.EmpListService;

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
		System.out.println(request.getMethod());

		if(url_Command.equals("/EmpTable.do")) {
			action = new EmpListService();
			forward = action.execute(request, response);
			forward.setPath("/WEB-INF/views/EmpTable.jsp");
		}
		else if (url_Command.equals("/detailView.do")) { // 회원관리 페이지 이동
			System.out.println("elseif는 타니?");
			action = new EmpDetailService();
			forward = action.execute(request, response);
		} else if (url_Command.equals("/")) { // 회원관리 페이지 이동
			
		} else if(url_Command.equals("/boardCustomWrite.do")) { //등록
			forward = postEmpAdd(request,response);
		}else if(url_Command.equals("/delete.do")) { //삭제
			forward = postEmpDelete(request,response);
		}else if(url_Command.equals("/boardCustomEdit.do")) { //수정
			forward = postEmpEdit(request, response);
			forward.setPath("boardCustomEdit.jsp");
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
	
	private ActionForward getEmpTableList(HttpServletRequest request, HttpServletResponse response) {
		
		Action action = new EmpListService();
		ActionForward forward = action.execute(request, response);
		return forward;
	}
	
	private ActionForward postEmpAdd(HttpServletRequest request, HttpServletResponse response) {
		Action action = new EmpAddService();
		System.out.println("EmpAddService 실행");
		ActionForward forward = action.execute(request, response);
		return forward;
	}

	private ActionForward postEmpDelete(HttpServletRequest request, HttpServletResponse response) {
		Action action = new EmpDeleteService();
		System.out.println("EmpDeleteService 실행");
		ActionForward forward = action.execute(request, response);
		return forward;
	}
	
	private ActionForward postEmpEdit(HttpServletRequest request, HttpServletResponse response) {
		Action action = new EmpEditService();
		System.out.println("EmpEditService 실행");
		ActionForward forward = action.execute(request, response);
		return forward;
	}
}

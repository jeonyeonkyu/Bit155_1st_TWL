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
import kr.or.bit.service.EmpChartService;
import kr.or.bit.service.EmpDeleteService;
import kr.or.bit.service.EmpDetailService;
import kr.or.bit.service.EmpEditOkService;
import kr.or.bit.service.EmpEditService;
import kr.or.bit.service.EmpFileUploadService;
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

		if (url_Command.equals("/Main.do")) { 
			forward = new ActionForward();
			forward.setPath("/index.jsp");
			
		} else if (url_Command.equals("/login.do")) { 
			System.out.println("Login..");
			action = new EmpLoginService();
			forward = action.execute(request, response);
			
		} else if(url_Command.equals("/logout.do")) { 
			action = new EmpLogoutService();
			forward = action.execute(request, response);
			
		} else if(url_Command.equals("/EmpTable.do")) { 
			action = new EmpListService();
			forward = action.execute(request, response);
			
		} else if(url_Command.equals("/search.do")) { 
			action = new EmpSearchService();
			forward = action.execute(request, response);
			
		}else if(url_Command.equals("/EmpWrite.do")) { 
			forward = new ActionForward();
			forward.setPath("/WEB-INF/views/EmpWrite.jsp");
			
		}else if(url_Command.equals("/EmpWriteok.do")) { 
			action = new EmpAddService();
			forward = action.execute(request, response);
			
		}else if(url_Command.equals("/delete.do")) { 
			action = new EmpDeleteService();
			forward = action.execute(request, response);
			
		}else if(url_Command.equals("/detailView.do")) {
			action = new EmpDetailService();
			forward = action.execute(request, response);
			
		}else if(url_Command.equals("/update.do")) { 
			System.out.println("화면이동 + 로직");
			action = new EmpEditService();
			forward = action.execute(request, response);
			
		}else if(url_Command.equals("/updateok.do")) { 
			System.out.println("수정!!");
			action = new EmpEditOkService();
			forward = action.execute(request, response);
			
		}else if(url_Command.equals("/chartView.do")) { 
			forward = new ActionForward();
			forward.setPath("/WEB-INF/views/chartView.jsp");
			
		}else if(url_Command.equals("/chartViewok.do")) { 
			action = new EmpChartService();
			forward = action.execute(request, response);
			
		}else if(url_Command.equals("/upload.do")) { 
			action = new EmpFileUploadService();
			forward = action.execute(request, response);
			
		}
		
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

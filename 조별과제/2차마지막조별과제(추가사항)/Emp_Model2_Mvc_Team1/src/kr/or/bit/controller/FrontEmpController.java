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
import kr.or.bit.service.EmpDataTableService;
import kr.or.bit.service.EmpDeleteService;
import kr.or.bit.service.EmpDeptNoListService;
import kr.or.bit.service.EmpDetailService;
import kr.or.bit.service.EmpEditOkService;
import kr.or.bit.service.EmpEditService;
import kr.or.bit.service.EmpFileUploadService;
import kr.or.bit.service.HieTableService;
import kr.or.bit.service.HieWriteService;
import kr.or.bit.service.EmpJobListService;
import kr.or.bit.service.EmpListService;
import kr.or.bit.service.EmpLoginService;
import kr.or.bit.service.EmpLogoutService;
import kr.or.bit.service.EmpSearchService;
import kr.or.bit.service.HieDeleteService;
import kr.or.bit.service.HieDetailService;

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

		if (url_Command.equals("/Main.do")) { // ���������� �̵� : UI
			forward = new ActionForward();
			forward.setPath("/index.jsp");
			
		} else if (url_Command.equals("/login.do")) { // �α��� : UI + ����
			System.out.println("여긴오냐?!!");
			action = new EmpLoginService();
			forward = action.execute(request, response);
			
		} else if(url_Command.equals("/logout.do")) { // �α׾ƿ� : UI + ����
			action = new EmpLogoutService();
			forward = action.execute(request, response);
			
		} else if(url_Command.equals("/EmpTable.do")) { //��ü��ȸ
			action = new EmpListService();
			forward = action.execute(request, response);
			
		} else if(url_Command.equals("/search.do")) { //��ü��ȸ
			action = new EmpSearchService();
			forward = action.execute(request, response);
			
		}else if(url_Command.equals("/EmpWrite.do")) { //��ü��ȸ
			forward = new ActionForward();
			forward.setPath("/WEB-INF/views/EmpWrite.jsp");
			
		}else if(url_Command.equals("/EmpWriteok.do")) { //��ü��ȸ
			action = new EmpAddService();
			forward = action.execute(request, response);
			
		}else if(url_Command.equals("/delete.do")) { //��ü��ȸ
			action = new EmpDeleteService();
			forward = action.execute(request, response);
			
		}else if(url_Command.equals("/detailView.do")) {
			action = new EmpDetailService();
			forward = action.execute(request, response);
			
		}else if(url_Command.equals("/update.do")) { //화면이동 + 로직
			action = new EmpEditService();
			forward = action.execute(request, response);
			
		}else if(url_Command.equals("/updateok.do")) { //화면 + 로직 
			action = new EmpEditOkService();
			forward = action.execute(request, response);
			
		}else if(url_Command.equals("/chartView.do")) { //화면 + 로직 
			forward = new ActionForward();
			forward.setPath("/WEB-INF/views/chartView.jsp");
			
		}else if(url_Command.equals("/chartViewok.do")) { //화면 + 로직 
			action = new EmpChartService();
			forward = action.execute(request, response);
			
		}else if(url_Command.equals("/upload.do")) { //화면 + 로직 
			action = new EmpFileUploadService();
			forward = action.execute(request, response);
		}else if(url_Command.equals("/jobList.do")) { //화면 + 로직 
			action = new EmpJobListService();
			forward = action.execute(request, response);
		}else if(url_Command.equals("/deptNoList.do")) { //화면 + 로직 
			action = new EmpDeptNoListService();
			forward = action.execute(request, response);
		}else if(url_Command.equals("/dataTable.do")) { //화면 + 로직 )
			action = new EmpDataTableService();
			forward = action.execute(request, response);
		}else if(url_Command.equals("/HieEmpTable.do")) { //화면 + 로직 )
			action = new HieTableService();
			forward = action.execute(request, response);
		}else if(url_Command.equals("/HieEmpWrite.do")) { //화면 )
			forward = new ActionForward();
			forward.setPath("/WEB-INF/views/HieEmpWrite.jsp");
		
		}else if(url_Command.equals("/HieEmpWriteok.do")) { //화면 + 로직 )
			action = new HieWriteService();
			forward = action.execute(request, response);
		}else if(url_Command.equals("/HieEmpDetail.do")) { //화면 + 로직 )
			action = new HieDetailService();
			forward = action.execute(request, response);
		}else if(url_Command.equals("/HieEmpDelete.do")) { //화면 + 로직 )
			action = new HieDeleteService();
			forward = action.execute(request, response);
		}
	
	
		
		
		// 4. �� �����ϱ�
		// 5. forward(request ��ü�� �ּҰ��� ����)
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

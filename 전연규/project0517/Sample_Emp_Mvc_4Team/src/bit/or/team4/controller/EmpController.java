package bit.or.team4.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bit.or.team4.action.Action;
import bit.or.team4.action.ActionForward;
import bit.or.team4.service.AddMemberOkAction;
import bit.or.team4.service.AdminLoginAction;
import bit.or.team4.service.AjaxUploadImage;
import bit.or.team4.service.ChartAction;
import bit.or.team4.service.DeleteEmpAction;
import bit.or.team4.service.DeleteEmpCheckAction;
import bit.or.team4.service.EditEmpAction;
import bit.or.team4.service.EditEmpOkAction;
import bit.or.team4.service.LogoutAction;
import bit.or.team4.service.ShowEmpListAction;

@MultipartConfig(
		location = "C:\\FrontendBackend\\WebJSP\\JSPLab\\Toy_Project_EMP\\WebContent\\assets\\uploads",
		maxFileSize = -1,
		maxRequestSize = -1,
		fileSizeThreshold = -1
)
@WebServlet("*.do")
public class EmpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public EmpController() {
        super();
    }
    
    /**
     * @param request
     * @param response
     */
    private void doProcess(HttpServletRequest request, HttpServletResponse response) {
    	response.setContentType("text/html;charset=UTF-8");
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String url_Command = requestURI.substring(contextPath.length());
		HttpSession session =  request.getSession();

    	ActionForward forward = null;
    	Action action = null;
    	try {
    		if(url_Command.equals("/login.do")){
        		action = new AdminLoginAction();
        		forward = action.execute(request, response);
    		}else if(url_Command.equals("/GoHome.do")) {
        		forward = new ActionForward();
        		forward.setRedirect(false);
        		forward.setPath("/index.jsp");
    		}else  if(url_Command.equals("/ShowEmpList.do")) { //사원목록 메뉴
    			
    				action = new ShowEmpListAction();
        			forward = action.execute(request, response);
        		
    		}else if(url_Command.equals("/DeleteEmp.do")) {
        		action = new DeleteEmpAction();
        		forward = action.execute(request, response);
    		}else if(url_Command.equals("/EditEmp.do")) {
        		action = new EditEmpAction();
        		forward=action.execute(request,response);
    		}else if(url_Command.equals("/EditEmpOkAction.do")) {
    			action = new EditEmpOkAction();
        		forward=action.execute(request,response);
    		}else if(url_Command.equals("/AddMemberAction.do")) {
        		forward = new ActionForward();
        		forward.setRedirect(false);
        		forward.setPath("WEB-INF/emp/memberinsert.jsp");
    		}else if(url_Command.equals("/AddMemberOkAction.do")) {
    			action = new AddMemberOkAction();
        		forward=action.execute(request,response);
    		}else if(url_Command.equals("/DeleteEmpCheck.do")) {
    			action = new DeleteEmpCheckAction();
        		forward=action.execute(request,response);
    		}else if(url_Command.equals("/uploadImage.do")) {
    			action = new AjaxUploadImage();
    			forward = action.execute(request, response);
    		}else if(url_Command.equals("/loginRedirect.do")) {
        		forward = new ActionForward();
        		forward.setRedirect(false);
        		forward.setPath("WEB-INF/emp/login.jsp");
    		}else if(url_Command.equals("/Logout.do")) {
    			action = new LogoutAction();
    			forward = action.execute(request, response);
    		}else if(url_Command.equals("/viewchart.do")) {
        		forward = new ActionForward();
        		forward.setRedirect(false);
        		forward.setPath("WEB-INF/emp/chart.jsp");
    		}else if(url_Command.equals("/chart.do")) {
    			action = new ChartAction();
    			forward = action.execute(request, response);
    		}
    		
        	if(forward != null) {
        		if(forward.isRedirect()) { //true
        			response.sendRedirect(forward.getPath());
        		}else {
        			RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
        			dis.forward(request, response);
        		}
        	}
    	}catch(Exception e) {
    		
    	}
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}

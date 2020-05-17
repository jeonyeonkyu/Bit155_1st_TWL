package bit.or.team4.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bit.or.team4.action.Action;
import bit.or.team4.action.ActionForward;

public class AdminLoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		try {
			forward = new ActionForward();
			PrintWriter out =response.getWriter();
			if(id.equals("admin")) {
				if(pwd.equals("1004")) {
					session.setAttribute("userid", "admin");
					forward.setPath("/ShowEmpList.do");
				}else {
					System.out.println("틀린비번");
					forward.setPath("/loginRedirect.do");
				}
			}else {
				System.out.println("없는아이디");
				forward.setPath("/loginRedirect.do");
			}
		}catch(IOException e) {
			e.printStackTrace();
		} 
		return forward;
	}
	
}

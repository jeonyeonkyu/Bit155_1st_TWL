package bit.or.team4.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bit.or.team4.action.Action;
import bit.or.team4.action.ActionForward;

public class LogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		try {
			forward = new ActionForward();
			HttpSession session = request.getSession();
			session.invalidate();
			
			forward.setPath("/GoHome.do");
		}catch(Exception e) {
			
		}
		return forward;
	}

}

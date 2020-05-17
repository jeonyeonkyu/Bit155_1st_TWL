package bit.or.team4.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bit.or.team4.action.ActionForward;

public interface Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response);

}

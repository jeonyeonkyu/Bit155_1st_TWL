package bit.or.team4.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bit.or.team4.action.Action;
import bit.or.team4.action.ActionForward;
import bit.or.team4.dao.EmpDao;

public class DeleteEmpAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		try {
			forward = new ActionForward();
			EmpDao dao = new EmpDao();
			String empno = request.getParameter("empno");
			
			int result = dao.deleteEmp(empno);
			System.out.println(result);
			forward.setPath("/ShowEmpList.do");
		}catch(Exception e) {
			
		}
		return forward;
	}

}

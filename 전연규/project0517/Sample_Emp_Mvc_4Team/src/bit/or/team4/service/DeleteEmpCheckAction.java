package bit.or.team4.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bit.or.team4.action.Action;
import bit.or.team4.action.ActionForward;
import bit.or.team4.dao.EmpDao;
import bit.or.team4.dto.emp;

public class DeleteEmpCheckAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		EmpDao dao = null;
		int empno = Integer.parseInt(request.getParameter("empno"));

		try {
			forward = new ActionForward();
			dao=new EmpDao();
			emp emp = dao.getEmpByEmpno(empno);
			
  		  	request.setAttribute("emp",emp);

		  	System.out.println(empno);
  		  	forward.setPath("/WEB-INF/emp/memberdeletecheck.jsp");

		}catch(Exception e) {
			e.getStackTrace();
		}
		return forward;
	}
	
}

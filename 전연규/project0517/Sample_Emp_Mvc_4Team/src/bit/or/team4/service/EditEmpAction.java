package bit.or.team4.service;

import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bit.or.team4.action.Action;
import bit.or.team4.action.ActionForward;
import bit.or.team4.dao.EmpDao;
import bit.or.team4.dto.emp;

public class EditEmpAction implements Action{

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		int empno = Integer.parseInt(request.getParameter("empno"));
		EmpDao dao = null;
		try {
			dao=new EmpDao();
			emp emp = dao.getEmpByEmpno(empno);
			
  		  	request.setAttribute("emp",emp);

  		  	forward.setRedirect(false);
  		  	forward.setPath("/WEB-INF/emp/memberedit.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forward;
	}

}

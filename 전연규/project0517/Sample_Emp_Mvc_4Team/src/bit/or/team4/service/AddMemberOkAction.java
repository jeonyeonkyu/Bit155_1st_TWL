package bit.or.team4.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bit.or.team4.action.Action;
import bit.or.team4.action.ActionForward;
import bit.or.team4.dao.EmpDao;

public class AddMemberOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		/*pstmt.setInt(1, empno);
			pstmt.setString(2, ename);
			pstmt.setString(3, job);
			pstmt.setInt(4, mgr);
			pstmt.setString(5, hiredate);
			pstmt.setInt(6, sal);
			pstmt.setInt(7, comm);
			pstmt.setInt(8, deptno);*/
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			EmpDao dao = new EmpDao();
			int empno = Integer.parseInt(request.getParameter("empno"));
			String ename = request.getParameter("ename");
			String job = request.getParameter("job");
			int mgr = Integer.parseInt(request.getParameter("mgr"));
			String hiredate = sdf.format(date);
			int sal = Integer.parseInt(request.getParameter("sal"));
			int deptno = Integer.parseInt(request.getParameter("deptno"));
			int result = dao.insertEmp(empno, ename, job, mgr, hiredate, sal, deptno);
			
  		  	forward.setRedirect(false);
  		  	forward.setPath("/ShowEmpList.do");
  		  	System.out.println(result);
		} catch (Exception e) {
			e.getStackTrace();
		}

		return forward;
	}

}

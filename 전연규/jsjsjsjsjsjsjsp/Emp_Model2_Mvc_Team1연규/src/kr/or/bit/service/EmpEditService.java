package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.EmpDao;

public class EmpEditService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		String empno = request.getParameter("empno");
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		String mgr = request.getParameter("mgr");
		String hiredate = request.getParameter("hiredate");
		String sal = request.getParameter("sal");
		String comm = request.getParameter("comm");
		String deptno = request.getParameter("deptno");
		  
		  
		EmpDao dao = new EmpDao(); // POINT
		int result = 0;
		try {
			result = dao.updateEmp(Long.parseLong(empno), ename, job, Long.parseLong(mgr), hiredate,
					Long.parseLong(sal), Long.parseLong(comm), Long.parseLong(deptno));
		} catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		  
			String msg="";
			String url="";
			if(result > 0){
				msg="수정 성공";
				url="boardCustomEdit.jsp";
			}else{
				msg="수정 실패";
				url="boardCustomEdit.jsp";
			}
			
			request.setAttribute("emp_msg",msg);
			request.setAttribute("emp_url",url);

			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/redirect.jsp");

			return forward;
	}

}

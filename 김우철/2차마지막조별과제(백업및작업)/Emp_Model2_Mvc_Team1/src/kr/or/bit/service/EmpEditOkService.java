package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.EmpDao;

public class EmpEditOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		String mgr = request.getParameter("mgr");
		String hiredate = request.getParameter("hiredate");
		String sal = request.getParameter("sal");
		String comm = request.getParameter("comm");
		String deptno = request.getParameter("deptno");
		String empno = request.getParameter("empno");

		EmpDao dao = new EmpDao(); // POINT
		int result = 0;
		try {
			result = dao.updateOkEmp(Long.parseLong(empno), ename, job, Long.parseLong(mgr), hiredate,
					Long.parseLong(sal), Long.parseLong(comm), Long.parseLong(deptno));
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}

		String msg = "";
		String url = "";
		
		System.out.println("result : " + result);
		if (result > 0) {
			msg = "수정 성공";
			url = "EmpTable.do";
		} else {
			msg = "수정 실패";
			url = "update.do?empno=" + empno;
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		request.setAttribute("ename", ename);
		request.setAttribute("job", job);
		request.setAttribute("mgr", mgr);
		request.setAttribute("hiredate", hiredate);
		request.setAttribute("sal", sal);
		request.setAttribute("comm", comm);
		request.setAttribute("deptno", deptno);
		request.setAttribute("empno", empno);

		ActionForward forward = new ActionForward();
		forward.setPath("/WEB-INF/common/redirect.jsp");

		return forward;
	}

}

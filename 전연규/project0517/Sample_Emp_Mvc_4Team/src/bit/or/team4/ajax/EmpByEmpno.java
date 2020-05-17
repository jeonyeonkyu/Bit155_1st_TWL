package bit.or.team4.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bit.or.team4.dao.EmpDao;
import bit.or.team4.dto.emp;

/**
 * Servlet implementation class EmpByEmpno
 */
@WebServlet("/EmpByEmpno.do")
public class EmpByEmpno extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpByEmpno() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int empno = Integer.parseInt(request.getParameter("empno"));
		PrintWriter out = response.getWriter();
		EmpDao dao = null;
		emp emp = null;
		try {
			dao=new EmpDao();
			emp = dao.getEmplistByEmpno(empno);
			
  		  	request.setAttribute("emplist",emp);
  		  	System.out.println("emp" + emp);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String no = Integer.toString(emp.getEmpno());
		String empn = "<tr><td>" + no + "</td>";
		String ename = "<td>" + emp.getEname() + "</td>";
		String job = "<td>" + emp.getJob() + "</td>";
		String mgr = "<td>" + emp.getMgr() + "</td>";
		String hiredate = "<td>" + emp.getHiredate() + "</td>";
		String sal = "<td>" + emp.getSal() + "</td>";
		String comm = "<td>" + emp.getComm() + "</td>";
		String deptno = "<td>" + emp.getDeptno() + "</td>";
		
		System.out.println(no);
		System.out.println(empn);
		System.out.println(deptno);
		/*
		 * String link = "<td><a href=\"EditEmp.do?empno=" +no + ">[edit]</a>&nbsp;" +
		 * "<a href=\"DeleteEmpCheck.do?empno=" + no + ">[delete]</a></td></tr>";
		 */

		out.print(empn + ename + job + mgr + hiredate + sal + deptno);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

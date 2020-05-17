package bit.or.team4.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
@WebServlet("/EmpByDeptno.do")
public class EmpByDeptno extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpByDeptno() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int deptno = Integer.parseInt(request.getParameter("deptno"));;
		PrintWriter out = response.getWriter();
		EmpDao dao = null;
		List<emp> emplist = null;
		try {
			dao=new EmpDao();
			emplist = dao.getEmpByDeptno(deptno);
			
  		  	request.setAttribute("emplist",emplist);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		System.out.println(emplist.get(0).getEname());

		String str = "";
		for(int i = 0; i < emplist.size(); i++) {
			
			str += "<tr><td>" + emplist.get(i).getEmpno() + "</td>";
			str += "<td>" + emplist.get(i).getEname() + "</td>";
			str += "<td>" + emplist.get(i).getJob() + "</td>";
			str += "<td>" + emplist.get(i).getMgr() + "</td>";
			str += "<td>" + emplist.get(i).getHiredate() + "</td>";
			str += "<td>" + emplist.get(i).getSal() + "</td>";
			str += "<td>" + emplist.get(i).getDeptno() + "</td></tr>";
			
		}
		
		System.out.println(str);
		

		out.print(str);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

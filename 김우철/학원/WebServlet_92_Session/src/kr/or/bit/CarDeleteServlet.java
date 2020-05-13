package kr.or.bit;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/cardelete")
public class CarDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public CarDeleteServlet() {
        super();
       
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html;charset=utf-8");
 		PrintWriter out = response.getWriter();
 		HttpSession session = request.getSession();
 		
 		//Ư���� session ������ ����
 		//session.removeAttribute("productlist");
 		out.print("<html><body>");
 		if(session.getAttribute("productlist")!= null) {
 			//����
 			//session ��ü ����
 			session.invalidate();
 		}else {
 			out.print("��ٱ��ϰ� ��� �־��");
 		}
 		out.print("<a href='Product.html'>��ǰ ���� ������ �̵�</a><br>");
 		out.print("</body></html>");
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}

package kr.or.bit;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/carbasket")
public class CarBasketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CarBasketServlet() {
        super();
    }

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//��ٱ��� ��Ϻ��� 
		//session.setAttribute("productlist", list); 
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		System.out.println("sessionID : " + session.getId());
		
		/*
		  1. getSession() or getSession(true)
		     -HttpSession  Ÿ���� session��ü�� �̹� �����Ѵٸ� �� session ��ü��
		           �ּҸ� ��ȯ�ϰ�
		     -�������� ������ ���ο� ������ ����
		  2.  getSession(false)  
		     -HttpSession  Ÿ���� session��ü�� �̹� �����Ѵٸ� �� session ��ü��
		           �ּҸ� ��ȯ�ϰ�  
		     -�������� ������  null return
		*/
		
		
		out.print("<html>");
		out.print("<body>");
			out.print("<h3>��ٱ���</h3>");
			if(session != null) {  //getSession(false)  
				//������ ��ǰ ����Ʈ ���
				List<String> list = (ArrayList<String>)session.getAttribute("productlist");
				out.print("��ǰ��� : " + list.toString() + "<br>");
			}else {
				out.print("��ٱ��� ��� �־��<br>");
			}
			out.print("<a href='Product.html'>��ǰ ���� ������ �̵�</a><br>");
			out.print("<a href='cardelete'>��ٱ��� ����</a>");
		out.print("</body>");
		out.print("</html>");
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}

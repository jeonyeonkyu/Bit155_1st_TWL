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


@WebServlet("/carsave")
public class CarSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CarSaveServlet() {
        super();
    }

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String product = request.getParameter("product");
		
		//POINT (session)
		//JSP : 내장객체지원 : session.getId()
		//servlet : session 얻어서 >> request 한테 servlet(java)는 session객체가 없어서 request를 통해서 얻어와야 한다.
		HttpSession session= request.getSession(); //HttpSession 타입으로 받아줌 세션이란 클라이언트로부터 받아오는 고유한 정보 브라우저를 완전히 닫거나 session.invaild를 하면 소멸됨
	
		System.out.println("sessionID : " + session.getId());
		
		List<String> list = (ArrayList<String>)session.getAttribute("productlist");
		System.out.println("list Collection : " + list);
		
		if(product == null) {
			System.out.println("상품 선택하지 않으셨네요");
		}else {
			if(list == null) {
				System.out.println("list Collection is null");
				list = new ArrayList<String>();
				list.add(product); //parameter로 받은 상품
				session.setAttribute("productlist", list); //
				//다른 페이지에서 장바구니 공유 
			}else {
				System.out.println("list Collection is not null");
				list.add(product);
			}
		}
		
		out.print("<html>");
			out.print("<body>");
				out.print("<a href='carbasket'>장바구니 보기</a>");
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

package com.bit;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontServletController
 */
@WebServlet(description = "이녀석은 설명입니다^^",  
			urlPatterns = { "/action.do" }) //여러개의 주소를 적을 수 있음
//트렌드한 현업에서는 백프로 어노테이션, 과거에 한건 web.xml -> 둘다 알아야 됨
public class FrontServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontServletController() {
        super();
    }

    //doProcess와 같아요
    //protected void servcie 만들면 doGET, doPOST 호출되지 않음
//	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("service 실행");
//	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGET");
		//http://localhost:8090/WebServlet_1/action.do?cmd=greeting
		
		request.setCharacterEncoding("UTF-8");
		
		String cmd = request.getParameter("cmd");
		
		String msg ="";
		if(cmd.contentEquals("greeting")) {
			//자바의 다양한 객체 사용
			Message m = new Message();
			msg = m.getMessage(cmd);
		}
		
		request.setAttribute("msg", msg);
		RequestDispatcher dis = request.getRequestDispatcher("/greeting.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPOST");
	}

}

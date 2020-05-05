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
@WebServlet(description = "이 녀석은 설명 입니다 ^^", 
			urlPatterns = { "/action.do" })//이렇게 주소가 들어오면 FrontServletController 실행하겠다. web.xml 에 쓰는것보다 어노테이션방식이 편함. 유지보수는 web.xml 이 편하다. 
public class FrontServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontServletController() {
        super();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
    
    //doProcess 와 같아요
    //protected void service 만들면 doGet, doPost 호출되지 않아요 
//	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("service 실행");
//	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		//http://192.168.0.25:8090/WebServlet_1/action.do?cmd=greeting
		
		request.setCharacterEncoding("UTF-8");
		
		String cmd =request.getParameter("cmd");
		
		String msg="";
		if(cmd.equals("greeting")) {
			//자바의 다양한 객체 사용
			Message m= new Message();
			msg = m.getMessage(cmd);
		}
		
		request.setAttribute("msg", msg);
		
		RequestDispatcher dis = request.getRequestDispatcher("/greeting.jsp");
		
		dis.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
	}

}




















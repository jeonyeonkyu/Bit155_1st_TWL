package com.bit;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//
@WebServlet(description = "이건 설명입니다.", urlPatterns = { "/action.do" })
public class FrontServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FrontServletController() {
        super();
     
    }
    
    //doProcess 만들어서 쓴 것과 같다.
    //protected void service를 만들면 doGet, doPOST가 호출되지 않는다.  아래 코드는 정말 호출이 안되는지 확인용
	/*
	 * protected void service(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException {
	 * System.out.println("service 실행"); }
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 실행"); 
		//http://192.168.0.12:8090/WebServlet_1/action.do?cmd=greeting
		
		request.setCharacterEncoding("UTF-8");
		
		String cmd = request.getParameter("cmd");
		
		String msg = "";
		if(cmd.equals("greeting")) {
			//자바의 다양한 객체 사용
			Message m = new Message();
			msg = m.getMessage(cmd);
			
		}
		request.setAttribute("msg", msg);
		
		RequestDispatcher dis = request.getRequestDispatcher("/greeting.jsp");
		
		dis.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPOST 실행");
	}

}

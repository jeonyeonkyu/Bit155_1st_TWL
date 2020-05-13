package com.bit;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet 맵핑해주는 아이 
//유지보수는 xml이 편하다
//하지만 실 개발에서는 @WebServlet을 사용을 많이함
@WebServlet(
		description = "이 녀석은 설명 입니다^^", 
		urlPatterns = { 
				"/FrontServletController", 
				"/action.do"
		})
public class FrontServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontServletController() {
        super();
    }

    //doProcess 와 같아요
    //protected void service 만들면 doGET, doPOST 호출되지 않아요
    //
//	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("service 실행");
//	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGET");
		
		request.setCharacterEncoding("UTF-8");
		
		String cmd = request.getParameter("cmd");
			//데이터 받기
		
			//데이터 판단하기
		String msg = "";
		if(cmd.equals("greeting")) {
			//자바의 다양한 객체 사용
			Message m = new Message();
			msg = m.getMessage(cmd);
			
			request.setAttribute("msg", msg);
			
			RequestDispatcher dis = request.getRequestDispatcher("/greeting.jsp");
			
			dis.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPOST");
	}

}

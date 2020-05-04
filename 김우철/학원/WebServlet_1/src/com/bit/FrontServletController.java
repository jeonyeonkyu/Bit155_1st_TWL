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
@WebServlet(description = "�̳༮�� �����Դϴ�^^",  
			urlPatterns = { "/action.do" }) //�������� �ּҸ� ���� �� ����
//Ʈ������ ���������� ������ ������̼�, ���ſ� �Ѱ� web.xml -> �Ѵ� �˾ƾ� ��
public class FrontServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontServletController() {
        super();
    }

    //doProcess�� ���ƿ�
    //protected void servcie ����� doGET, doPOST ȣ����� ����
//	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("service ����");
//	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGET");
		//http://localhost:8090/WebServlet_1/action.do?cmd=greeting
		
		request.setCharacterEncoding("UTF-8");
		
		String cmd = request.getParameter("cmd");
		
		String msg ="";
		if(cmd.contentEquals("greeting")) {
			//�ڹ��� �پ��� ��ü ���
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

package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.MvcRegisterDao;
import kr.or.bit.dto.MvcRegister;

//@WebServlet("/web.do")  >> command
//������ ������ �ּҴ� ���ƿ�
//web.do?cmd=register ȸ������
//web.do?cmd=registerlist ȸ�����

//Url ��� > �ּҰ� �����Ǹ� �ȵǿ�
//"*.do"  > a.do , b.do , aaaaa.do 
//register.do ȸ������
//registerlist.do ȸ�����
@WebServlet("*.do")
public class RegisterFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }
	
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. ��û �ޱ�
    	//String command  = request.getParameter("cmd")
    	//Url ����� cmd parameter �����
    	
    	//�ּҰ�
    	//register.do
    	//registerok.do
    	//regiseterlist.do
    	
    	//�ּ� ��û�� �Ǵ� �ٰ� (�Լ�)
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String url_Command = requestURI.substring(contextPath.length());
    	
    	//requestURI :  /WebServlet_7_Member_Model2_Mvc_Url/Register.do
    	//contextPath : /WebServlet_7_Member_Model2_Mvc_Url
    	//url_Command : /Register.do
    	
    	System.out.println("requestURI : " + requestURI);
    	System.out.println("contextPath : " + contextPath);
    	System.out.println("url_Command : " + url_Command);
    	
    	//2. ��û �Ǵ� ó�� 
    	String viewpage="";
    	if(url_Command.equals("/Register.do")) { //ȸ������ ������ ����(����)
    		viewpage = "/WEB-INF/Register/Register.jsp";
    	}else if(url_Command.equals("/ok.do")){ //ȸ������ ó�� (����)
    		int id = Integer.parseInt(request.getParameter("id"));
    		String pwd = request.getParameter("pwd");
    		String email = request.getParameter("email");
    		
    		//controller -> service ��ü ó��
    		//dao , dto ó��
    		
    		MvcRegister dto = new MvcRegister();
    		dto.setId(id);
    		dto.setPwd(pwd);
    		dto.setEmail(email);
    		
    		MvcRegisterDao dao = new MvcRegisterDao();
    		int result = dao.writeOk(dto);
    		
    		String resultdata="";
    		if(result > 0) {
    			resultdata ="welcome to bit " + dto.getId() + "��";
    		}else {
    		   resultdata = "Insert Fail retry";
    		}
    		
    		//3. ��� �����ϱ� 
    		request.setAttribute("data", resultdata);
    		viewpage = "/WEB-INF/Register/Register_welcome.jsp";

    	}
    	
    	//4. �� �����ϱ�
    	RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    	
    	//5. forward(request ��ü�� �ּҰ��� ����)
    	dis.forward(request, response); //redirect������� �ϸ� �ּҰ� �ٲ��� �׳� forward�� �ϴ°� ��
    	
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}

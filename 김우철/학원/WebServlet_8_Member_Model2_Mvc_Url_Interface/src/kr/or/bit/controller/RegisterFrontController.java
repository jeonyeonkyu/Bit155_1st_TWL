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
    	
    	//�߰��ڵ�////////////////////////////////////////////
    	//redirect �� path ������ ���� Ŭ����
    	//Action �������̽� Ÿ���� ��� �ڽİ�ü�� �ּҰ��� ���� �� �ִ�
    	
    	///////////////////////////////////////////////////
    	
    	
    	//2. ��û �Ǵ� ó�� 
    	
    	
    	
    	
    	
    	
        	
    	
    	//4. �� �����ϱ�
    	//RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    	
    	//5. forward(request ��ü�� �ּҰ��� ����)
    	//dis.forward(request, response);
    	
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}

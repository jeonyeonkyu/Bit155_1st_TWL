package com;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
  ����(servlet)
 java�� ���� ���Ϸ� �� ���񽺸� �� ����
 ���� ���� ���� : extends HttpServlet >> �� request, response ��ü ��� ����
 
 1. extends HttpServlet �ݵ�� ���(�� ȯ�濡�� ��û�� ������ ó���� �� �ִ�)
 2. SimpleController ����
 ��3. ������ �̺�Ʈ ����� ����(Ư�� �Լ����� Ư�� ��Ȳ��(����� �߻�) �ڵ� ȣ��)
 ex) �������� �ε�ǰ� ���� ... �Լ� ȣ��
 protected void doGet
 protected void doPost 2���� �Լ��� �ڵ� ȣ��
 
 Ŭ���̾�Ʈ�� SimpleController ��û�ϸ�
 ��û���(GET) >> doGET �ڵ�ȣ��
 			>> <form method="GET"
 			>> <a href="login.jsp?num=1000"></a>
 ��û���(POST) >> doPOST �ڵ�ȣ�� 
 			 >> <form mehtod="POST"
 doGET, doPOST : request.getParameter()
 
 Model1 ��� > http://localhost:8090/WebServlet_1/index.jsp >> jsp ��û ���
 Model2 ��� > http://localhost:8090/WebServlet_1/SimpleControler.java (x)
 			web.xml ���Ͽ� �ּ�
 			<url-pattern>/simple</url-pattern>
 			http://localhost:8090/WebServlet_1/simple ��û�� ����
 			
 		**����(java) >> ������ >> class ���� ���� >> ����(doGET, doPOST) >> ��� ����
 		��� web.xml�� ���ص� �Ǵµ� �� ȸ����� web.xml��  ���� ���
 		
 		12�� ���� ���� -> ����(SimpleController) �ڹ� ����
 		-> 12�� 10�� ö�� : ���ʿ�û : (http://localhost:8090/WebServlet_1/simple) >> ������(class ���� ����)
 						>> ���ʽ��� >> ������ >> >> init�Լ� >> ���� >> doGET, doPOST ���� >> �� ����� Client���� ����
 		-> 12�� 15�� ���� : http://localhost:8090/WebServlet_1/simple >> ���� �������� �����ϹǷ� ������ ���ϰ� ����
 						>> �Ϲݽ��� >> ���� >> doGET, doPOST ���� >> �� ����� Client return
 		-> SimpleController �ڹ� ���� -> ������ ������ �Ǿ����� or �����ڰ� �ڵ带 ���������� �ٽ� ������ �ȴ�.
 		
 4.Model1 ���
 4.1 JSP�� ��û�� ������ ó��(DAO, DTO) + JSP
 4.2 Ŭ���̾�Ʈ�� ��� ��û�� JSP�� ó��
 4.3 UI + ����(����) : JSP ó��
 
 5.Model2 ���(MVC)
 5.1 MVC(Model, View, Controller)
 --Model(������ �ڹ� ����) : DAO(DeptDao.java), DTO(VO, DOMAIN)(Dept.java), SERVICE(ó��)
 --View : JSP(�����ʿ��� ���� �����͸� ȭ�鿡 ��� : EL & JSTL), html
 --Controller : servlet(112 ��Ȳ��)
 --1. Ŭ���̾�Ʈ ��û �ľ�(�α���, �Խ��� �۾���, �Խ��� �󼼺��� ��) �ľ�
 --2. ��û�� ó��(ȭ�鸸 ��������(�α��� ȭ��) or ���� ������ ó���ϰ� ����� ��������.. : (�α��� ó��) DB����)
 
 
 
 */
//@WebServlet("/SimpleController")
public class SimpleController extends HttpServlet {
       
    public SimpleController() {
    	super();
    	System.out.println("������ ȣ�� ...");
    }

    //���� ���ϸ� ���پ˸� ������Ʈ ��~
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("Ŭ���̾�Ʈ ��û");
		
		//1.�ѱ�ó��
		request.setCharacterEncoding("UTF-8");
		
		//2.������� ��û�� �ľ�(��û�� �ޱ�)
		String type = request.getParameter("type");
		
		//3.��û�� ���� ���� ����(SERVICE)
		Object resultObj = null;
		if(type == null || type.equals("greeting")) {
			resultObj = "hello world";
		}else if(type.equals("date")) {
			resultObj = new Date();
		}else {
			resultObj = "invalid String type";
		}
		
		//4.��û �Ϸῡ ���� ����� ����ڡڡ�
		//����� �����ϴ� ��� : request, session, application
		request.setAttribute("result", resultObj);
		
		//5.������ ����� Client ����(ȭ�� (UI) JSP) >> � JSP�� ��������� ���� ����
		//����� �������� ���ϰ� >> ����� ������ �������� �Ѱ��ְ� => forward(���) > �����
		//�ڡڡ� request ��ü�� > include,forward�� ���������� �����ȴ�
		//result�� ������� ���������� ��� ����
		
		RequestDispatcher dis = request.getRequestDispatcher("/simpleview.jsp"); 
		//��� �������� ����(Dispatcher)
		//ȭ������
		//������ ȭ�鿡 ������ ����(forward)
		
		dis.forward(request, response);
		//���� �������� ������ �ִ� request, response ��ü�� �ּҸ� �Ѱ��ش�
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
	}

}

package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NowServlet
 */
@WebServlet(
		description = "������ ���� �ð��� ó���ϴ� Ŭ�����Դϴ�", 
		urlPatterns = { 
				"/NowServlet", 
				"/Now.do", 
				"/Now.action",
				"/Now.star"
		}, 
		initParams = { 
				@WebInitParam(name = "id", value = "kosta", description = "id �ʱⰪ ����"), 
				@WebInitParam(name = "jdbcDriver", value = "oracle.jdbc.OracleDriver", description = "����Ŭ ����̹� Ŭ���� ����")
		}) //�������� ������, web.xml�� �����ؼ� ��� ���������� ���°� �� ����
public class NowServlet extends HttpServlet {
    
    public NowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void init(ServletConfig config) throws ServletException {
		//�ʱ�ȭ �Լ�(�ڵ����� ȣ��Ǵ� �Լ�)
		//ȣ����� : NowServlet Ŭ���� ���Ͽ� ���� [���� ��û�� �ѹ� ���� ]
		//        (������ ����� , �����ڰ� �ڵ� ����)
		
		//���� ����(it.co.kr) -> WAS(����:NowServlet.java)
		//ȫ�浿 ù ������ -> it.co.kr/NowServlet ������û 
		//NowServlet ������ -> ����(class) -> initȣ�� -> doGET() or doPOST()
		//������ (������) -> it.co.kr/NowServlet ������û 
		//�޸� (����(class)) -> doGET() or doPOST()
		
		//init : �ٸ� Ŭ���� , �Լ��� �����ڿ� �ʱ�ȭ , load �ϴ� ��Ȱ
		//Class.forName() ����̹� �ε�
		//�̷� ���� �۾� (init) �Լ����� �ѹ��� ����ǰ� ....
		//@WebInitParam �ڿ����� init �Լ����� ���
		
		String drivername = config.getInitParameter("jdbcDriver"); //@WebInitParam�� �ִ� �� �̸����� �ҷ���
		System.out.println("���� ��û �ѹ� ���� : ����̹� �ε�" + drivername);
		
	}

	/*
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("service �Լ� ȣ��(doGET, doPOST ����� ???");
		
	}
    */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGET() Call");
		//Servlet (������ ���� : ȭ�鱸��)  -> ���� JSP
		//servlet (�� UI ���� )
		request.setCharacterEncoding("UTF-8");
		
		//���� ���� ���
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<html>");
			out.print("<head><title>HELLO</title></head>");
			out.print("<body>");
				out.print("���� ��¥ : " + new Date() + "<br>");
				out.print("<script>alert('���')</script>");
			out.print("</body>");
		out.print("</html>");
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPOST() Call");
	}

}






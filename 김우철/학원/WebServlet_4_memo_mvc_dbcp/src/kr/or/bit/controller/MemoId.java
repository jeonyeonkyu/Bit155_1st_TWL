package kr.or.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.memodao;

/**
 * Servlet implementation class MemoId
 */
@WebServlet("/MemoId")
public class MemoId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemoId() {
        super();
    }
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�񵿱�� ��û�� ����
    	//�񵿱� Client�� ���� �� �ִ� ������
    	//1. Text(html, script, test, json)
    	//2. Xml(xml)
    	
    	//Client���� html ����
    	
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	
    	String id = request.getParameter("id");
    	memodao dao = new memodao();
    	String ischeck = dao.isCheckById(id);
    	System.out.println("ischeck : " + ischeck);
    	//isCheck true or false
    	//key point
    	out.print(ischeck); //Client�� �������� ��µ�
    	
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}

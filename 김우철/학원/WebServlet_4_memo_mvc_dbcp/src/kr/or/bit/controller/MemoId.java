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
		//비동기로 요청이 들어옴
    	//비동기 Client가 받을 수 있는 데이터
    	//1. Text(html, script, test, json)
    	//2. Xml(xml)
    	
    	//Client한테 html 리턴
    	
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	
    	String id = request.getParameter("id");
    	memodao dao = new memodao();
    	String ischeck = dao.isCheckById(id);
    	System.out.println("ischeck : " + ischeck);
    	//isCheck true or false
    	//key point
    	out.print(ischeck); //Client의 브라우저에 출력됨
    	
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}

package kr.or.bit.controlloer;

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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//비동기 요청
		//비동기 client 받을수 있는데이터
		//1. Text  (html, script, text, json)
		//2. xml (xml)
		
		//html 리턴
		//비동기여서 뷰단페이지를 꼭 필요로 하지 않는다
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8"); //view 가 없어서 여기서 클라이언테한테 보내는 모든 형식을 정의한다
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		System.out.println("id : "+ id);
		memodao dao = new memodao();
		String ischeck = dao.isCheckById(id);
		//ischeck 변수가 받는 값은  false or true 라는 문자열이다 
		
		//key point
		out.print(ischeck);
		
	}
}














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
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemoId() {
        super();
        
    }
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//비동기 요청이 들어왔을 때 클라이언트가 받을 수 있는 데이터는
    	//text(html, script, text, json), xml
    	
    	//html 리턴
    	
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8"); //view단 페이지가 필요가 없으므로, 여기서 클라이언트에게 보내는 파일의 형식을 지정
    	PrintWriter out = response.getWriter();
    	
    	String id = request.getParameter("id");
    	System.out.println("id: "  + id);
    	
    	memodao dao = new memodao();
    	String ischeck = dao.isCheckById(id);
    	//key point는
    	out.print(ischeck); //이 값이 클라이언트의 브라우저에 출력되는 값임.
    	//ischeck는 false or true리턴
    	
    	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}

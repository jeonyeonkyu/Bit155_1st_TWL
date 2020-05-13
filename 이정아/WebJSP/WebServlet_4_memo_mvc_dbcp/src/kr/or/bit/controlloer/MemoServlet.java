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
 * Servlet implementation class MemoServlet
 */
@WebServlet("/MemoServlet") // Memoservlet
public class MemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemoServlet() {
		super();
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// http://192.168.0.12:8090/WebServlet_4_memo_mvc/MemoServlet
		// 요청이 오면 현재 servlet 파일 실행

		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String content = request.getParameter("memo");

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {
			memodao dao = new memodao(); // POINT 그냥 불러오는거 이렇게!
			int n = dao.insertMemo(id, email, content);

			if (n > 0) {
				out.print("<script>");
				out.print("alert('등록성공..');");
				out.print("location.href='MemoList';");
				// 주소창에 입력 enter (F5) 요청
				// localhost:8090/WebServlet_3/MemoList
				out.print("</script>");
			} else { // insert 에서 현실적으로 경우 ...
				out.print("<script>");
				out.print("alert('등록실패..');");
				out.print("location.href='memo.html';");
				out.print("</script>");
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());

		}

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}

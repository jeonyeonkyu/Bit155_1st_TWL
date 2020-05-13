package kr.or.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dto.Board;
import kr.or.bit.dto.Reply;
import kr.or.bit.service.BoardService;

@WebServlet("*.do")
public class controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public controller() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			doProcess(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			doProcess(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		BoardService service = BoardService.getInBoardService();

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url_Command = requestURI.substring(contextPath.length());

		String url = "";
		String msg = "";

		if (url_Command.equals("/board/writeok.do")) { // 글쓰기OK
			request.setCharacterEncoding("UTF-8");
			Board board = new Board();

			String writer = request.getParameter("writer");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String email = request.getParameter("email");
			String homepage = request.getParameter("homepage");
			String filename = request.getParameter("filename");
			String pwd = request.getParameter("pwd");

			board.setWriter(writer);
			board.setSubject(subject);
			board.setContent(content);
			board.setEmail(email);
			board.setHomepage(homepage);
			board.setFilename(filename);
			board.setPwd(pwd);

			int result = service.writeOk(board);
			if (result > 0) {
				msg = "insert success";
				url = "board_list.jsp";
			} else {
				msg = "insert fail";
				url = "board_write.jsp";
			}

			request.setAttribute("board_msg", msg);
			request.setAttribute("board_url", url);

		} else if (url_Command.equals("/board/deleteok.do")) { // 삭제OK
			request.setCharacterEncoding("UTF-8");
			String idx = request.getParameter("idx");
			String pwd = request.getParameter("pwd");

			int result = service.board_Delete(idx, pwd);

			if (result > 0) {
				msg = "delete success";
				url = "board_list.jsp";
			} else {
				msg = "delete fail";
				url = "board_list.jsp";
			}

			request.setAttribute("board_msg", msg);
			request.setAttribute("board_url", url);

		} else if (url_Command.equals("/board/editok.do")) { // 편집ok
			request.setCharacterEncoding("UTF-8");
			String idx = request.getParameter("idx");

			if (idx == null || idx.trim().equals("")) {
			
				out.print("<script>");
				out.print("alert('글번호 입력 오류')");
				out.print("location.href='board_list.jsp'");
				out.print("</script>");
			}

			int result = service.board_Edit(request);

			if (result > 0) {
				msg = "edit success";
				url = "board_list.jsp";
			} else {
				msg = "edit fail";
				url = "board_edit.jsp?idx=" + idx;
			}

			request.setAttribute("board_msg", msg);
			request.setAttribute("board_url", url);

		} else if (url_Command.equals("/board/board_content.do")) { // 댓글관련
			
			request.setCharacterEncoding("UTF-8");
			String idx = request.getParameter("idx");

			if (idx == null || idx.trim().equals("")) {
				response.sendRedirect("board_list.jsp");
				return;
			}
			idx = idx.trim();
			
			String cpage = request.getParameter("cp");
			String pagesize = request.getParameter("ps");
			request.setAttribute("cp", cpage);
			request.setAttribute("ps", pagesize);
			
			if (cpage == null || cpage.trim().equals("")) {
				cpage = "5";
			}

			if (pagesize == null || pagesize.trim().equals("")) {
				pagesize = "1";
			}

			boolean isread = service.addReadNum(idx);
			if (isread)
				System.out.println("조회수증가:" + isread);

			// 데이터 조회 //결과값이 무조건 글번호 1건 (row)
			Board board = service.content(Integer.parseInt(idx));
			
			String writer = request.getParameter("reply_writer");
			String content = request.getParameter("reply_content");
			String pwd = request.getParameter("reply_pwd");
			String idx_fk = request.getParameter("idx");
			String userid = "empty";
			
			request.setAttribute("idx", idx);
			request.setAttribute("ps", pagesize);

			int result = service.replyWrite(Integer.parseInt(idx_fk), writer, userid, content, pwd);

			if (result > 0) {
				msg = "댓글 입력 성공"; //댓글기능 OK
				url = "board_content.jsp?idx=" + idx_fk;
			} else {
				msg = "댓글 입력 실패";
				url = "board_content.jsp?idx=" + idx_fk;
			}

			request.setAttribute("board_msg", msg);
			request.setAttribute("board_url", url);
//			
		} else if (url_Command.equals("/board/board_content.do")) {

			String idx_fx = request.getParameter("idx");
			String no = request.getParameter("no");
			String pwd = request.getParameter("delPwd");
			System.out.println(idx_fx + "/" + no + "/" + pwd + "/");

			if (idx_fx == null || no == null || pwd == null || no.trim().equals("")) {
				out.print("<script>");
				out.print("history.back();");
				out.print("</script>");
			} else {
				int result = service.replyDelete(no, pwd);

				if (result > 0) {
					msg = "댓글 삭제 성공";
					url = "board_content.jsp?idx=" + idx_fx;
				} else {
					msg = "댓글 삭제 실패";
					url = "board_content.jsp?idx=" + idx_fx;
				}
			}
			request.setAttribute("board_msg", msg);
			request.setAttribute("board_url", url);
		} else if (url_Command.equals("/board/rewriteok.do")) {

			request.setCharacterEncoding("UTF-8");
			Board board = new Board();
			String writer = request.getParameter("writer");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String email = request.getParameter("email");
			String homepage = request.getParameter("homepage");
			String filename = request.getParameter("filename");
			String pwd = request.getParameter("pwd");
			
			board.setWriter(writer);
			board.setSubject(subject);
			board.setContent(content);
			board.setEmail(email);
			board.setHomepage(homepage);
			board.setFilename(filename);
			board.setPwd(pwd);
			
			int result = service.rewriteok(board);

			String cpage = request.getParameter("cp");
			String pagesize = request.getParameter("ps");
			request.setAttribute("cp", cpage);
			request.setAttribute("ps", pagesize);
			
			if (result > 0) {
				msg = "rewrite insert success";
				url = "board_list.jsp?";
			} else {
				msg = "rewrite insert fail";
				url = "board_content.jsp?idx=" + board.getIdx(); // 실패했을 경우 내가 읽었던 글로 다시 돌아가도록 (어떤 글인지 모르므로 글번호를 준 것)
			}
			request.setAttribute("board_msg", msg);
			request.setAttribute("board_url", url);

		}else if(url_Command.equals("/board/boardreply.do")) {
			String idx = request.getParameter("idx");
			 List<Reply> replylist = service.replyList(idx);
		}
		RequestDispatcher dis = request.getRequestDispatcher(url);
		dis.forward(request, response);
	}

}

package com.Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.CBoardDAO;
import com.DTO.Board;

public class CBWriteService  implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");

		CBoardDAO dao = new CBoardDAO();
		
		String subject = request.getParameter("subject");
		String writer = request.getParameter("writer");
		String email = request.getParameter("email");
		String homepage = request.getParameter("homepage");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		
		Board board = new Board();
		CBoardDAO cboard = new CBoardDAO();
		board.setSubject(subject);
		board.setWriter(writer);
		board.setEmail(email);
		board.setHomepage(homepage);
		board.setContent(content);
		board.setPwd(pwd);
		
		int writeResult = dao.writeok(board);
		
		String msg = "";
		String url = "";
		if (writeResult > 0) {
			msg = "�۾��� ����";
			url = "boardCustomList.jsp";
		} else {
			msg = "�۾��� ����";
			url = "boardCustomWrite.jsp";
		}
		
		request.setAttribute("board_msg", msg);
		request.setAttribute("board_url", url);
		
		
//		if (loginResult == 1) {
//			request.setAttribute("loginResult", loginResult);
//			HttpSession session = request.getSession();
//			session.setAttribute("userid", userId);
//		} else {
//			request.setAttribute("loginResult", loginResult);
//			request.getSession().setAttribute("messageType", "���� �޽���");
//			request.getSession().setAttribute("messageContent", "���̵� Ȥ�� ��й�ȣ�� Ʋ�Ƚ��ϴ�.");
//		}
	}

}

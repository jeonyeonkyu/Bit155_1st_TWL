package com.Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CBoardDAO;
import com.DAO.UserDAO;
import com.DTO.Board;

public class CBListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");

		CBoardDAO dao = new CBoardDAO();
		int totalboardcount = dao.totalBoardCount();
		
		System.out.println("totalboardcount : " + totalboardcount);

		String ps = request.getParameter("ps"); // pagesize
		System.out.println("ps : " + ps);
		String cp = request.getParameter("cp"); // current page

		if (ps == null || ps.trim().equals("")) {
			ps = "10"; 
		}

		if (cp == null || cp.trim().equals("")) {
			cp = "1"; 
		}
		
		int pagesize = Integer.parseInt(ps);
		int cpage = Integer.parseInt(cp); 
		int pagecount = 0; 

		if (totalboardcount % pagesize == 0) {
			pagecount = totalboardcount / pagesize; 
		} else {
			pagecount = (totalboardcount / pagesize) + 1;  
		}

		List<Board> list = dao.list(cpage, pagesize);

		request.setAttribute("list", list);
		request.setAttribute("pagesize", pagesize);
		request.setAttribute("cpage", cpage);
		request.setAttribute("pagecount", pagecount);
		
//		if (loginResult == 1) {
//			request.setAttribute("loginResult", loginResult);
//			HttpSession session = request.getSession();
//			session.setAttribute("userid", userId);
//		} else {
//			request.setAttribute("loginResult", loginResult);
//			request.getSession().setAttribute("messageType", "오류 메시지");
//			request.getSession().setAttribute("messageContent", "아이디 혹은 비밀번호가 틀렸습니다.");
//		}
	}

}

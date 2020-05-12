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
		
		request.getP
		
		dao.writeok(boarddata)
		
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

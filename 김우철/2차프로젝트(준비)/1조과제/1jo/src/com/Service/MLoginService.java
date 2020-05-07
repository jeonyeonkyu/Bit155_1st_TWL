package com.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.DTO.UserDTO;

public class MLoginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("id");
		String userPw = request.getParameter("password");

		UserDAO userDAO = UserDAO.getInstance();
		int loginResult = userDAO.login(userId, userPw);
		
		System.out.println(loginResult);
		if (loginResult == 1) {
			request.setAttribute("loginResult", loginResult);
			HttpSession session = request.getSession();
			session.setAttribute("userid", userId);
		} else {
			request.setAttribute("loginResult", loginResult);
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "아이디 혹은 비밀번호가 틀렸습니다.");
		}
	}

}

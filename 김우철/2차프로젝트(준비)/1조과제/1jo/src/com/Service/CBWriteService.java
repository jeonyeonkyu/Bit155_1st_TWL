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
//			request.getSession().setAttribute("messageType", "���� �޽���");
//			request.getSession().setAttribute("messageContent", "���̵� Ȥ�� ��й�ȣ�� Ʋ�Ƚ��ϴ�.");
//		}
	}

}

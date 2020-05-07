package com.Service;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BoardDAO;
import com.DAO.UserDAO;
import com.DTO.BoardDTO;

public class BListService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
    		BoardDAO dao = new BoardDAO();
    		List<BoardDTO> boardList = dao.selectList();
    		request.setAttribute("boardList", boardList);
    		
			 RequestDispatcher dis = request.getRequestDispatcher("/boardList.jsp");
			 
			 dis.forward(request, response); 
    	}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}

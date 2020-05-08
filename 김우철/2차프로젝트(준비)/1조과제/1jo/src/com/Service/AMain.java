package com.Service;
import org.json.simple.JSONObject;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.AdminDAO;
import com.DAO.BoardDAO;
import com.DTO.BoardDTO;

public class AMain implements Service{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		try {
    		AdminDAO adminDAO = new AdminDAO();
    		
    		int count = adminDAO.LoadJSON();
    		System.out.println("�� ȸ�� ��  :"  +count);
    		
    		JSONObject obj = new JSONObject();
    		obj.put("count", count);
    		
    		response.setContentType("application/x-json; charset=UTF-8");
    		response.getWriter().print(obj);

    	}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}

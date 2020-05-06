package com.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.UserDAO;
import com.DTO.UserDTO;

public class MJoinService implements Service{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("id");
		String userPw = request.getParameter("password");
		String userPwCheck = request.getParameter("passwordCheck");
		String userName = request.getParameter("name");
		String userEamil = request.getParameter("email");
		String userAddress = request.getParameter("address");
		String userDetailAddress = request.getParameter("detailAddress");
		String userPhone = request.getParameter("phone");
		
		 UserDAO userDAO = UserDAO.getInstance();
         UserDTO userDTO = new UserDTO();
         userDTO.setUserId(userId);
         userDTO.setUserPw(userPw);
         userDTO.setUserPwcheck(userPwCheck);
         userDTO.setUserName(userName);
         userDTO.setUserEmail(userEamil);
         userDTO.setUserAddress(userAddress);
         userDTO.setUserDetailAddress(userDetailAddress);
         userDTO.setUserPhone(userPhone);
         int joinResult = userDAO.join(userDTO);
         
         if (joinResult == 1) {
             request.setAttribute("joinResult", joinResult);
         } else {
             request.setAttribute("joinResult", 0);
             request.getSession().setAttribute("messageType", "아이디 중복");
             request.getSession().setAttribute("messageContent", "아이디가 중복됩니다.");
         }
	}

}

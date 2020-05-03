package controller.member;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dao.UserDAO;
import member.dto.UserDTO;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/joinController")
public class joinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public joinController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
//             HttpSession session = request.getSession();
//             session.setAttribute("userid", userId);
             RequestDispatcher rd = request.getRequestDispatcher("./main.jsp");
             rd.forward(request, response);
         } else {
             request.setAttribute("joinResult", 0);
             request.getSession().setAttribute("messageType", "아이디 중복");
             request.getSession().setAttribute("messageContent", "아이디가 중복됩니다.");
             RequestDispatcher rd = request.getRequestDispatcher("./register.jsp");
             rd.forward(request, response);
         }
         
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/signUp.jsp");
		rd.forward(request, response);
	}

}

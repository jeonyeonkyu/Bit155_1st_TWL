package controller.member;

import member.dao.UserDAO;
import member.dto.UserDTO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class loginController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("id");
        String userPw = request.getParameter("password");

        UserDAO userDAO = UserDAO.getInstance();
        int loginResult = userDAO.login(userId, userPw);

        if(loginResult == 1) {
            request.setAttribute("loginResult", loginResult);
            HttpSession session = request.getSession();
            session.setAttribute("userid", userId);
            RequestDispatcher rd = request.getRequestDispatcher("./main.jsp");
            rd.forward(request, response);
        }else{
            request.setAttribute("loginResult", loginResult);
            request.getSession().setAttribute("messageType", "오류 메시지");
            request.getSession().setAttribute("messageContent", "아이디 혹은 비밀번호가 틀렸습니다.");
            RequestDispatcher rd = request.getRequestDispatcher("./login.jsp");
            rd.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("./login.jsp");
        rd.forward(request, response);
    }
}

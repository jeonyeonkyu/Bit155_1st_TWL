package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CalendarDAO;
import DTO.CalendarDTO;

public class delete implements LCalendar {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");

		long c_id = Long.parseLong(request.getParameter("c_id"));

		CalendarDAO calendarDAO = CalendarDAO.getInstance();
		int joinResult = calendarDAO.delete(c_id);
		System.out.println("joinResult(delete) : " + joinResult);
		
		if (joinResult == 1) {
			request.setAttribute("joinResult", joinResult);
		} else {
			request.setAttribute("joinResult", 0);
			request.getSession().setAttribute("messageType", "아이디 중복");
			request.getSession().setAttribute("messageContent", "아이디가 중복됩니다.");
		}
	}

}

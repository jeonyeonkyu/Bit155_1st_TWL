package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CalendarDAO;
import DTO.CalendarDTO;

public class add implements LCalendar {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");

		long c_id = Long.parseLong(request.getParameter("c_id"));
		String c_title = request.getParameter("c_title");
		String c_start = request.getParameter("c_start");
		String c_end = request.getParameter("c_end");
		
		System.out.println(c_id);
		System.out.println(c_title);
		System.out.println(c_start);
		System.out.println(c_end);

		CalendarDAO calendarDAO = CalendarDAO.getInstance();
		CalendarDTO calendarDTO = new CalendarDTO();
		calendarDTO.setId(c_id);
		calendarDTO.setTitle(c_title);
		calendarDTO.setStart(c_start);
		calendarDTO.setEnd(c_end);
		int joinResult = calendarDAO.input(calendarDTO);
		System.out.println("joinResult : " + joinResult);

		if (joinResult == 1) {
			request.setAttribute("joinResult", joinResult);
		} else {
			request.setAttribute("joinResult", 0);
			request.getSession().setAttribute("messageType", "아이디 중복");
			request.getSession().setAttribute("messageContent", "아이디가 중복됩니다.");
		}
	}

}

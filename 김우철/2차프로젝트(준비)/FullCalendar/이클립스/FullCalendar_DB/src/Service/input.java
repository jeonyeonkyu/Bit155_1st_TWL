package Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CalendarDAO;
import DTO.CalendarDTO;
import net.sf.json.JSONArray;

public class input implements LCalendar {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	response.setCharacterEncoding("utf-8");
		
		String c_title = request.getParameter("c_title");
		String c_start = request.getParameter("c_start");
		String c_end = request.getParameter("c_end");
		
		 CalendarDAO calendarDAO = CalendarDAO.getInstance();
         CalendarDTO calendarDTO = new CalendarDTO();
         calendarDTO.setTitle(c_title);
         calendarDTO.setStart(c_start);
         calendarDTO.setEnd(c_end);
         int joinResult = calendarDAO.input(calendarDTO);
         
         if (joinResult == 1) {
             request.setAttribute("joinResult", joinResult);
         } else {
             request.setAttribute("joinResult", 0);
             request.getSession().setAttribute("messageType", "���̵� �ߺ�");
             request.getSession().setAttribute("messageContent", "���̵� �ߺ��˴ϴ�.");
         }
	}

}

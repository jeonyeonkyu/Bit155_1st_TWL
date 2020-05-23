package Service;

import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CalendarDAO;
import DTO.CalendarDTO;
import net.sf.json.JSONArray;

public class list implements LCalendar {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		try {
    		CalendarDAO dao = new CalendarDAO();
    		List<CalendarDTO> boardList = dao.selectList();	
    		
    		JSONArray jsonlist = JSONArray.fromObject(boardList);
    		
    		response.setContentType("application/x-json; charset=UTF-8");
    		System.out.println("service!!");
    		response.getWriter().print(jsonlist);

    	}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
}

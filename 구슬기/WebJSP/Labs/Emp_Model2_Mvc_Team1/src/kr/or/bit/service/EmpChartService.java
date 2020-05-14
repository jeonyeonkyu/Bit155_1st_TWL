package kr.or.bit.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.Emp;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class EmpChartService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		EmpDao empdao = new EmpDao();
		List<Emp> list = empdao.chartList();
		
		
		request.setAttribute("list", list);
		
		System.out.println("emp!!  아니고 list" + list);
		
		JSONObject obj = new JSONObject();
		JSONArray jsonArr = JSONArray.fromObject(list); 
		
		System.out.println("jsonArr : " + jsonArr);
		response.setContentType("application/x-json; charset=UTF-8");
		
		try {
			response.getWriter().print(jsonArr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("jsonArr", jsonArr);
	
		ActionForward forward = new ActionForward();
	forward.setPath("/WEB-INF/views/chartView.jsp");

	return forward;
	}
}

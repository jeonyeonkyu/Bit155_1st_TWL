package kr.or.bit.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.Emp;

public class EmpDetailService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		
		request.setCharacterEncoding("UTF-8");
		EmpDao dao = new EmpDao();
		Emp getContent = dao.getContent(1);
		request.setAttribute("detail", getContent);
		
		String ps = request.getParameter("ps");
		String cp = request.getParameter("cp");
		
		int pagesize = Integer.parseInt(ps);
		int cpage = Integer.parseInt(cp);
		int pagecount = 0;
		
		
		forward = new ActionForward();
		forward.setPath("/WEB-INF/views/EmpDetail.jsp");
		
		return forward;
}	
	
}
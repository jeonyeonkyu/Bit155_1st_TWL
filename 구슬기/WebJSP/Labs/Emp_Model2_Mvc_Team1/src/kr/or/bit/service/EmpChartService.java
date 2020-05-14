package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.Emp;

public class EmpChartService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		EmpDao empdao = new EmpDao();
		List<Emp> list = empdao.chartList();
		
		
		request.setAttribute("list", list);
		
		System.out.println("emp!!  아니고 list" + list);
		/*
		 * EmpDao empdao = new EmpDao(); List<Emp> delist = empdao.detailList(elist);
		 * System.out.println(elist); request.setAttribute("list", elist);
		 */
		
	ActionForward forward = new ActionForward();
	forward.setPath("/index.jsp");

	return forward;
	}
}

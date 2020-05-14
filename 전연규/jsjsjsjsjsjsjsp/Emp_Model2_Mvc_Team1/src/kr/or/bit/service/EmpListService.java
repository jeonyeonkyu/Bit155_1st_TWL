package kr.or.bit.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.Emp;

public class EmpListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

	
			/*
			 * String idx = request.getParameter("idx");
			 * 
			 * if (idx == null || idx.trim().equals("")) {
			 * response.sendRedirect("EmpTable.jsp");
			 * 
			 * } idx = idx.trim();
			 */
			
			
			EmpDao empdao = new EmpDao();
			List<Emp> elist = empdao.list();
			System.out.println(elist);
			request.setAttribute("list", elist);
			
			String ps = request.getParameter("ps"); //pagesize
			String cp = request.getParameter("cp");

			if (cp == null || cp.trim().equals("")) {
				cp = "5";
			}

			if (ps == null || ps.trim().equals("")) {
				ps = "1";
			}
			
			int pagesize = Integer.parseInt(ps);
			int cpage = Integer.parseInt(cp);
			int pagecount = 0;
			

			int totalcount = empdao.totallistCount();
			
			if (totalcount % pagesize == 0) { 
				pagecount = totalcount / pagesize;
			} else {
				pagecount = (totalcount / pagesize) + 1;
			}
			
		ActionForward forward = new ActionForward();
		forward.setPath("/WEB-INF/views/EmpTable.jsp");

		return forward;
		}
	}
	

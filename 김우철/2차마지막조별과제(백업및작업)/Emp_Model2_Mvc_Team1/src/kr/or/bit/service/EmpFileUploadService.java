package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.Emp;

public class EmpFileUploadService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

	
	ActionForward forward = new ActionForward();
	forward.setPath("/WEB-INF/views/updateView.jsp");

	return forward;
	}

}

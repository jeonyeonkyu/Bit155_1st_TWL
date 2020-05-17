package bit.or.team4.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bit.or.team4.action.Action;
import bit.or.team4.action.ActionForward;
import bit.or.team4.dao.EmpDao;
import bit.or.team4.dto.emp;

public class ShowEmpListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
    	try {
    		forward = new ActionForward();
    		EmpDao dao = new EmpDao();
  		  	List<emp> emplist = dao.getEmpList();
  		  	
  		  	request.setAttribute("emplist",emplist);
  		  	
  		  	forward.setRedirect(false);
  		  	forward.setPath("/WEB-INF/emp/emplist.jsp");
    	}catch(Exception e){
    		System.out.println(e.getMessage());	
    	}
		return forward;
	}

}

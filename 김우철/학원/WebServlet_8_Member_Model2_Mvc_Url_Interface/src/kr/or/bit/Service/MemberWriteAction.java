package kr.or.bit.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.MvcRegisterDao;
import kr.or.bit.dto.MvcRegister;

//회원 정보를 write하는 서비스
//실행하는 함수 : execute
public class MemberWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		//7번프로젝트 URI의 서블리셍 있던것
		int id = Integer.parseInt(request.getParameter("id"));
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		
		//controller -> service 객체 처리
		//dao , dto 처리
		
		MvcRegister dto = new MvcRegister();
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setEmail(email);
		
		MvcRegisterDao dao = new MvcRegisterDao();
		int result = dao.writeOk(dto);
		
		String resultdata="";
		if(result > 0) {
			resultdata ="welcome to bit " + dto.getId() + "님";
		}else {
		   resultdata = "Insert Fail retry";
		}
		
		//3. 결과 저장하기 
		request.setAttribute("data", resultdata); //★★★★★(컨트롤러에서 받은 request 이용)
		//viewpage = "/WEB-INF/Register/Register_welcome.jsp";
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/Register/Register_welcome.jsp");
		
		return forward;
	}

}

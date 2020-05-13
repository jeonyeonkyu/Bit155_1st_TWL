package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.MvcRegisterDao;
import kr.or.bit.dto.MvcRegister;

//회원 정보를 write 서비스
//실행하는 함수 : execute
public class MemberWriteAction implements Action{
 @Override
public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
	// TODO Auto-generated method stub
	 //controller  - > service 객체 처리
	 
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
 		
 		request.setAttribute("data", resultdata);
		//viewpage = "/WEB-INF/Register/Register_welcome.jsp";
 	
 		//ActionForward >> memberfield
 		//private boolean isRedirect = false;  //화면 아니면 로직 제어 결정하는것으로 쓴다
 		//private String path = null; //이동 경로( 뷰의 주소를 입력하는 것으로 쓴다)
 		
 		ActionForward forward = new ActionForward();
 		forward.setRedirect(false);
 		forward.setPath("/WEB-INF/Register/Register_welcome.jsp");
	return forward;
}
}

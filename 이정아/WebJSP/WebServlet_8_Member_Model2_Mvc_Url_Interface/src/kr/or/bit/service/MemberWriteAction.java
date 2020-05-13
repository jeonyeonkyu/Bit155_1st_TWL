package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.MvcRegisterDao;
import kr.or.bit.dto.MvcRegister;

public class MemberWriteAction implements Action {

	//회원정보를 write하는 서비스
	//실행하는 함수명은 execute
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//controller 안에 있던 작업 내용을 그대로 서비스로 가져온 것
		int id = Integer.parseInt(request.getParameter("id"));
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		
		//jsp -> service -> dao -> dto -> dao -> service -> jsp (Model1)
		
		//controller -> dao -> dto -> jsp  (단점 : controller 처리 량 증가)
		
		//Controller -> [Service] 생략 ->  DAO (DTO) 
		//DTO 객체 필요하다면 만들기
		MvcRegister dto = new MvcRegister();
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setEmail(email);
		
		//DAO 객체 필요하다면 만들기 위의 DTO와 DAO를 지금은 controller가 처리하고 있는데 부담이 너무 커지므로 나중에 service로 뺄 것임
		MvcRegisterDao dao = new MvcRegisterDao();
		int result = dao.writeOk(dto);
		
		String resultdata="";
		if(result > 0) {
			resultdata = "welcome to bit " + dto.getId() + "님";
		}else {
			resultdata = "Insert Fail retry";
		}
		
		//3. 결과 저장하기 (여기서 view 생성 태그 만들고 ..... 하지 않고 별도의  jsp)
		request.setAttribute("data", resultdata);
		//처리결과가 있는 것은 setAttribute로 저장해야 함. view단에 저장한 데이터로 보여주기 위해서 view단에서 session. 혹은 request.getAttribute로 가져올 수 있다.
		//viewpage = "/WEB-INF/Register/Register_welcome.jsp";
		
		//ActionForward >> 이 클래스가 가지고 있는 멤버필드가 private로 선언한 	//private boolean isRedirect = false; //화면 아니면 로직제어
																				//private String path = null; //이동경로(뷰의 주소)
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/Register/Register.jsp");
		return forward;
	}

}

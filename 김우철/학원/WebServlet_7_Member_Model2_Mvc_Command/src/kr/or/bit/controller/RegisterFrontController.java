package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.MvcRegisterDao;
import kr.or.bit.dto.MvcRegister;


@WebServlet("*.do")
public class RegisterFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public RegisterFrontController() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 요청 받기
		String command = request.getParameter("cmd");
		
		//2. 요청 판단 처리 (command  방식 : ?cmd=list) : 무조껀 파라미터를 만듬
		String viewpage="";
		if(command.equals("register")) { //?cmd=register
			//회원가입 페이지 전달
			viewpage = "/WEB-INF/Register/Register.jsp"; //WEB-INF 접근 가능
			//response.sendDIrect로 하면ㅁ 주소가 바뀌기대문에 페이지만 이동시키느것도 다 포워드로 해줘라!!
		}else if(command.equals("registerok")) { //?cmd=registerok
			//회원가입 처리
			//?cmd=registerok&id=hong&pwd=1004&email=hong@naver.com
			int id = Integer.parseInt(request.getParameter("id"));
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			
			//jsp -> service -> dao -> dto -> dao -> service -> jsp (Model1)
			
			//controller -> dao -> dto -> jsp  (단점 : controller 처리 량 증가)
			
			//Controller -> [Service] 생략 ->  DAO (DTO) 
			//DTO 객체
			MvcRegister dto = new MvcRegister();
			dto.setId(id);
			dto.setPwd(pwd);
			dto.setEmail(email);
			
			//DAO 객체
			MvcRegisterDao dao = new MvcRegisterDao();
			int result = dao.writeOk(dto);
			
			String resultdata="";
			if(result > 0) {
				resultdata = "welcome to bit " + dto.getId() + "님";
			}else {
				resultdata = "Insert Fail retry";
			}
			
			//3. 결과 저장하기 (여기서 view 생성 태그 만들고 ..... 하지 않고 별도의  jsp)
			request.setAttribute("data", resultdata); //세션으로전달하면 다른페이지에서도 사용가능, 내가포워드하는 페이지에서만 쓸꺼면 request!!
			viewpage = "/WEB-INF/Register/Register_welcome.jsp";
		}
		
		//4. view 지정
			RequestDispatcher dis = request.getRequestDispatcher(viewpage);
		
		//5. forward 
			dis.forward(request, response);
			//현재요청한 페이지의 URL의 버퍼에 viewpage의 내용만 심기 때문에 URL변경 X
	}

}








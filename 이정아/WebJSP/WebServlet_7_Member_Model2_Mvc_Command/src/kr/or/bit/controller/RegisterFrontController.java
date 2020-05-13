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
		//1. 요청 받기(command 방식) -> 파라미터(cmd)를 하나 만드는 것
		String command = request.getParameter("cmd");
		
		//2. 요청 판단 처리 (command  방식 : ?cmd=list)
		String viewpage="";
		if(command.equals("register")) { //?cmd=register
			//회원가입 페이지 전달
			viewpage = "/WEB-INF/Register/Register.jsp"; //WEB-INF 접근 가능
		}else if(command.equals("registerok")) { //?cmd=registerok
			//회원가입 처리
			//?cmd=registerok&id=hong&pwd=1004&email=hong@naver.com //넘어오는 데이터를 받아줌. getParameter로 
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
			viewpage = "/WEB-INF/Register/Register_welcome.jsp";
		}
		
		//4. view 지정
			RequestDispatcher dis = request.getRequestDispatcher(viewpage);
		
		//5. forward (responseredirect~... 같은걸로 이동처리를 하면 주소가 바뀌므로 주소가 안바뀌게 forward로)
			dis.forward(request, response);
	}

}








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
		//1. ��û �ޱ�
		String command = request.getParameter("cmd");
		
		//2. ��û �Ǵ� ó�� (command  ��� : ?cmd=list) : ������ �Ķ���͸� ����
		String viewpage="";
		if(command.equals("register")) { //?cmd=register
			//ȸ������ ������ ����
			viewpage = "/WEB-INF/Register/Register.jsp"; //WEB-INF ���� ����
			//response.sendDIrect�� �ϸ餱 �ּҰ� �ٲ��빮�� �������� �̵���Ű���͵� �� ������� �����!!
		}else if(command.equals("registerok")) { //?cmd=registerok
			//ȸ������ ó��
			//?cmd=registerok&id=hong&pwd=1004&email=hong@naver.com
			int id = Integer.parseInt(request.getParameter("id"));
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			
			//jsp -> service -> dao -> dto -> dao -> service -> jsp (Model1)
			
			//controller -> dao -> dto -> jsp  (���� : controller ó�� �� ����)
			
			//Controller -> [Service] ���� ->  DAO (DTO) 
			//DTO ��ü
			MvcRegister dto = new MvcRegister();
			dto.setId(id);
			dto.setPwd(pwd);
			dto.setEmail(email);
			
			//DAO ��ü
			MvcRegisterDao dao = new MvcRegisterDao();
			int result = dao.writeOk(dto);
			
			String resultdata="";
			if(result > 0) {
				resultdata = "welcome to bit " + dto.getId() + "��";
			}else {
				resultdata = "Insert Fail retry";
			}
			
			//3. ��� �����ϱ� (���⼭ view ���� �±� ����� ..... ���� �ʰ� ������  jsp)
			request.setAttribute("data", resultdata); //�������������ϸ� �ٸ������������� ��밡��, �����������ϴ� ������������ ������ request!!
			viewpage = "/WEB-INF/Register/Register_welcome.jsp";
		}
		
		//4. view ����
			RequestDispatcher dis = request.getRequestDispatcher(viewpage);
		
		//5. forward 
			dis.forward(request, response);
			//�����û�� �������� URL�� ���ۿ� viewpage�� ���븸 �ɱ� ������ URL���� X
	}

}








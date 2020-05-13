package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.MvcRegisterDao;
import kr.or.bit.dto.MvcRegister;
import kr.or.bit.service.MemberWriteAction;


//@WebServlet("/web.do")  >> command
//실제로 들어오는 주소는 같아요
//web.do?cmd=register 회원가입
//web.do?cmd=registerlist 회원목록

//Url 방식 > 주소가 고정되면 안되요
//"*.do"  > a.do , b.do , aaaaa.do 
//register.do 회원가입
//registerlist.do 회원목록
@WebServlet("*.do")
public class RegisterFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }
	
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 요청 받기
    	//String command  = request.getParameter("cmd")
    	//Url 방식은 cmd parameter 없어요
    	
    	//주소값
    	//register.do
    	//registerok.do
    	//regiseterlist.do
    	
    	//주소 요청의 판단 근거 (함수)
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String url_Command = requestURI.substring(contextPath.length());
    	
    	//requestURI :  /WebServlet_7_Member_Model2_Mvc_Url/Register.do
    	//contextPath : /WebServlet_7_Member_Model2_Mvc_Url
    	//url_Command : /Register.do
    	
    	System.out.println("requestURI : " + requestURI);
    	System.out.println("contextPath : " + contextPath);
    	System.out.println("url_Command : " + url_Command);
    	
    	//추가코드////////////////////////////////////////////
    	//redirect 와 path 정보를 갖는 클래스가 서비스로부터 넘어 올 것이다.
    	//Action 인터페이스 타입은 모든 자식객체의 주소값을 가질 수 있다
    	ActionForward forward = null;
    	Action action = null;
    	///////////////////////////////////////////////////
    	
    	
    	//2. 요청 판단 처리 컨트롤러는 이제 판단만 한다. (화면단인지, 처리단인지에 대한 판단만 하면 된다)
    	String viewpage = "";
    	if(url_Command.contentEquals("/Register.do")) { //슬러시 주의 //회원가입 페이지를 달라는 의미 (화면단UI만 제공)
    		forward = new ActionForward(); //안써도 되는데 표준화된 코드를 위해서 쓰는 것
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/Register/Register.jsp"); //view단의 화면을 제공하는 것이기 때문에 서비스 클래스가 필요없다.
    	}else if(url_Command.contentEquals("/ok.do")) { //ui도 제공해줘야하고. 로직도 처리해줘야 한다. (처리에 대한 내용이 필요)
    		action = new MemberWriteAction();
    		forward = action.execute(request, response); //execute(request, response); request안에 클라이언트로부터 받은 parameter값이 그대로 들어가있음
	
    	}else if(url_Command.contentEquals("/login.do")) {
    		
    	}
    	
 	
    	//4. 뷰 지정하기
    	//RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    	if(forward != null) {
    		if(forward.isRedirect()) { //true면 redirect를 하겠다. == url에다가 주소 넣고 enter를 치겠다. (새로고침)
    			response.sendRedirect(forward.getPath());		//그러나 주소가 바뀌어버리므로 잘 안쓰긴 함	
    		}else { //false (모든 자원에 사용한다)
    			//UI만 처리해도 되고
    			//UI + 로직을 구성해도 되고
    			//forward를 쓰는 이유 (url 주소 변화 없이 view의 내용을 받아 볼 수 있음)
    			RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
    			dis.forward(request, response);
    			
    		}
    	}
    	//5. forward(request 객체의 주소값을 공유)
    	//dis.forward(request, response);
    	
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}

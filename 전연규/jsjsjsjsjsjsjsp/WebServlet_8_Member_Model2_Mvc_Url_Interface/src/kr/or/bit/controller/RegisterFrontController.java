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
    	//redirect 와 path 정보를 갖는 클래스
    	//Action 인터페이스 타입은 모든 자식객체의 주소값을 가질 수 있다
    	
    	ActionForward forward = null;
    	Action action = null;
    	///////////////////////////////////////////////////
    	
    	
    	//2. 요청 판단 처리 (화면, 처리)
    	String viewpage="";
    	if(url_Command.equals("/Register.do")) { //회원가입 페이지 주세요
    		//UI 제공 (서비스 클래스 (x)) >> 표준화 형태로 준다
    		//수정하려면 setPath 주소만 바꿔주면 됨
    		//이게~ 패턴이다
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/Register/Register.jsp");
    	}else if(url_Command.equals("/ok.do")){ //회원가입 처리
    		//UI제공 + 로직처리
    		//화면단이냐? 처리 단이냐? 만 구분하면 됨
    		
    		action = new MemberWriteAction();
    		//KEYPOINT 
    		//execute 할때 request는 클라이언트로부터 요청받을 때 생성된 객체
    		//request 는 xx번지 주소이다
    		//xx번지에다가 변수하나 만든거임
    		
    		//뽑아내는 값은 data가 나온다
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/login.do")) {
    		//화면처리하기 //위에꺼 복붙
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/Register/login.jsp");
    		//주소만 바꿔서 복붙하면 댐
    	
    	}else if(url_Command.equals("/loginok.do")) {
    		//위에꺼 복붙
    		action = new MemberWriteAction();
    		forward = action.execute(request, response);
    		
    	}
    	
    	
    	
    	
    	
        	
    	
    	//4. 뷰 지정하기
    	//RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    	if(forward != null) {
    		//if를 타지 않으면
    		if(forward.isRedirect()) { //true
    			response.sendRedirect(forward.getPath());
    			//getPath가 /WEB-INF/Register/Resiter.jsp 이것인데
    			//이거하면 화면이 확 바뀌니깐 거의 안쓴다 ㅎㅎ
    			
    		}else { //false(모든 자원) 사용 
    			//UI
    			//UI + 로직
    			//forward url 주소 변환 없이 view의 내용을 받을 수 있다
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

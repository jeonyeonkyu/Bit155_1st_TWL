package com.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontBoardController
 */
//@WebServlet("/FrontBoardController")
public class FrontBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontBoardController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    //GET, POST 두가지 요청방식에 대해서 동작하는 함수
    //doGET() , doPOST()  자동 호출
    //1. servlet 제공하는 함수 : service() 함수 
    //2. 별도의 함수 (개발자 마음) : doGET, doPOST 처리
    //doProcess() 
    private void doProcess(HttpServletRequest request, HttpServletResponse response,String method) throws ServletException, IOException  {
    	//request, response 객체가 필요해서 파라미터에 넣어줌
    	//함수가 GET, POST 요청을 둘다 처리
    	System.out.println("클라이언트 요청 : " + method);
    	
    	//1. 한글처리
    	
    	//2. 요청 받기(request)
    	
    	//3. 요청 판단(판단의 기준 : parameter) : **** command 방식
    	//3.1 parameter 기준 판단
    	//3.2 192.168.0.12:8090/WebServlet_1/board?cmd=login&userid=kglim
    	
    	//String str = request.getParameter("cmd");
    	//if(str.equals("login") {로그인 처리}
    	
    	//board?cmd=boardlist
    	//String str = request.getParameter("cmd");
    	//if(str.equals("boardlist") {게시판 처리}
    	
    	//cmd반대방식(URL 주소 판단)  ****url 방식
    	//http://192.168.0.12:8090/WebServlet_1/board/boardlist
    	//http://192.168.0.12:8090/WebServlet_1/board/boardwrite?title=hello&content=
    	//마지막 주소값을 판단 : /boardlist 목록보기
    	//  			 /boardwrite 글쓰기
    	
    	
    	//4. 결과저장(scope : request, session, application)
    	
    	
    	//5. view 지정 
    	// view page : jsp
    	//WebContect > board > boardlist.jsp
    	//WebContent > error > error404.jsp
    	//위코드의 문제점 : 보안 노출 : 클라이언트 직접 주소창에 
    	//http://192.168.0.12:8090/WebServlet_1/board/boardEditOK.jsp >> URL 명시
    	//실제 프로젝트에서는 JSP 파일..
    	//해결 : 보안폴더 : WEB - INF (가 보안폴더임) >>views 폴더 > 
    	//1. WEB-INF >> views >> board >> boardlist.jsp
    	//2. WEB-INF >> views >> error >> error404.jsp
    	//WAS 내부에서 서버 접근 가능 : forward 처리 (서버코드 read)
    	
    	//6. view에게 저장된 객체 전달(forward)
    	
    	
    	//////////////////////////////////////////////////////////////////////////////////
    	
    	
    	request.setCharacterEncoding("UTF-8");
    	//1. 요청받기(commad)
    	//http://192.168.0.12:8090/WebServlet_1/board?cmd=list   << 이런식으로 요청주소가 넘어오게만들어보자
    	String cmd = request.getParameter("cmd");
    	
    	
    	
    	//2. 요청 판단 (업무 정의)
    	String viewpage = null;
    	//cmd >> null >> error.jsp 뷰   		  <<cmd가 null값이라면 에러페이지를 보여주겟다
    	//cmd >> boardlist >> list.jsp 뷰
    	//cmd >> boardwirte >> write.jsp 뷰    		나름대로의 정의를 하면 됨
    	
    	if(cmd == null) {  //파라미터가 실제로 안넘어 온경우
    		viewpage = "/error/error.jsp";
    		
    	}else if(cmd.equals("boardlist")) {
    		viewpage = "/board/boardlist.jsp";
    		//실제업무처리가 들어가야함
    		//DB 연결... select ... 객체 담고 ... 저장
    		//boardDao dao = new boardDao();
    		//List<board> boardlist = dao.selectBoardList();
    		//request.setAttribute("list",boardlist);
    		//forward >> view 전달 >> boardlist.jsp >>
    		//EL&JSTL 
    		//<c:set var="list" value = "<%= request.getAttribute("list")%>" >> 
    		//<c:forEach 화면 출력
    		
    	}else if(cmd.equals("boardwrite")) {
    		viewpage="/board/boardwrite.jsp";
    	}else if(cmd.equals("login")) { //실 개발에서는 .. 보안폴더를 사용한다
    		viewpage = "/WEB-INF/views/login/login.jsp";  //실 개발에서는 이렇게 사용
    	}else {
    		viewpage = "/error/error.jsp";
    	}
    	
    	//3.결과저장
    	//가정...
    	//List<Emp> list = new ArrayList<>();
    	//list.add(new Emp(2000,"김유신"));
    	//......
    	//request.setAttribute("emplist" , list )   >> list의 주소를 저장
    	
    	
    	//4. view 지정
    	RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    	
    	//5. 데이터 전달(forward)
    	dis.forward(request, response);
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doProcess(request,response,"GET");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		doProcess(request,response,"POST");
	}

}

package com.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
        
    }
    //GET, POST 두가지 요청방식에 대해서 동작하는 함수 
    //doGet() , doPost() 자동 호출
    //1. servlet 제공하는 함수 : service() 함수 도 있다. 필요하다면 만들어 쓰기
    //2. 별도의 함수 (개발자 마음) : doGet, doPost 처리하도록
    //doProces() 똑같으면 합쳐보자!
    private void doProcess(HttpServletRequest request, HttpServletResponse response, String method) throws ServletException, IOException { //아래 두개 대체할거니까 똑같이 필요함 
    	//이 함수 하나로 doGet, doPost 요청을 둘다 처리하겟다
    	System.out.println("클라이언트 요청: "+method);
    	
    	
     	//☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
    	
    	// 이 흐름알아야함
    	//한글처리 데이터받기, 판단하고, 저장하고, 저장된데이터볼수잇는 뷰 지정, 뷰에다가 포워드 한다. 
    	
    	//1. 한글처리
    	
    	//2. 요청받기(request)
    	
    	//3. 요청 판단하기(판단의 기준은 : parameter) : command 방식 
    	//3.1 parameter 기준으로 판단하는 것  = command 방식
    	//3.2 192.168.0.12:8090/WebServlet_1/board?cmd=login&userid=kglim 
    	
    	//String str = request.getParameter("cmd"); ***************cmd 밸류 값에 따라 판단을 달리한다. 
    	//if(str.equals("login"){로그인 처리} 
    	
    	//board?cmd=boardlist
    	//String str = request.getParameter("cmd");
    	//if(str.equals("boardlist"){게시판 처리} 
    	
    	//cmd 와 반대방식 (URL 주소판단) 도 있다.  : URL 방식 
    	//https://192.168.0.12:8090/WebServlet_1/board/boardlist
    	//https://192.168.0.12:8090/WebServlet_1/board/boardwrite?title=hello&content=
    	//마지막 주소값으로 판단 :    /boardlist 목록보기     ****************마지막 주소 값에 따라 판단을 달리한다.
    	//					  /baordwrite 글쓰기 
    	
    	//4. 결과저장 (scope :request , session, application) 스콥따라 다르게 저장한다. 라이프사이클을 감안해서씀
    	//세션은 모든페이지가 다쓸수 있는거 ,request는 현재페이지나 include, forward 된거 
    	
    	//5. view 지정
    	// view page : jsp 
    	// WebContent > board > boardlist.jsp
    	// WebContent > error > error404.jsp  
    	// 위 코드의 문제점 : 보안상 노출된다 : 클라이언트가 직접 주소창에
    	//https://192.168.0.12:8090/WebServlet_1/board/boardEditOk.jsp 같은 처리페이지 URL 을 요청할수 있다. 그럼 500번 오류가 날수도 있따.
    	//그래서 실제 프로젝트에서는 JSP 파일 을 보안폴더에 넣는다
    	//해결 : 보안폴더 : WEB-INF >> views 폴더 > 
    	//1. WEB-INF >> views >> board >> boardlist.jsp
    	//2. WEB-INF >> views >> error >> error404.jsp
    	//WAS 내부에서는 서버 접근 가능 : forward 방식으로 처리했을때 (서버코드 read)할수 있다. 
    	
    	//6. view 에게 저장된 객체 전달(forward 하기)
    	
     	//☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
    	
    	
    	//1. 한글처리
    	request.setCharacterEncoding("UTF-8");
    	
    	//2. 요청받기 (command)
    	//http://192.168.0.12:8090/WebServlet_1/board?cmd=list 이렇게 할거임
    	String cmd = request.getParameter("cmd");
    	
    	//3. 요청 판단(업무정의)
    	String viewpage =null;
    	//cmd >> null (아무것도 안넘어온 상태) >> error.jsp 뷰
    	//cmd >> boardlist >> list.jsp 뷰
    	//cmd >> boardwrite >> write.jsp 뷰 단으로 정의 함
    	
    	if(cmd == null) {
    		viewpage ="/error/error.jsp";
    	}else if(cmd.equals("boardlist")) {
    		viewpage ="/board/boardlist.jsp";
    		//실제 업무처리
    		//DB 연결     select 하고 객체담고 저장하고 이런것들
    		//boardDao dao = new boardDao(); 객체만들고
    		//list<board> boardlist = dao.selectBoardList(); 데이터담고
    		//request.setAttribute("list",boardlist); 저장하고
    		//forward >> view 에 전달하고 >> boardlist.jsp >>
    		//EL&JSTL 을 가지고
    		//<c:set var ="list" value="<%= request.getAttribute("list")%>">  
    		//<c:forEach 화면에 출력하는 작업하면된다 
    		
    	}else if(cmd.equals("boardwrite")) {
    		viewpage ="/board/boardwrite.jsp";
    	}else if(cmd.equals("login")) {  //실제 개발에서는 보안폴더사용한다. 
    		viewpage="/WEB-INF/views/login/login.jsp"; //실 개발에서는 이렇게 사용해용
    	}else {
    		viewpage="/error/error.jsp"; 
    	}
    	
    	
    	//4.결과저장
    	//저장할게 없지만 가정해서 해본다
    	//List<Emp> list = new ArrayList<>();
    	//list.add(new Emp(2000,"김유신"));
    	//.....했다치고
    	//request.setAttribute("emplist" , list);
    	//요렇게 하면 저장한거임
    	
    	//5. view 지정 한다 .. 어떤 화면에 보여줄거지??
    	RequestDispatcher dis= request.getRequestDispatcher(viewpage);
    	
    	//6. 데이터 전달(forward)
    	dis.forward(request, response); 
    	
    	//이러면 끝 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response ,"GET");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response ,"POST");
	}

}



























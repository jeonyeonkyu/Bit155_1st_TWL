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
       
    public FrontBoardController() {
        super();
    }
    
    
    //GET, POST 두 가지 요청방식에 대해서 동작하는 함수
    //doGet(), doPost() 자동 호출
    //1. servlet이 기본적으로 제공하는 함수이다. service()라는 함수도 있다.
    //2. 별도의 함수를 만들어서(개발자 임의로) doGet과 doPOST를 하나의 함수로 처리하도록 해보기
    //doProcess() 라는 함수를 이용해서
    //뒤에 get과 post를 파라미터로 받아서 get인지 post인지 알아 볼 수 있도록 해줘도 됨. 그리고 doprocess의 파라미터에 method라는 파라미터를 하나 추가해서 받도록
    //현재 doProcess가 get방식과 post방식 둘 다 하나의 함수로 받고있기 때문에
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response, String method) throws ServletException, IOException {
    	System.out.println("클라이언트 요청 : " + method);
    	
    	//1. 한글처리
    	
    	//2. 요청받기(request)
    	
    	//3. 요청판단(판단의 기준은 2가지 방식이 있다. url OR parameter) 지금은 parameter가 뭐인지에 따라서 판단해볼것임(command 방식이라고 한다)
    		//http://192.168.0.213:8090/WebServlet_1/board?cmd=login&userid=junga
    	
    	//String str = request.getParameter("cmd"); //cmd라는 파라미터 값을 str로 뽑아 낸 다음에 그 str로 로직을 설정
    	//if(str.equals("login") { 로그인 처리 }
    	
    	//board?cmd=boardlist
    	//String str = request.getParameter("cmd");
    	//if(str.equals("boardlist") { 게시판 처리 }
    	
    	//url 방식으로 판단하는 법
    		//http://192.168.0.213:8090/WebServlet_1/board/boardlist
    		//http://192.168.0.213:8090/WebServlet_1/board/boardwrite?title=hello&content=
    	//마지막 주소값을 이용해서 판단 /boardlist 목록보기
    	//								/boardwrite 글쓰기
    
    	
    	//4. 결과 저장(scope : request, session, application)
    	
    	//5. view를 지정
    	// view page : jsp를 지정
    	// WebContent > board > boardlist.jsp
    	// WebContent > error > error404.jsp
    	// 위 코드의 문제점 : 보안상 노출된다. ex)클라이언트가 직접 주소창에 //http://192.168.0.213:8090/WebServlet_1/board/boardEditOk.jsp 와 같은 주소를 입력할 수 있게 되어버린다.
    	//그래서 실제 프로젝트에서는 JSP파일을 보안폴더에 넣어놓는다. 
    	//1. WEB-INF >> views >> board >> boardlist.jsp 혹은
    	//2. WEB-INF >> view >> error >> error404.jsp
    	//WAS 내부에서는 서로 접근이 가능하다. 클라이언트만 접근하지 못할뿐. forward 방식으로 처리했을 때 서버코드를 read 할 수 있다.
    	
    	//6. view에게 저장된 객체를 전달 ( forward 하는 것 )
    	
    	//다시해보기////////////////////////////////////////////////////////////////////////////////////////////////
    	request.setCharacterEncoding("UTF-8");
    	//1. 요청받기(command)
    	//	//http://192.168.0.213:8090/WebServlet_1/board?cmd=list
    	String cmd = request.getParameter("cmd");
    	
    	//2. 요청 판단(업무 정의)
    	String viewpage = null;
    	//cmd라는 parameter가 null값이면 error.jsp 페이지를 보여 줄 것이다. (view)
    	//cmd가 boardlist 라는 문자열이면 list.jsp를 보여 줄 것이다. (view)
    	//cmd가 boardwrite 라는 문자열이면 write.jsp를 보여 줄 것이다.(view)
    	
    	if(cmd == null) {
    		viewpage = "/error/error.jsp";
    	}else if(cmd.equals("boardlist")) {
    		viewpage = "/board/boardlist.jsp";
    		//실제 업무처리
    		//DB연결해서 select 한 결과를 가져오고, 가져온 결과를 객체에 담고 그것을 저장하는...
    		//boardDao dao = new boardDao();
    		//List<board> boardlist = dao.selectBoardList();
    		//request.setAttribute("list",boardlist);
    		//forward >> view 전달 >> boardlist.jsp
    		//EL & JSTL로
    		//<c:set var = "list" value = "<%= request.getAttribute("list")%>"
    		//<c:forEach 화면에 출력 작업></c:forEach>
    	}else if(cmd.equals("boardwrite")) {
    		viewpage = "/board/boardwrite.jsp";
    		
    	}else if(cmd.equals("login")) { //실제 개발에서는 보안폴더를 사용한다. login 페이지만 보안폴더에 넣어보기
    		viewpage = "/WEB-INF/views/login/login.jsp"; //이렇게 사용한다. 폴더 안에 폴더를 만들고 그 안에 jsp파일 생성
    	}else {
    		viewpage = "/error/error.jsp";
    	}
    	
    	//3. 결과 저장
    	//결과가 있다고 가정하고
    	//List<Emp> list = new ArrayList<>();
    	//list.add(new Emp(2000, "김유신"));
    	//....
    	//request.setAttribute("emplist" , list);
    	
    	
    	
    	//4. view를 지정
    	RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    	
    	//5. 데이터 전달(forward)
    	dis.forward(request, response);
    }
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response,"Get");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response,"POST");
	}

}

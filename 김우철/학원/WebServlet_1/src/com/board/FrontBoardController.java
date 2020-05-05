package com.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/ProntBoardController")
public class FrontBoardController extends HttpServlet {
       
    public FrontBoardController() {
        super();
    }
    //GET, POST 두가지 요청방식에 대해서 동작하는 함수
    //doGet(), doPost() 자동 호출
    //1.servlet이 제공하는 함수 : service() 함수
    //2.별도의 함수(개발자 마음) : doGET, doPOST 처리
    //doProcess()
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response, String method) throws ServletException, IOException {
    	//이 함수가 GET, POST 요청을 둘다 처리
    	System.out.println("클라이언트 요청 : " + method);
    	
    	//1.한글 처리
    	
    	//2.요청 받기(request)
    	
    	//3.요청 판단(판단의 기준 : parameter) : command 방식
    	//3.1 parameter 기준 판단
    	//3.2 http://localhost:8090/WebServlet_1/board?cmd=login&userid=kglim
    	
    	//String str = request.getParameter("cmd");
    	//if(str.equals("login'){ 로그인 처리 }
    	
    	//board?cmd=boardlist
    	//String str = request.getParameter("cmd");
    	//if(str.equals("boardlist") { 게시판 처리 }
    	
    	//cmd와 반대되는 방식(URL 주소 판단) : ***URL 방식
    	//3.2 http://localhost:8090/WebServlet_1/board/boardlist
    	//3.2 http://localhost:8090/WebServlet_1/board/boardwrite?title=hello&content=
    	//마지막 주소값으로 판단 : /boardlist 목록보기
    	//					//boardwrite 글쓰기
    	//내생각엔 주소값판단으로 많이할듯?
    	
    	//4.결과저장(scope : request, session, application)
    	//보통은 request를 많이 사용 
    	
    	//5.view 지정
    	//view page : jsp지정
    	//WebContent > board > boardlist.jsp
    	//WebContent > error > error404.jsp
    	//위 코드 문제점 : 보안 노출
    	//http://localhost:8090/WebServlet_1/board/boardEditOk.jsp : >> URL 명시 (클라이언트가 직접 주소창에 적어서는 안되는 주소)
    	//서버에서 forward하는 곳은 사용자가 직접 url로 들어갈수 없게 막아야 하기 때문에
    	//쌤 피셜로 회원가입 로그인 빼고는 다 보안폴더에 넣으랜다..
    	//실제 프로젝트에서는 JSP 파일 ....??? 뭔말이여;;
    	//해결 : 보안 폴더 : WEB-INF >> views 폴더 >
    	//1. WEB-INF >> views >> board >> boardlist.jsp
    	//2. WEB-INF >> views >> error >> error404.jsp
    	//WAS 내부에서는 서로 접근 가능 : forward 방식으로 처리했을 때 서버 코드를 read 가능
    	
    	//6.view에게 저장된 객체 전달(forward)
    	
    	///////////////////////////////////// 실습 시작
    	
    	request.setCharacterEncoding("UTF-8");
    	
    	//1.요청받기(command 방식)
    	//http://localhost:8090/WebServlet_1/board?cmd=list
    	String cmd = request.getParameter("cmd");
    	
    	//2.요청 판단(업무 정의)
    	String viewpage = null;
    	//cmd >> null >> error.jsp 뷰
    	//cmd >> boardlist >> list.jsp 뷰
    	//cmd >> boardwrite >> write.jsp 뷰
    	
    	if(cmd == null) {
    		viewpage = "/error/error.jsp";
    	}else if(cmd.equals("boardlist")) {
    		viewpage = "/board/boardlist.jsp";
    		//실제 업무 처리
    		//DB 연결...select ... 객체에 담고 ... 저장
    		//boardDao dao = new boardDao();
    		//List<board> boardlist = dao.selectBoardList();
    		//request.setAttribute("list", boardlist);
    		//forward >> view 전달 >> boardlist.jsp
    		//EL & JSTL
    		//<c:set var="list" value="<%= request.getAttribute("list") %>"
    		//<c:set var="memolist" value="${requestScope.memolist}"></c:set>
    		//<c:forEach 화면출력...
    	}else if(cmd.equals("boardwrite")) {
    		viewpage = "/board/boardwrite.jsp";
    	}else if(cmd.equals("Login")) {//실 개발에서는 ...보안폴더
    		viewpage = "/WEB-INF/views/login/login.jsp"; //실 개발...
    	}else {
    		viewpage = "/error/error.jsp";
    	}
    	
    	//3.결과저장
    	//가정 ..
    	//List<Emp> list=  new ArrayList<>();
    	//list.add(new Emp(2000, "김유신"));
    	//....
    	//request.setAttibute("emplist", list);
    	
    	//4.view 지정
    	RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    	
    	//5.데이터 전달(forward)
    	dis.forward(request, response);    	
    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "GET");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "POST");
	}

}

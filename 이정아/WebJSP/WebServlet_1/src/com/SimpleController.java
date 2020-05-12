package com;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SimpleController
 * 
 * 
 * 	서블릿(Servlet)
 * 	java로 만든 파일로 웹 서비스를 할 목적
 *	서블릿 파일 조건 : extends HttpServlet 해야함 , 상속받지 않으면 걍 자바임 >> 웹 request, response 객체 사용가능
 *	
 *	1. extends HttpServlet 반드시 상속해야함 (웹 환경에서 요청, 응답 처리할수 있음)
 *	2. SimpleControlloer 서블릿 
 *	3. 서블릿은 이벤트 기반의 동작 ( 특정 함수들이 특정 상황에 (어떤 사건이 발생할 경우) 자동으로 호출) 중요..☆
 *	ex) 페이지가 로드되면 .. 함수 호출됨 
 *	protected void doGet
 *	protected void doPost 2개의 함수가 자동 호출
 *	
 * 	****클라이언트가 SimpleController 요청하면****
 *
 * 	doGet 	요청방식이 (get) 일때 자동호출   >>    아래 두가지의 경우에
 * 										<form method="GET"
 * 										<a href="login.jsp?num=1000">게시판</>
 * 	doPost  요청방식이 (post) 일때 자동호출 >>
 * 										<form method="POST" 라고 명시되지 않은건 전부다  get방식이다. 
 *	doGet , doPost : request.getParameter() 역할을 한다 
 *
 *
 *	Model1 방식 > http:// 192.168.0.12:8090/WebServlet_1/index.jsp   >> jsp 요청방식
 *	Model2 방식 > http:// 192.168.0.12:8090/WebServlet_1/SimpleController.java (x)
 *				web.xml 파일에 주소
 *				<url-pattern>/simple</url-pattern>
 *				http://192.168.0.12:8090/WebServlet_1/simple 요청이 오면
 *
 *			☆서블릿 (java) >> 컴파일 >> class 파일 생성 >> 실행(doGet,doPost) >>결과리턴
 *
 * 			12시에 서버 오픈-> 서버에 (SimpleController) 자바파일하나 갖고입음
 * 			->12시 10분에  철수  : 최초요청(http://192.168.0.12:8090/WebServlet_1/simple)
 * 				>> 요청이 들어오면그때 컴파일한다 (class 파일 생성)
 * 				>> 최초 실행 >> 생성자(최초니까)>> init함수(최초니까) >> doGet, doPost 함수가 실행되고 >> 그 결과를 클라이언트에게 return 한다. 
 * 			-> 12시 15 분에 순이가 들어옴 : 요청을보냄 (http://192.168.0.12:8090/WebServlet_1/simple) 
 * 				>>기존 실행 존재 >> 바로 실행 >> doGet, doPost 함수가 실행되고 >> 그 결과를 클라이언트에게 return 한다.
 * 					한번만 컴파일하고 나머지 요청은 doGet, doPost 함수가 실행된다. 
 * 			->SimpleController 자바 파일 다시 컴파일 될때: 서버 리부팅, 개발자 코드 수정
 * 
 *	4. Model1 방식
 *	4.1 JSP 요청과 응답을 처리(DAO,DTO) 는 갖고 있다.
 *			결국 DAO ,DTO + JSP 이다
 *	4.2 클라이언트의 모든 요청을 JSP 처리
 *	4.3 UI + 업무(로직) : JSP 처리  
 *		
 *	5. Model2 방식 (MVC패턴)
 *	5.1 MVC(Model, View, Controller) 
 *	Model (순수한 자파 파일) : DAO(DeptDao.java같은거), DTO(VO,DOMAIN)(Dept.java같은거), SERVICE(처리)
 *	View       (화면단)  : JSP(서버쪽에서 받은 데이터 화면 출력 : EL & JSTL), html
 *	Controlloer        : servlet(112 상황실같은거)
 *						-- 클라이언트의 요청을 파악(로그인, 게시판에 글쓰기, 게시판 상세보기) 
 *						-- 요청을 처리 (화면만 제공할지(로그인화면), (로그인처리)DB 연결, 로직 처리 결과를 return 할지)
 * 
 * 
 */
//@WebServlet("/SimpleController") 이거 하나면 많이 해결된다. 
public class SimpleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SimpleController() {
        super();
        System.out.println("생성자 호출...");
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("클라이언트 요청");
		
		//글쓰긴지 로그인인지 메모장을 보고싶은지 받고 그거에 따른 데이터 만들고, 저장하고 화면을 정의한담에 정의된 화면에 request객체를 전달하면 view가 화면을 구성하고 클라이언트에게 전달한다. 
		//1.한글처리
		
		//2.사용자의 요청 파악(요청값 받기)
		String type = request.getParameter("type");  //JSP 랑 다를거 없이 똑같이 쓴다. 
		
		//3.요청에 따른 업무 수행(SERVICE)
		Object resultobj = null;
		if(type==null || type.equals("greeting")) {
			resultobj= "hello world";
		}else if(type.equals("date")) {
			resultobj = new Date();
		}else {
			resultobj = "invalid String type";
		}
		
		//4.요청 완료에 따른 결과를 저장-이게 가장 중요
		//결과를 저장하는 방법 : request , session , applicaion 객체 (차이 scope)
		request.setAttribute("result", resultobj);
		
		//5.저장한 결과를 Client 전달 (화면 (UI)  --> JSP 로 함) >> 어떤 JSP 사용 지정 할수 있음
		//출력할 페이지를 저장하고 >> 출력할 테이터를 페이지에 넘겨주고  => forward(방식) > 제어권
		// ** request 객체는 >> include, forward 페이지에서 공유된다. 
		
		RequestDispatcher dis =  request.getRequestDispatcher("/simpleview.jsp"); //출력 페이지 지정하는거  dispatcher ..
		//지정한 화면에 데이터를 forward 방식으로 전달
		
		dis.forward(request, response);
		//현재 페이지가 가지고 있는 request, response 객체 주소를 넘겨준다)
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}

















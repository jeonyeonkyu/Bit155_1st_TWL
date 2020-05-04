package com;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 Servlet(서블릿)
 "java로 만든 파일"로 웹 서비스를 할 목적으로 만들어진 것.
 서블릿의 파일의 조건은 [extends HttpServlet] 상속받아야 하며, 그럼으로써 웹 request, resoponse라는 객체를 사용 할 수 있게 된다. (상속 안받은거는 일반 java파일, 상속받은게 survlet파일)
 
	 1. 서블릿이라는 이름을 붙여주기 위해서는 반드시 extends HttpServlet 되어진 상태여야 한다. (웹 환경에서의 요청, 응답을 처리)
	 2. SimpleController 서블릿!
	 3. 서블릿은 이벤트 기반의 동작을 가진다. (특정 함수들이 특정 상황에(어떤 사건이 발생하면) 자동으로 호출된다. 직접 함수를 호출하지 않아도 자동으로 호출됨)
	 	ex) 페이지가 로드되고 나면 함수가 호출되어져서 자동으로 사용되는... (onload)
	 	
	 	- doGet
	 	- doPost 2개의 함수가 자동으로 호출된다.
	 	
	 클라이언트가 SimpleController를 요청하면 함수가 자동으로 호출된다.
	 - doGet 
	 - doPost 이 2개의 함수는 클라이언트가 어떤 요청방식으로 요청했느냐에 따라 해당함수가 자동으로 호출된다. (Get,Post방식에 따라서) >> form태그에서 action쪽
	
 		/Get방식은 <form method="GET"
 			  	  <a href="login.jsp?num=1000">게시판</a> 의 2가지 방식이 있으므로, 이 두 가지 경우에 doGet함수가 자동으로 호출된다.
 		
 		/Post방식은 <form method="POST" 일 때 호출
 		  
 		
 	결론 -> doGet, doPost 함수는 request.getParameter()의 역할을 한다.
 	
 	Model1방식 > http://192.168.0.12:8090/WebServlet_1/index.jsp >>jsp요청방식
 	Model2방식 > http://192.168.0.12:8090/WebServlet_1/SimpleController.java (x) 이렇게 하지 말기
 				web.xml 파일에 주소 -> <url-pattern>/simple</url-pattern>
 				http://192.168.0.12:8090/WebServlet_1/index.jsp/simple 이렇게 주소를 받게 되는 것. 요청을 이렇게 받아서
 				
 			서블릿(java) >>컴파일 >> class 파일 생성 >>실행(doGet, doPOST) >>결과리턴
 			
 			ex) 12시 서버 오픈 -> 서버에 (SimpleController) 라는 자바파일을 가지고 있는 상태라고 가정,
 				-12시 10분에 철수라는 Client가 최초 요청을 보낸다면,  (인터넷 주소 창에 http://192.168.0.12:8090/WebServlet_1/index.jsp/simple) >> 이 때 컴파일(class파일 생성)
 				>>"최초" 실행이 되면 >> 생성자가 만들어지고 >> init함수가 실행 >> doGet, doPOST가 실행 >> 그 결과를 Client에게 return
 				-12시 15분에 순이 Client가 두번째 요청을 보낸다면 (인터넷 주소 창에 http://192.168.0.12:8090/WebServlet_1/index.jsp/simple) >>이미 철수의 요청 때에 컴파일을 했기 때문에
 				class파일이 존재하므로 컴파일 필요없이 바로 실행 >>"일반" 실행이 되면 >> doGet, doPOST가 실행 >> 그 결과를 Client에게 return
 				
 			그렇다면 SimpleController java파일이 다시 컴파일 될 때는 언제일까? 서버가 리부팅 되었을 때, 개발자가 코드를 수정했을 때
 			
 	<Model1 방식>
 	JSP가 요청과 응답을 모두 처리하는 것(DAO, DTO는 가지고 있다) = DAO, DTO + JSP
 	클라이언트의 모든 요청을 JSP가 처리한다.
 	UI + 업무로직을 JSP가 모두 처리했었다.
 	
 			
 	<Model2 방식>
 	MVC 패턴을 적용한 Model2방식은, M(Model)V(View),C(Controller)가 서로 업무를 나누어서 쓰는 방식이고,
 	
 	- Model은 순수한 java파일 : DAO(DeptDao.java), DTO(VO,DOMAIN)(Dept.java) , SERVICE(처리)
 	- View는 화면단, JSP : 서버쪽에서 받은 DATA를 화면에 출력하는 역할 : EL & JSTL, html
 	- Controller : servlet 파일이 담당 ( 중앙 통제센터 )
 		>> 컨트롤러는 Client의 요청을 파악한다.(로그인인지? 게시판 글쓰기인지? 게시판 상세보기인지?에 대한 파악)
 		>> 요청을 처리(화면만 제공할지(로그인 하려고하면 로그인 화면을 제공), 실제 로직을 처리하고 결과를 리턴할지(실제 로그인 처리 DB연결 등등...))
 	
 				
 			
 */

//@WebServlet("/SimpleController")
public class SimpleController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SimpleController() {
        super();
    	System.out.println("생성자 호출 ...");
      
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("클라이언트 요청");
		
		//1. 한글처리(했다는 가정하에 원래는 해야함)
		//2. 사용자의 요청을 파악 ( 요청값 받기 )
		String type = request.getParameter("type");
		
		//3. 사용자의 요청에 따른 업무처리(SERVICE) 
		Object resultobj = null;
		if(type == null || type.equals("greeting")) {
				resultobj = "hello world!";
		}else if(type.equals("date")){
				resultobj = new Date();
		}else {
				resultobj = "invalid String type";
		}
		
		//4. 요청 완료에 따른 결과를 저장
		//결과를 저장하는 방법 : request(페이지 단위), session, application 객체를 활용 == scope차이
			request.setAttribute("result", resultobj);
			
		//5. 저장한 결과를 Client에게 전달 (화면이 필요해진다. UI작업 = Model2방식이라면 JSP가 가지고 있다.) 어떤 jsp를 사용할지 지정해주는 것
		//출력할 페이지를 정하고, 출력할 데이터를 페이지에 넘겨주고(forward방식으로 넘겨주기) >> 제어권을 넘겨주기 위해
		//그리고 request객체는 include, forward 된 페이지에서 공유되기 때문에 위의 result를 forward된 페이지에서 사용 할 수 있기 때문
		
		RequestDispatcher dis = request.getRequestDispatcher("/simpleview.jsp"); //Dispatcher는 어떤 페이지를 뿌리겠다고 지정하는 것 (simpleview라는 페이지를 만들어서 그 화면을 뿌리겠다)
			
		//6. 지정한 화면에 데이터를 전달 (forward 방식으로)
		
		dis.forward(request, response); //현재 페이지가 가지고 있는 request response 객체의 주소를 넘겨주는 것
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

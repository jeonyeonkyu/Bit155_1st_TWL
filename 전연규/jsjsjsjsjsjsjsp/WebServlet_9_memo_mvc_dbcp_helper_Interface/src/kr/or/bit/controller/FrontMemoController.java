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
import kr.or.bit.service.MemoAddService;
import kr.or.bit.service.MemoIdCheckService;
import kr.or.bit.service.MemoListService;




@WebServlet("*.memo")
public class FrontMemoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FrontMemoController() {
        super();
        // TODO Auto-generated constructor stub
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String url_Command = requestURI.substring(contextPath.length());
	
    	Action action = null;
    	ActionForward forward= null;
    	
    	if(url_Command.equals("/MemoAdd.memo")) { //글쓰기 처리
    		//처리가 들어가면 UI + 로직 이다
    		action = new MemoAddService();
    		System.out.println("MemoAddSerice 실행");
    		forward = action.execute(request, response);
    		
    		
    	}else if(url_Command.equals("/MemoList.memo")) { //목록보기
    		// UI + 로직  //목록보기도 UI + 로직
    			action = new MemoListService();
    			System.out.println("MemoListService 실행");
    			forward = action.execute(request, response);
    		
    		
    	}else if(url_Command.equals("/MemoId.memo")) { //비동기 처리를 똑같은 패턴으로..
    		//비동기(ID 사용 유무)
    			action = new MemoIdCheckService();
    			System.out.println("MemoIdCheckService 실행");
    			forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/MemoView.memo")) { //현재 없지만
    		//만약 있다면 상세보기
    		//UI + 로직 이 필요 (동일)
    		//UI만 제공하는 페이지다...
    		//예) /WEB-INF/views/memoview.jsp 가 있다고 가정하면
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/memoview.jsp");
    		
    		
    		
    	}
    	
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
    	
    	
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}

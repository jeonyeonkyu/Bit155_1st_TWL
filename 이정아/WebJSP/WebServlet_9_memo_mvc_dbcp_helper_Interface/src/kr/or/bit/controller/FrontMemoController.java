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

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url_Command = requestURI.substring(contextPath.length());

		Action action = null;
		ActionForward forward = null;

		if (url_Command.equals("/memoAdd.memo")) { // 글쓰기처리에 대한 요청
			// UI + 로직
			action = new MemoAddService(); //서비스 실행(로직들어있음)하고
    		forward = action.execute(request, response); //UI로 보내기 위한 forward에 정보를 전달
    		System.out.println("MemoAddService 실행");

		} else if (url_Command.equals("/MemoList.memo")) { // 목록보기에 대한 요청
			// UI + 로직
			action = new MemoListService();
    		forward = action.execute(request, response);
    		System.out.println("MemoListService 실행");
		} else if (url_Command.equals("/MemoId.memo")) { // 비동기(ID 사용 유무)
			// UI + 로직
			action = new MemoIdCheckService();
    		forward = action.execute(request, response);
    		System.out.println("MemoIdCheckService 실행");
		} else if (url_Command.equals("/MemoView.memo")) { // 아직 만들어지진 않았지만 만약 있다면 상세보기에 대한 요청
			// UI페이지가 있다는 가정 하에
			//ex)/WEB_INF/views?memoview.jsp가 있다고 치면
			forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB_INF/views?memoview.jsp");

		}
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
    	}//여기까지 하고 서비스 구축

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}

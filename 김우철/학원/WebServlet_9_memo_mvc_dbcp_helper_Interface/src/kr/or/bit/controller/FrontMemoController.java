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
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url_Command = requestURI.substring(contextPath.length());

		Action action = null;
		ActionForward forward = null;

		if (url_Command.equals("/MemoAdd.memo")) { // 글쓰기 처리
			// UI+로직
			action = new MemoAddService();
    		forward = action.execute(request, response);
    		System.out.println("MedoAddSerivce 실행");
		} else if (url_Command.equals("/MemoList.memo")) { // 목록보기
			action = new MemoListService();
    		forward = action.execute(request, response);
    		System.out.println("MemoListService 실행");
			// UI+로직
		} else if (url_Command.equals("/MemoId.memo")) { // 비동기(ID 사용 유무)
			action = new MemoIdCheckService();
    		forward = action.execute(request, response);
    		System.out.println("MemoIdCheckService 실행");
			// UI+로직
		} else if (url_Command.equals("/MemoView.memo")) { // 만약 있다면 상세보기
			// UI만 제공...
			//예) /WEB-INF/views/memoview.jsp가 있다고 가정...
			forward = new ActionForward(); //이거안써도되는데 패턴화(표준화)해주기 위해 사용
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/memoview.jsp");
		}

		// 4. 뷰 지정하기
		// RequestDispatcher dis = request.getRequestDispatcher(viewpage);
		if (forward != null) {
			if (forward.isRedirect()) { // true (새로고침..)
				response.sendRedirect(forward.getPath());
				// sendRedirect 쓰지마라!! 여기서는 학습용
			} else { // false(모든 자원은 isRedirect()가 다 false로 타게 할거임) 그래야 주소가 안바뀜
				// 경우의수 1 : UI
				// 경우의수 2 : UI + 로직
				// forward : URL 주소 변화 없이 view의 내용을 받을 수 있다
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
		// 5. forward(request 객체의 주소값을 공유)
		// dis.forward(request, response);
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

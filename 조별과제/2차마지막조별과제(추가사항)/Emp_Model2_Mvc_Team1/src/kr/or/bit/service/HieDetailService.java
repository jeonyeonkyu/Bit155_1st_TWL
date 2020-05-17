package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;

public class HieDetailService  implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		ActionForward forward = new ActionForward();	
		BoardDao dao = new BoardDao();
		Board board = new Board();
		
		String idx = request.getParameter("idx").trim();
		String cpage = request.getParameter("cp");
		String pagesize = request.getParameter("ps");
	
		if (cpage == null || cpage.trim().equals("")) {
			//default 값 설정
			cpage = "1"; //1번째 페이지를 보겠다.
		}

		if (pagesize == null || pagesize.trim().equals("")) {
			//default 값 설정
			pagesize = "5"; //5개씩 묶음을 잡겠다
		}
		
		dao.getReadNum(idx);
		board = dao.getContent(Integer.parseInt(idx));
		
		request.setAttribute("board", board);
		
		String msg = "";
		String url = "";
		/*
		 * if (Result > 0) { msg = ""; url = "HieEmpTable.do"; } else { msg =
		 * "계층형 등록 실패"; url = "history.back()"; }
		 */
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
			
	
		forward.setPath("/WEB-INF/common/redirect.jsp");

		return forward;
		}
	}
	

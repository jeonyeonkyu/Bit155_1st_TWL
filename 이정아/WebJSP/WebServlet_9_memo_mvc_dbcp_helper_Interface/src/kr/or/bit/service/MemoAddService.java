package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.memodao;

public class MemoAddService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//한글처리 안하는 이유는 필터에 이미 처리해뒀기 때문
		
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String content = request.getParameter("memo");

		memodao dao = new memodao();
		int result = dao.insertMemo(id, email, content); //여기까지하면 글 다 쓴 상태
		
 		
	    String msg="";
	    String url="";
	    if(result > 0){
	    	msg ="등록 성공";
	    	url ="MemoList.memo";
	    }else{
	    	msg="등록 실패";
	    	url="memo.html";
	    }
	    
	    request.setAttribute("board_msg",msg); //리퀘스트 객체에 현재 정보를 담은 것
	    request.setAttribute("board_url", url); //여기까지가 view단으로 보내기 직전의 정보를 담은 
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/redirect.jsp");
		
		return forward;
	}

}

package kr.or.bit.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.memodao;

public class MemoAddService implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

      String id = request.getParameter("id");
      String email = request.getParameter("email");
      String content = request.getParameter("memo");

      memodao dao = new memodao(); // POINT
      int result = dao.insertMemo(id, email, content);

      String msg="";
      String url="";
      if(result > 0){
      	msg ="등록 성공";
      	url ="MemoList.memo";
      }else{
      	msg="등록 실패";
      	url="memo.html";
      }
      
      request.setAttribute("board_msg",msg);
      request.setAttribute("board_url", url);
      
      ActionForward forward = new ActionForward();
      forward.setRedirect(false);
      forward.setPath("/WEB-INF/views/redirect.jsp");
      //여기의 문제점은?
      
      
      return forward;
   }
   
   public Map<String, String> addMember(String id, String email, String memo) {
	   
	   memodao dao = new memodao(); // POINT
       int insertResult = dao.insertMemo(id, email, memo);
       
       Map<String, String> result = new HashMap<>();
       
       result.put("boardMsg", insertResult > 0 ? "등록성공" : "등록실패");
       result.put("boardUrl", insertResult > 0 ? "MemoList.memo" : "memo.html");
       result.put("success", insertResult > 0 ? "true" : "false");
       result.put("isRedirect", "false");
	   return result;
   }

}
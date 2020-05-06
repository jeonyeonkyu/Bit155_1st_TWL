package kr.or.bit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.memodao;
import kr.or.bit.dto.memo;

@WebServlet("/MemoList")
public class MemoList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemoList() {
		super();
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 아래부터 게시판 페이징처리
		/////화면에 보여질 게시글의 개수를 지정
		int pageSize = 10;
		//현재 보여지고 있는 페이지의 넘버값을 읽어들이기(현재 몇번째 페이지를 보고있는지)
		String pageNum = request.getParameter("pageNum");
	
		//맨~~ 처음 게시판을 로딩했을 때에는 아무것도 없을 것이므로 null 처리를 해줘야 한다.
		if(pageNum == null) {
			pageNum = "1";
		}
		//전체 글의 개수를 지정해주자 (내맘대로)
		int count = 0;
		//최신글이 가장 먼저 떠야하므로 뒤쪽 큰 숫자부터 카운터링해서 내려간다. 그 숫자를 저장할 변수를 선언
		int number = 0;
		
		//현재 보여지고 있는 페이지 문자를 숫자로 형변환을 해주기
		int currentPage = Integer.parseInt(pageNum);
		
		//전체 게시글의 갯수를 가져와야하므로 데이터베이스 객체를 생성
		//아래의 memodao클래스
		
		// 데이터를 select 해서 view에 보내는 것 까지... !
		// view단 페이지를 구성해야 함. list를 보여줘야하기때문 ( 과제 ) memolist.jsp

		try {
			// 요청에 대한 판단이 필요없음.(지금 요청당 servlet 1개씩 만들고 있으므로)
			// 이 servlet 전체 조회

			memodao dao = new memodao();
			count = dao.getAllCount(); //memodao에 전체 글의 개수를 리턴하는 함수를 생성하기
			
			//현재 보여질 페이지의 시작 번호를 설정해준다.
			int startRow = (currentPage -1) * pageSize +1;
			int endRow = currentPage * pageSize;
			
			//최신글 10개를 기준으로 게시글을 리턴 받아주는 메소드 호출 // 가방(memo)에 담기는 데이터, 그 가방들을 모아놓은 박스(List) 개념 memo라는 dto에 데이터들이 담겨있으므로
			List<memo>memolist = dao.getAllBoard(startRow, endRow); 
			number = count - (currentPage * pageSize);
			
			/////////////////////////////////////////////여기까지 게시판 페이징 memolist.jsp쪽으로 request객체에 담아서 넘겨주기
			request.setAttribute("m", memolist);
			request.setAttribute("number", number);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("count", count);
			request.setAttribute("currentPage", currentPage);
			
			
			
			
//			List<memo> memolist2 = dao.getMemoList();
//
//			// 데이터 저장
//			request.setAttribute("memolist", memolist2);

			// view 페이지 설정
			RequestDispatcher dis = request.getRequestDispatcher("/memolist.jsp");

			// forward
			dis.forward(request, response);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
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

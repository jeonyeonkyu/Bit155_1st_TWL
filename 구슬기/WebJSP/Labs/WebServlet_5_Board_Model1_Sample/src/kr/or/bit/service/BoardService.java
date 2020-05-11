package kr.or.bit.service;

import java.util.List;

import javax.naming.NamingException;

import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;

//JSP 받는 요청(서비스)를 실행하는 부분
public class BoardService {
	private static BoardService instance = new BoardService();
	private BoardService() {}
	public static BoardService getInBoardService() {
		return instance;
	}
	
	//서비스 요청( 글쓰기 서비스!! 나 글쓰고 싶어~!)
	public int writeOk(Board boarddata) throws Exception {
		BoardDao dao = new BoardDao();
		int result = dao.writeok(boarddata);
		return result; 
	}
	
	//서비스 요청( 글 목록 보여주는 서비스) 나 글볼래~! 
	//jsp 가 얘한테 서비스요청.. 현재 보고싶은 페이지랑 사이즈 넘겨서.. 
	public List<Board> list(int cpage, int pagesize) throws Exception{
		BoardDao dao = new BoardDao();
		return dao.list(cpage, pagesize);
	}
	
	//서비스 요청(글목록 게시물 총 건수)
	public int totalBoardCount() throws Exception {
		BoardDao dao = new BoardDao();
		return dao.totalBoardCount();
	}
}

package kr.or.bit.service;

import java.util.List;

import javax.naming.NamingException;

import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;

//�Ը� Ŀ���� ����, ������ �Ҹ���
//jsp�� �޴� ��û(����)�� �����ϴ� �κ�
public class BoardService {
	
	private static BoardService instance = new BoardService();
	private BoardService() {}
	public static BoardService getInBoardService() {
		return instance;
	}
	
	//���� ��û(�۾���)
	public int writeOk(Board boarddata) throws Exception {
		BoardDao dao = new BoardDao();
		int result = dao.writeok(boarddata);
		return result;
	}
	
	//���� ��û(�� ��� �����ֱ�)
	public List<Board> list(int cpage, int pagesize) throws Exception{
		BoardDao dao = new BoardDao();
		return dao.list(cpage, pagesize);
	}
	
	//���� ��û(�۸�Ͽ��� �Խù� �� �Ǽ�)
	public int totalBoardCount() throws Exception {
		BoardDao dao = new BoardDao();
		return dao.totalBoardCount();
	}
	
	
}

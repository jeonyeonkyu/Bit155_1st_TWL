package kr.or.bit.service;

import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.Reply;

//�Ը� Ŀ���� ����, ������ �Ҹ���
//jsp�� �޴� ��û(����)�� �����ϴ� �κ�
public class BoardService {

	private static BoardService instance = new BoardService();

	private BoardService() {
	}

	public static BoardService getInBoardService() {
		return instance;
	}

	// ���� ��û(�۾���)
	public int writeOk(Board boarddata) throws Exception {
		BoardDao dao = new BoardDao();
		int result = dao.writeok(boarddata);
		return result;
	}

	// ���� ��û(�� ��� �����ֱ�)
	public List<Board> list(int cpage, int pagesize) throws Exception {
		BoardDao dao = new BoardDao();
		return dao.list(cpage, pagesize);
	}

	// ���� ��û(�۸�Ͽ��� �Խù� �� �Ǽ�)
	public int totalBoardCount() throws Exception {
		BoardDao dao = new BoardDao();
		return dao.totalBoardCount();
	}

	// ���� ��û(�� �󼼺���)
	public Board content(int idx) throws NamingException {
		return new BoardDao().getContent(idx);
	}

	// ���� ��û (�� �󼼺��� �� ��ȸ�� �����ϱ�)
	public boolean addReadNum(String idx) throws NamingException {
		return new BoardDao().getReadNum(idx);
	}

	// ���� ��û(�Խñ� �����ϱ�) : jspboard , reply
	public int board_Delete(String idx, String pwd) throws NamingException {
		return new BoardDao().deleteOk(idx, pwd);
	}

	// ���� ��û(��� �Է��ϱ�)
	public int replyWrite(int idx_fk, String writer, String userid, String content, String pwd) throws NamingException {
		return new BoardDao().replywrite(idx_fk, writer, userid, content, pwd);
	}

	// ���� ��û(��� ��� ��ȸ�ϱ�)
	public List<Reply> replyList(String idx_fk) throws NamingException {
		return new BoardDao().replylist(idx_fk);
	}

	// ���� ��û(��� �����ϱ�)
	public int replyDelete(String no, String pwd) throws NamingException {
		return new BoardDao().replyDelete(no, pwd);
	}

	// ���� ��û(�Խù� ����ȸ > ��� ����(rewriteok)
	public int rewriteok(Board boardata) throws Exception {
		return new BoardDao().reWriteOk(boardata);
	}

	// ���� ��û(���� ������ ��ȸ )
	public Board board_EditContent(String idx) throws NamingException {
		return new BoardDao().getEditContent(idx);
	}

	// �ٸ� �׽�Ʈ (Board DTO Parameter ���)
	// request ��û ��ü�� Parameter ��� (���� : view �ڵ� ����)
	public int board_Edit(HttpServletRequest req) throws NamingException {
		//���⼭ request.get ����...
		return new BoardDao().boardEdit(req);
	}

}

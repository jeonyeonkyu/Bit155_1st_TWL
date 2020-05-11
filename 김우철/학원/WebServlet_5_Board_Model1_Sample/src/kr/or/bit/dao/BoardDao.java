package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.bit.dto.Board;

/* CRUD �Լ�  >> ConnectionPool > �Լ� ���� ����, ��ȯ*/
public class BoardDao {
	DataSource ds = null;

	public BoardDao() throws NamingException {
		Context context = new InitialContext(); // ���� ������Ʈ�� �̸���� �˻�
		ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");// java:comp/env/ + name
	}

	// �۾��� (������)
	public int writeok(Board boarddata) {
		// insert into
		// jspboard(idx,writer,pwd,subject,cntent,email,homepage,writedate,readnum,filename,filesize,refer)
		// values(jspboard_idx.nextval,?,?,?,?,?,?,sysdate,0,?,0,?)
		// nextval�� �ι����� ������ ���� �׷��� refer���� ���α��ϴ� �Լ��� ����
		// insert�� ���ÿ� refer���� ���� ���� ����..

		// ������ �Խ���
		// refer, step, depth
		// 1. ������ : refer, step(0) default, depth(0) default
		// 2. �亯�� : refer, step + 1, depth + 1

		// ������ : step, depth >> NUMBER DEFAULT 0 (insert ���� ������.. 0�� default�� ��)
		Connection conn = null;
		PreparedStatement pstmt = null;
		int row = 0;
		try {
			conn = ds.getConnection();
			String sql = "insert into jspboard(idx,writer,pwd,subject,content,email,homepage,writedate,readnum,filename,filesize,refer)"
					+ "values(jspboard_idx.nextval,?,?,?,?,?,?,sysdate,0,?,0,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, boarddata.getWriter());
			pstmt.setString(2, boarddata.getPwd());
			pstmt.setString(3, boarddata.getSubject());
			pstmt.setString(4, boarddata.getContent());
			pstmt.setString(5, boarddata.getEmail());
			pstmt.setString(6, boarddata.getHomepage());
			pstmt.setString(7, boarddata.getWriter());

			// refer
			int refermax = getMaxRefer();
			int refer = refermax + 1;

			pstmt.setInt(8, refer);

			row = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);

		} finally {
			try {
				pstmt.close();
				conn.close(); // Ŀ�ؼ�Ǯ ��ȯ
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}

	// �����ۿ� ���� refer �� ���ϱ�
	public int getMaxRefer() {
		// select nvl(max(refer),0) from jspboard //���� �ϳ��� �Ⱦ����¼��� refer�� null�̱� ������ nvl
		// ������ -> ó�����ΰ�� 0�� ����
		// >> refer�� ó�� ���� 1�� �����ϰ� �Ұ�� ... refer + 1
		// select nvl(max(refer),0) from jspboard >> ó�� �� >> 0 >> refer + 1 ����
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int refer_max = 0;
		try {
			conn = ds.getConnection(); // �����ּ���^^ �̵� �ݳ��ҰԿ�
			String sql = "select nvl(max(refer),0) from jspboard";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				refer_max = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close(); // �ݳ��̿� ^^
			} catch (Exception e) {

			}
		}
		return refer_max;

	}

	// �۾���(���)

	// �Խù� ��Ϻ���
	public List<Board> list(int cpage, int pagesize) {

		// int cpage : ���� ������� ������ ��ȣ [5]
		// int pagesize ������ ���� pagesize 5

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = null;

		try {
			conn = ds.getConnection();
			// �ڡڡڡ� �߿�
			String sql = "select * from  "
					+ "(select rownum rn , idx ,writer , email, homepage, pwd , subject , content, writedate, readnum "
					+ "	                 , filename, filesize , refer , depth , step "
					+ "             from ( SELECT * FROM jspboard ORDER BY refer DESC , step ASC ) " + // ��frmo �ζ��� ����
																										// ������ �Ǵ�
																										// ������(�߿�)
					"             where rownum <= ?" + // end row
					") where rn >= ?"; // start row
			pstmt = conn.prepareStatement(sql);

			// ���İ��� ����(� �����ڰ� ����) 3~4���� ���� (���� �������� ���̽��� ����ߵ�)
			// ��뷮�Խ����� ���̴� ����
			// cpage >> 1
			// pagesize >> 5

			int start = cpage * pagesize - (pagesize - 1); // 1*5 -(5-1) = 1
			int end = cpage * pagesize; // 1 * 5 = 5

			pstmt.setInt(1, end);
			pstmt.setInt(2, start);

			rs = pstmt.executeQuery();
			list = new ArrayList<Board>();
			while (rs.next()) {
				Board board = new Board();
				board.setIdx(rs.getInt("idx"));
				board.setSubject(rs.getString("subject"));
				board.setWriter(rs.getString("writer"));
				board.setWritedate(rs.getDate("writedate"));
				board.setReadnum(rs.getInt("readnum"));
				// ������
				board.setRefer(rs.getInt("refer"));
				board.setStep(rs.getInt("step"));
				board.setDepth(rs.getInt("depth"));

				list.add(board); // ������ ...
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close(); // ��ȯ
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}

		}
		return list;

		/*
		 * [1][2][3][4][5][����] [����][6][7][8][9][10][����] [����][11][12]
		 * 
		 * [1] page ũ�� > pagesize ���� totaldata > 54�� pagesize = 5 ��Ģ > totalpagecount=11
		 * (��ü ������ ����)
		 * 
		 * int cpage >> currentpage(���� ������ ��ȣ) >> 1page ,2page
		 * 
		 * ���� ������ 100�� cpage : 1 , pagesize : 5 > start(���۱۹�ȣ) 1 ~ end(�۹�ȣ) 5 cpage : 2
		 * , pagesize : 5 > start(���۱۹�ȣ) 6 ~ end(�۹�ȣ) 10 cpage : 11 , pagesize : 5 >
		 * start(���۱۹�ȣ) 51 ~ end(�۹�ȣ) 55 -5���� ��� 11��° ������ �����ּ���
		 * 
		 * 
		 * //����ǥ ���� �������� �̾Ƴ� �Ʒ� 2���� ������ ����¡ó�� ���� �׽�Ʈ �ϱ� SELECT * FROM ( SELECT ROWNUM rn
		 * , idx , writer , email, homepage, pwd , subject , content, writedate, readnum
		 * , filename, filesize , refer , depth , step FROM ( SELECT * FROM jspboard
		 * ORDER BY refer DESC , step ASC ) ) WHERE rn BETWEEN ? AND ?;
		 * 
		 * -------------------------------------------------------------------- select *
		 * from ( select rownum rn , idx , writer , email, homepage, pwd , subject ,
		 * content, writedate, readnum , filename, filesize , refer , depth , step from
		 * ( SELECT * FROM jspboard ORDER BY refer DESC , step ASC ) where rownum <= 6
		 * --endrow ) where rn >= 4; --firstrow
		 * 
		 * SELECT * FROM ( SELECT ROWNUM rn , idx , writer , email, homepage, pwd ,
		 * subject , content, writedate, readnum , filename, filesize , refer , depth ,
		 * step FROM ( SELECT * FROM jspboard ORDER BY refer DESC , step ASC ) ) WHERE
		 * rn BETWEEN 1 AND 5;
		 * 
		 * 
		 * select * from ( select rownum rn , idx , writer , email, homepage, pwd ,
		 * subject , content, writedate, readnum ,filename, filesize , refer , depth ,
		 * step from ( SELECT * FROM jspboard ORDER BY refer DESC , step ASC ) where
		 * rownum <= 10 --endrow ) where rn >= 6; --firstrow
		 */

	}

	// �Խù� �� �Ǽ�
	public int totalBoardCount() {
		Connection conn = null;
		PreparedStatement pstmt = null; // �Ķ���͸� �Ƚ��Ƿ� ���� �ʿ�� ����
		ResultSet rs = null;
		int totalcount = 0;
		try {
			conn = ds.getConnection();
			String sql = "select count(*) cnt from jspboard"; // alias��
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalcount = rs.getInt("cnt"); // alias �ֱ� ������ 1�־�ε�
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close(); // ��ȯ�ϱ�
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return totalcount;
	}

}

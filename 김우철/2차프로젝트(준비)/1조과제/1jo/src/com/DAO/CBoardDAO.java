package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import com.DTO.Board;
import com.DTO.Reply;

/* CRUD 함수  >> ConnectionPool > 함수 단위 연결, 반환*/
public class CBoardDAO {
	DataSource ds = null;

	public CBoardDAO() {
		try {
			Context context = new InitialContext(); // 현재 프로젝트에 이름기반 검색
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");// java:comp/env/ + name
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	// 글쓰기 (원본글)
	public int writeok(Board boarddata) {
		// insert into
		// jspboard(idx,writer,pwd,subject,cntent,email,homepage,writedate,readnum,filename,filesize,refer)
		// values(jspboard_idx.nextval,?,?,?,?,?,?,sysdate,0,?,0,?)
		// nextval을 두번쓰면 문제가 생김 그래서 refer값을 따로구하는 함수를 만듬
		// insert와 동시에 refer값을 뽑을 수가 없음..

		// 계층형 게시판
		// refer, step, depth
		// 1. 원본글 : refer, step(0) default, depth(0) default
		// 2. 답변글 : refer, step + 1, depth + 1

		// 원본글 : step, depth >> NUMBER DEFAULT 0 (insert 하지 않으면.. 0이 default로 들어감)
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
				conn.close(); // 커넥션풀 반환
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}

	// 원본글에 대한 refer 값 구하기
	public int getMaxRefer() {
		// select nvl(max(refer),0) from jspboard //글을 하나도 안쓴상태서는 refer가 null이기 때문에 nvl
		// 씌우면됨 -> 처음글인경우 0이 나옴
		// >> refer의 처음 값이 1로 시작하게 할경우 ... refer + 1
		// select nvl(max(refer),0) from jspboard >> 처음 글 >> 0 >> refer + 1 값을
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int refer_max = 0;
		try {
			conn = ds.getConnection(); // 빌려주세여^^ 이따 반납할게요
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
				conn.close(); // 반납이요 ^^
			} catch (Exception e) {

			}
		}
		return refer_max;

	}

	// 글쓰기(답글)

	// 게시물 목록보기
	public List<Board> list(int cpage, int pagesize) {

		// int cpage : 현재 보고싶은 페이지 번호 [5]
		// int pagesize 나누고 싶은 pagesize 5

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = null;

		try {
			conn = ds.getConnection();
			// ★★★★ 중요
			String sql = "select * from  "
					+ "(select rownum rn , idx ,writer , email, homepage, pwd , subject , content, writedate, readnum "
					+ "	                 , filename, filesize , refer , depth , step "
					+ "             from ( SELECT * FROM jspboard ORDER BY refer DESC , step ASC ) " + // ★frmo 인라인 절은
																										// 기준이 되는
																										// 데이터(중요)
					"             where rownum <= ?" + // end row
					") where rn >= ?"; // start row
			pstmt = conn.prepareStatement(sql);

			// 공식같은 로직(어떤 개발자가 만듬) 3~4가지 있음 (절대 에외적인 케이스가 없어야됨)
			// 대용량게시판이 쓰이는 로직
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
				// 계층형
				board.setRefer(rs.getInt("refer"));
				board.setStep(rs.getInt("step"));
				board.setDepth(rs.getInt("depth"));

				list.add(board); // 데이터 ...
				System.out.println(list);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close(); // 반환
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}

		}
		return list;

		/*
		 * [1][2][3][4][5][다음] [이전][6][7][8][9][10][다음] [이전][11][12]
		 * 
		 * [1] page 크기 > pagesize 정의 totaldata > 54건 pagesize = 5 규칙 > totalpagecount=11
		 * (전체 페이지 개수)
		 * 
		 * int cpage >> currentpage(현재 페이지 번호) >> 1page ,2page
		 * 
		 * 현재 데이터 100건 cpage : 1 , pagesize : 5 > start(시작글번호) 1 ~ end(글번호) 5 cpage : 2
		 * , pagesize : 5 > start(시작글번호) 6 ~ end(글번호) 10 cpage : 11 , pagesize : 5 >
		 * start(시작글번호) 51 ~ end(글번호) 55 -5개씩 묶어서 11번째 묶음을 보여주세요
		 * 
		 * 
		 * //물음표 값을 공식으로 뽑아냄 아래 2개의 계층형 페이징처리 쿼리 테스트 하기 SELECT * FROM ( SELECT ROWNUM rn
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

	// 게시물 총 건수
	public int totalBoardCount() {
		Connection conn = null;
		PreparedStatement pstmt = null; // 파라미터를 안스므로 굳이 필요는 없음
		ResultSet rs = null;
		int totalcount = 0;
		try {
			conn = ds.getConnection();
			String sql = "select count(*) cnt from jspboard"; // alias줌
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalcount = rs.getInt("cnt"); // alias 주기 싫으면 1넣어두됨
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close(); // 반환하기
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return totalcount;
	}

	// 게시물 상세보기
	public Board getContent(int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board board = null;

		try {
			conn = ds.getConnection();
			String sql = "select * from jspboard where idx=?"; // * 하지 말자
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				String writer = rs.getString("writer");
				String email = rs.getString("email");
				String homepage = rs.getString("homepage");
				String pwd = rs.getString("pwd");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				String filename = rs.getString("filename");

				java.sql.Date writedate = rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int filesize = rs.getInt("filesize");

				// 계층형
				int refer = rs.getInt("refer");
				int step = rs.getInt("step");
				int depth = rs.getInt("depth");

				board = new Board(idx, writer, pwd, subject, content, writedate, readnum, filename, filesize, homepage,
						email, refer, depth, step);
			}

		} catch (Exception e) {
			System.out.println("content: " + e.getMessage());
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();// 반환하기
			} catch (Exception e2) {

			}
		}

		return board;
	}

	// 게시글 조회수 증가
	public boolean getReadNum(String idx) {
		// update jspboard set readnum = readnum + 1 where idx=?
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		try {
			conn = ds.getConnection();
			String sql = "update jspboard set readnum = readnum + 1 where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);

			int row = pstmt.executeUpdate();
			if (row > 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();// 반환
			} catch (Exception e) {

			}
		}
		return result;
	}

	// 게시글 삭제하기(제일 복잡)(여기예제는 case 1)
	public int deleteOk(String idx, String pwd) {
		// 일반게시판 : 삭제 ...

		// 계층형 게시판 : 답글
		/*
		 * 1. 원본글 (답글이 있는 경우) 2. 원본글 (답글이 없는 경우) : 그냥 삭제
		 * 
		 * 원본글 (답글이 있는 경우) case 1: 원본글이 삭제시 답변글 있으면 다 삭제 (같은 refer delete) case 2:
		 * (네이버)원본글만 삭제 -> 나머지 처리 (텍스트 형태 (원본글 삭제 표시) (step, depth) case 3: 삭제시 삭제되었을 표시
		 * (쌤피셜 이게 괜찮은듯) ( 게시판 설계 (delok :삭제여부 컬럼 :1) >> 삭제 : 0 >> update .. 0 case 4:
		 * 삭제 못하게 한다 (답글이 있으면) refer count > 1
		 */
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;
		try {
			conn = ds.getConnection();
			// 비인증 ..
			// 삭제 > 비번
			// 처리 > 글번호 ,비번

			// 비번검증
			String sql_pwd = "select pwd from jspboard where idx=?";

			// 두개의 테이블 (FK) : 자식부터 삭제 , 부모 삭제
			// jspboard(pk) , reply(fk:idx)
			// reply idx_fk=1 delete, jspboard idx=1 delete
			String sql_reply = "delete from reply where idx_fk=?";
			// 댓글을 먼저 지우지 않으면 foreign key 에러 발생

			// 게시글 삭제
			String sql_board = "delete from jspboard where idx=?";

			pstmt = conn.prepareStatement(sql_pwd);
			pstmt.setString(1, idx);
			rs = pstmt.executeQuery();
			if (rs.next()) { // 삭제글은 존재
				// 사용자가 입력한 비번 , DB 비번
				if (pwd.equals(rs.getString("pwd"))) {
					// 실 삭제 처리
					// 트랜잭션 (둘다 처리 , 둘다 실패)
					// 두개를 하나의 논리적 단위
					// JDBC : auto commit
					conn.setAutoCommit(false);// 개발자가 rollback , commit 강제
					// 댓글삭제
					pstmt = conn.prepareStatement(sql_reply);
					pstmt.setString(1, idx);
					pstmt.executeUpdate();

					// 게시글 삭제 (원본글 , 답글)
					pstmt = conn.prepareStatement(sql_board);
					pstmt.setString(1, idx);
					row = pstmt.executeUpdate();

					if (row > 0) {
						conn.commit(); // 두개의 delete 실반영
					}

				} else { // 비밀번호가 일치 하지 않는 경우
					row = -1;
				}
			} else { // 삭제하는 글이 존재하지 않는 경우
				row = 0;
			}

		} catch (Exception e) {
			// rollback
			// 예외가 발생하면
			try {
				conn.rollback();
			} catch (SQLException e1) {

				e1.printStackTrace();
			}
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();// 반환
			} catch (Exception e2) {

			}
		}
		return row;
	}

	// 댓글 입력하기 (Table reply : fk(jspboard idx) )
	public int replywrite(int idx_fk, String writer, String userid, String content, String pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int row = 0;
		try {
			conn = ds.getConnection();
			String sql = "insert into reply(no,writer,userid,content,pwd,idx_fk) "
					+ " values(reply_no.nextval,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, userid);
			pstmt.setString(3, content);
			pstmt.setString(4, pwd);
			pstmt.setInt(5, idx_fk);

			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();// 반환
			} catch (Exception e) {

			}
		}

		return row;
	}

	// 댓글 조회하기
	public List<Reply> replylist(String idx_fk) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Reply> list = null;

		try {
			conn = ds.getConnection();
			String reply_sql = "select * from reply where idx_fk=? order by no desc";
			// select * 는 하지말고 칼럼써라?

			pstmt = conn.prepareStatement(reply_sql);
			pstmt.setString(1, idx_fk);

			rs = pstmt.executeQuery();

			list = new ArrayList<>();
			while (rs.next()) {
				int no = Integer.parseInt(rs.getString("no"));
				String writer = rs.getString("writer");
				String userid = rs.getString("userid");
				String pwd = rs.getString("pwd");
				String content = rs.getString("content");
				java.sql.Date writedate = rs.getDate("writedate");
				int idx = Integer.parseInt(rs.getString("idx_fk"));

				Reply replydto = new Reply(no, writer, userid, pwd, content, writedate, idx);
				list.add(replydto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();// 반환
			} catch (Exception e) {

			}
		}

		return list;
	}

	// 댓글 삭제하기
	public int replyDelete(String no, String pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;

		try {

			// 이부분은 자기마음
			String replyselect = "select pwd from reply where no=?";
			String replydelete = "delete from reply where no=?";

			conn = ds.getConnection();
			pstmt = conn.prepareStatement(replyselect);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbpwd = rs.getString("pwd");
				if (pwd.equals(dbpwd)) {
					pstmt.close();
					pstmt = conn.prepareStatement(replydelete);
					pstmt.setString(1, no);
					row = pstmt.executeUpdate();
				} else {
					row = 0;
				}
			} else {
				row = -1;
			}
		} catch (Exception e) {

		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();// 반환
			} catch (Exception e) {

			}
		}

		return row;
	}

	// 게시글 상세 (답글 쓰기)
	public int reWriteOk(Board boardata) {
		// content.jsp ->(답글)-> rewrite.jsp(입력) -> submit() -> rewriteok.jsp
		// 게시물 글쓰기(INSERT > 답글 ....) : refer , step , depth
		// 내가 답글을 달려하는 하는 글의 글번호가 필요해요

		// refer , step , depth 설정을 하려면 기존 정보(read 글)
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = ds.getConnection();

			int idx = boardata.getIdx(); // 현재 읽은 글의 글번호

			String writer = boardata.getWriter();
			String email = boardata.getEmail();
			String homepage = boardata.getHomepage();
			String pwd = boardata.getPwd();
			String subject = boardata.getSubject();
			String content = boardata.getContent();
			String filename = boardata.getFilename();
			int filesize = 0;

			/*
			 * 1.원본글(현재 read한 게시글) : refer, depth, step >> select필요
			 * 
			 * 2.답글에 대한 순서 : 나중에 쓴 답글이 위로 올라가게 함(최신글 위로) -> update가 들어가야함 String
			 * step_update_sql =
			 * "update jspboard set step= step+1 where step  > ? and refer =? "; //
			 * "update jspboard set step= step+1 where step > 0 and refer =1 ";
			 * 
			 * 3.답글 insert
			 * 
			 */

			// 1. 답글
			// 현재 내가 읽은 글의 refer , depth , step(원본글, 답글이 될 수도 있음)
			String refer_depth_step_sal = "select refer , depth , step from jspboard where idx=?";

			// 2. 위치
			// step (순서) : 나중에 쓴 답글이 위로 올라오게 하겠다
			// 내가 읽은 글의 step 보다 큰 값은 +1 해서 증가 시켜 놓는다
			// refer 값으로 판단
			// ex) 원본글 refer=1 , step=0 , depth=0
			// 원본글답글 refer=1 , step=1+1 >2 >3, depth=1
			// 원본글답글 refer=1 , step=1>2 , depth=1
			// 원본글답글 refer=1 , step=0+1>1
			String step_update_sql = "update jspboard set step= step+1 where step  > ? and refer =? ";
			// "update jspboard set step= step+1 where step > 0 and refer =1 ";

			// 답글 insert
			String rewrite_sql = "insert into jspboard(idx,writer,pwd,subject,content,email,homepage,writedate,readnum,filename,filesize,refer,depth,step)"
					+ " values(jspboard_idx.nextval,?,?,?,?,?,?,sysdate,0,?,0,?,?,?)";

			pstmt = conn.prepareStatement(refer_depth_step_sal);
			// prepareStatement : 쿼리문을 컴파일
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();

			if (rs.next()) { // 데이터가 있다면... 원본글의 refer와 step과 depth가 존재한다면 탐
				int refer = rs.getInt("refer");
				int step = rs.getInt("step");
				int depth = rs.getInt("depth");

				pstmt = conn.prepareStatement(step_update_sql);
				// prepareStatement을 재활용 할라면 다시 컴파일해야됨(불편)
				// 기존 step의 +1하는 업데이트 구문 실행, 내가 들어갈 자리가 만들어짐
				pstmt.setInt(1, step);
				pstmt.setInt(2, refer);
				pstmt.executeUpdate();

				// filename,filesize,refer,depth,step
				pstmt = conn.prepareStatement(rewrite_sql); // 컴파일
				pstmt.setString(1, writer);
				pstmt.setString(2, pwd);
				pstmt.setString(3, subject);
				pstmt.setString(4, content);
				pstmt.setString(5, email);
				pstmt.setString(6, homepage);
				pstmt.setString(7, filename);

				// 답변
				pstmt.setInt(8, refer);
				pstmt.setInt(9, depth + 1); // 규칙 현재 읽은 글에 depth + 1 ★★★★★
				pstmt.setInt(10, step + 1); // 순서 update 통해서 자리 확보 + 1 ★★★★★

				int row = pstmt.executeUpdate();
				if (row > 0) {
					result = row;
				} else {
					result = -1;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();// 반환
			} catch (Exception e) {

			}
		}

		return result;
	}

	// 게시글 수정하기 화면(답글)
	public Board getEditContent(String idx) {
		return this.getContent(Integer.parseInt(idx));
		// 조회화면 동일 (기존에 있는 함수 재활용)
	}

	// 게시글 수정하기 처리(이렇게 해도 됨)
	// public int boardEdit(Board boarddata){}
	public int boardEdit(HttpServletRequest boarddata) {
		String idx = boarddata.getParameter("idx");
		String pwd = boarddata.getParameter("pwd");
		String writer = boarddata.getParameter("writer");
		String email = boarddata.getParameter("email");
		String homepage = boarddata.getParameter("homepage");
		String subject = boarddata.getParameter("subject");
		String content = boarddata.getParameter("content");
		String filename = boarddata.getParameter("filename");

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;

		try {
			conn = ds.getConnection();
			String sql_idx = "select idx  from jspboard where idx=? and pwd=?";
			String sql_udpate = "update jspboard set writer=? , email=? , homepage=? ,"
					+ " subject=? , content=? , filename=? where idx=?";
			pstmt = conn.prepareStatement(sql_idx);
			pstmt.setString(1, idx);
			pstmt.setString(2, pwd);

			rs = pstmt.executeQuery();
			// 판단 (데이터 있다며 : 수정가능 , 없다면 : 수정불가
			if (rs.next()) {
				// 경고
				pstmt.close();
				// 업데이트
				pstmt = conn.prepareStatement(sql_udpate);
				pstmt.setString(1, writer);
				pstmt.setString(2, email);
				pstmt.setString(3, homepage);
				pstmt.setString(4, subject);
				pstmt.setString(5, content);
				pstmt.setString(6, filename);
				pstmt.setString(7, idx);
				row = pstmt.executeUpdate();
				// System.out.println("row : " + row);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();// 반환
			} catch (Exception e2) {

			}
		}

		return row;
	}

}

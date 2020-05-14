package kr.or.bit.dao;

import javax.sql.DataSource;

import kr.or.bit.dto.Emp;
import kr.or.bit.utils.ConnectionHelper;
import kr.or.bit.utils.DB_Close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

import javax.naming.Context;
import javax.naming.InitialContext;

public class EmpDao {

	private static EmpDao empDao;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result;
	DataSource ds = null;

	public EmpDao() {
		try {
			Context context = new InitialContext(); // 현재 프로젝트에 이름기반 검색
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");// java:comp/env/ + name
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//등록하기
	public int insertEmp(long empno, String ename, String job, long mgr, String hiredate, long sal, long comm,
			long deptno) {
		Connection conn = null;// 추가

		try {
			conn = ConnectionHelper.getConnection("oracle");// 추가

			System.out.println(hiredate);
			String sql = "insert into emp(empno,ename,job,mgr,hiredate,sal,comm,deptno) values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, empno);
			pstmt.setString(2, ename);
			pstmt.setString(3, job);
			pstmt.setLong(4, mgr);
			pstmt.setDate(5, transformDate(hiredate));
			pstmt.setLong(6, sal);
			pstmt.setLong(7, comm);
			pstmt.setLong(8, deptno);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Insert : " + e.getMessage());
		} finally {
			DB_Close.close(pstmt);
			try {
				conn.close(); // 받환하기
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	//EmpDao 싱글턴
	public static synchronized EmpDao getInstance() {
		if (empDao == null) {
			empDao = new EmpDao();
		}
		return empDao;
	}

	// 날짜가 yyyymmdd 형식으로 입력되었을 경우 Date로 변경하는 메서드
	public Date transformDate(String date) {
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyymmdd");

		// Date로 변경하기 위해서는 날짜 형식을 yyyy-mm-dd로 변경해야 한다.
		SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-mm-dd");

		java.util.Date tempDate = null;

		// 현재 yyyymmdd로된 날짜 형식으로 java.util.Date객체를 만든다.
		try {
			tempDate = beforeFormat.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// java.util.Date를 yyyy-mm-dd 형식으로 변경하여 String로 반환한다.
		String transDate = afterFormat.format(tempDate);

		// 반환된 String 값을 Date로 변경한다.
		Date d = Date.valueOf(transDate);

		return d;
	}

	//삭제하기
	public int deleteEmp(long empno) {
		//일반게시판 : 삭제 ...
		
		//계층형 게시판 : 답글 
		/*
		 1. 원본글 (답글이 있는 경우)
		 2. 원본글 (답글이 없는 경우) : 그냥 삭제
		 
		원본글 (답글이 있는 경우)
		case 1: 원본글이 삭제시 답변글 있으면 다 삭제 (같은 refer delete)
		case 2: (네이버)원본글만 삭제 -> 나머지 처리 (텍스트 형태 (원본글 삭제 표시) (step, depth)
		case 3: 삭제시 삭제되었을 표시 ( 게시판 설계 (delok :삭제여부 컬럼 :1) >> 삭제 : 0 >> update .. 0
		case 4: 삭제 못하게 한다 (답글이 있으면) refer count > 1
		*/
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;
		try {
				conn = ds.getConnection();
				//비인증 ..
				//삭제 > 비번 
				//처리 > 글번호 ,비번
				
				//비번검증
				String sql_empno="select empno from emp where empno=?";
				
				//게시글 삭제
				String sql_board="delete from emp where empno=?";
				
				pstmt = conn.prepareStatement(sql_empno);
				pstmt.setLong(1, empno);
				rs = pstmt.executeQuery();
				if(rs.next()) { //삭제글은 존재
					//사용자가 입력한 비번 , DB 비번
						 //실 삭제 처리
						 //트랜잭션 (둘다 처리 , 둘다 실패)
						 //두개를 하나의 논리적 단위
						 //JDBC : auto commit 
						 conn.setAutoCommit(false);//개발자가 rollback , commit 강제
						 	
						 	//게시글 삭제 (원본글 , 답글)
						 	pstmt = conn.prepareStatement(sql_board);
						 	pstmt.setLong(1,empno);
						 	row = pstmt.executeUpdate();
						 	
						 	if(row > 0) {
						 		conn.commit(); //두개의 delete 실반영
	
					 }else { //비밀번호가 일치 하지 않는 경우
						  row = -1;
					 }
				}else { //삭제하는 글이 존재하지 않는 경우
					row = 0;					
				}
				
				
		} catch (Exception e) {
			//rollback 
			//예외가 발생하면
			try {
				conn.rollback();
			} catch (SQLException e1) {
				
				e1.printStackTrace();
			}
		}finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();//반환
			} catch (Exception e2) {
				
			}
		}
		return row;
	}
	// 게시물 총 건수 구하기
		public int totallistCount() {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int totalcount = 0;
			try {
				conn = ds.getConnection(); // dbcp 연결객체 얻기
				String sql = "select count(*) cnt from emp";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					totalcount = rs.getInt("cnt");
				}
			} catch (Exception e) {

			} finally {
				try {
					pstmt.close();
					rs.close();
					conn.close();// 반환 connection pool 에 반환하기
				} catch (Exception e) {

				}
			}
			return totalcount;
		}

		// 이거로 전체 조회
		public List<Emp> list() {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			List<Emp> list = null;
			try {
				conn = ds.getConnection();
				String sql = "select * from emp";
				pstmt = conn.prepareStatement(sql);

				rs = pstmt.executeQuery();
				list = new ArrayList<Emp>();
				while (rs.next()) {

					Emp emp = new Emp();
					emp.setDeptno(rs.getLong("deptno"));
					emp.setEmpno(rs.getLong("empno"));
					emp.setEname(rs.getString("ename"));
					emp.setJob(rs.getString("job"));
					emp.setComm(rs.getLong("comm"));
					emp.setHiredate(rs.getDate("hiredate"));
					emp.setMgr(rs.getLong("mgr"));
					emp.setSal(rs.getLong("sal"));

					list.add(emp);
				}

			} catch (Exception e) {
				System.out.println("오류 :" + e.getMessage());
			} finally {
				try {
					pstmt.close();
					rs.close();
					conn.close();// 반환
				} catch (Exception e2) {

				}
			}

			return list;

		}

		public Emp detailList(Long empno) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Emp emp = new Emp();
			try {
				conn = ds.getConnection();
				String sql = "select * from emp where empno = ?";
				pstmt = conn.prepareStatement(sql);

				pstmt.setLong(1, empno);
				
				rs = pstmt.executeQuery();
				while (rs.next()) {
					emp.setDeptno(rs.getLong("deptno"));
					emp.setEmpno(rs.getLong("empno"));
					emp.setEname(rs.getString("ename"));
					emp.setJob(rs.getString("job"));
					emp.setComm(rs.getLong("comm"));
					emp.setHiredate(rs.getDate("hiredate"));
					emp.setMgr(rs.getLong("mgr"));
					emp.setSal(rs.getLong("sal"));
				}

			} catch (Exception e) {
				System.out.println("오류 :" + e.getMessage());
			} finally {
				try {
					pstmt.close();
					rs.close();
					conn.close();// 반환
				} catch (Exception e2) {

				}
			}

			return emp;

		}

	}


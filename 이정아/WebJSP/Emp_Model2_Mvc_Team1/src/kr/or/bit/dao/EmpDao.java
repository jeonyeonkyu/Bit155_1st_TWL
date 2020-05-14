package kr.or.bit.dao;

import javax.sql.DataSource;

import kr.or.bit.dto.Emp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;

public class EmpDao {

	DataSource ds = null;

	public EmpDao() {
		try {
			Context context = new InitialContext(); // 현재 프로젝트에 이름기반 검색
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");// java:comp/env/ + name
		} catch (Exception e) {
			e.printStackTrace();
		}
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

	public List<Emp> list(int cpage, int pagesize) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<Emp> list = null;
		try {
			conn = ds.getConnection();
			String sql = "select * from  " + "(select rownum rn, empno, ename, job, mgr, hiredate, sal, comm, deptno"
					+ "             from emp " + // ★form 인라인 절은
													// 데이터(중요)
					"             where rownum <= ?" + // end row
					") where rn >= ?"; // start row
			pstmt = conn.prepareStatement(sql);

			int start = cpage * pagesize - (pagesize - 1); // 1*5 -(5-1) = 1
			int end = cpage * pagesize; // 1 * 5 = 5

			pstmt.setInt(1, end);
			pstmt.setInt(2, start);

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

	public Emp getContent(long empno) {
		// 상세보기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Emp emp = null;

		try {
			conn = ds.getConnection();
			String sql = "select * from emp where empno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, empno);

			rs = pstmt.executeQuery();
			if (rs.next()) {

				long deptno = rs.getLong("deptno");
				String ename = rs.getString("ename");
				String job = rs.getString("job");
				Date hiredate = rs.getDate("hiredate");
				Long mgr = rs.getLong("mgr");
				long comm = rs.getLong("comm");
				Long sal = rs.getLong("sal");
				//////////////////////////////// Emp에 생성자 추가
				emp = new Emp(empno, deptno, ename, job, comm, hiredate, mgr, sal);
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

		return emp;
	}

	// LoadJSON
	/*
	 * public Emp EnameSearch(String ename2) throws SQLException {
	 * 
	 * Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
	 * Emp emp = null; String ename = ename2; //% 들어가는 문자열 만드는거 총 두가지 방법 알려주심 String
	 * sql
	 * ="select deptno, ename, job, hiredate, mgr, comm, sal from emp where empno like '%"
	 * +ename+"%'"; System.out.println("empno"); conn = ds.getConnection();
	 * pstmt.setString(1, '%'+ename+'%'); rs= pstmt.executeQuery(); int rowcount=0;
	 * if(rs.next()){ rowcount = rs.getInt(1); //조회건수 }
	 * 
	 * if(rowcount > 0){ while(rs.next()){ long deptno = rs.getLong("deptno");
	 * String empno = rs.getString("empno"); String job = rs.getString("job"); Date
	 * hiredate = rs.getDate("hiredate"); Long mgr = rs.getLong("mgr"); long comm =
	 * rs.getLong("comm"); Long sal = rs.getLong("sal"); emp = new Emp(empno,
	 * deptno, ename, job, comm, hiredate, mgr, sal);
	 * 
	 * } return emp; }
	 * 
	 * }
	 */
//이미지 업로드
	
}

package kr.or.bit.dao;

import javax.sql.DataSource;

import kr.or.bit.dto.Emp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
	
	public List<Emp> chartList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Emp> list = new ArrayList<Emp>();
		try {
			conn = ds.getConnection();
			/*
			 * String sql = "select job , avg(sal)*12 sar\r\n" + "from emp\r\n" +
			 * "group by job\r\n" + "order by sar desc";
			 */
			String sql = "select * from vv2";
			pstmt = conn.prepareStatement(sql);

			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Emp emp = new Emp();
				emp.setJob(rs.getString("job"));
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

}

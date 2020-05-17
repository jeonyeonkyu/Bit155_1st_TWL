package bit.or.team4.dao;

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

import bit.or.team4.dto.emp;
import bit.or.team4.utils.SingletonHelper;

public class EmpDao {
	DataSource ds = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public EmpDao() throws NamingException {
		Context context = new InitialContext();
		ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
	}

	// 전체목록조회
	public List<emp> getEmpList() throws SQLException {
		String sql = "select empno,ename, job, mgr, hiredate, sal, nvl(comm, 0) comm, deptno from Emp";
		// POOL 연결 객체 얻어오기
		Connection conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		List<emp> emplist = new ArrayList<>();
		// []
		while (rs.next()) {
			emp emp = new emp();
			emp.setEmpno(rs.getInt("empno"));
			emp.setEname(rs.getString("ename"));
			emp.setJob(rs.getString("job"));
			emp.setMgr(rs.getInt("mgr"));
			emp.setHiredate("" + rs.getDate("hiredate"));
			emp.setSal(rs.getInt("sal"));
			emp.setComm(rs.getInt("comm"));
			emp.setDeptno(rs.getInt("deptno"));
			emplist.add(emp);
		}

		SingletonHelper.close(rs);
		SingletonHelper.close(pstmt);
		conn.close();
		return emplist;
	}

	// 사원번호로 조회
	public emp getEmpByEmpno(int empno) throws SQLException {
		conn = ds.getConnection();
		emp emp = new emp();
		try {
			String sql = "select empno,ename, job, mgr, hiredate, sal, file_path, deptno from Emp where empno=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, empno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				emp.setEmpno(rs.getInt("empno"));
				emp.setEname(rs.getString("ename"));
				emp.setJob(rs.getString("job"));
				emp.setMgr(rs.getInt("mgr"));
				emp.setHiredate("" + rs.getDate("hiredate"));
				emp.setSal(rs.getInt("sal"));
				emp.setFile_path(rs.getString("file_path"));
				emp.setDeptno(rs.getInt("deptno"));
				
				System.out.println(emp.getFile_path());
			}
		} catch (Exception e) {

		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
			conn.close();
		}
		return emp;
	}

	// 부서 번호 조회
	public List<emp> getEmpByDeptno(int deptno) throws SQLException {
		conn = ds.getConnection();
		List<emp> emplist = new ArrayList<>();
		try {
			String sql = "select empno,ename, job, mgr, hiredate, sal, nvl(comm, 0) comm, deptno from Emp where deptno=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				emp emp = new emp();
				emp.setEmpno(rs.getInt("empno"));
				emp.setEname(rs.getString("ename"));
				emp.setJob(rs.getString("job"));
				emp.setMgr(rs.getInt("mgr"));
				emp.setHiredate("" + rs.getDate("hiredate"));
				emp.setSal(rs.getInt("sal"));
				emp.setComm(rs.getInt("comm"));
				emp.setDeptno(rs.getInt("deptno"));
				emplist.add(emp);
			}

		} catch (Exception e) {

		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
			conn.close();
		}
		return emplist;
	}

	// 사원 등록
	public int insertEmp(int empno, String ename, String job, int mgr, String hiredate, int sal, int deptno)
			throws SQLException {
		int resultrow = 0;
		conn = ds.getConnection();
		try {

			String sql = "insert into emp(empno, ename, job, mgr, hiredate, sal, deptno) values(?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, empno);
			pstmt.setString(2, ename);
			pstmt.setString(3, job);
			pstmt.setInt(4, mgr);
			pstmt.setString(5, hiredate);
			pstmt.setInt(6, sal);
			pstmt.setInt(7, deptno);
			System.out.println(empno+ename+job+mgr+hiredate+sal+deptno);
			resultrow = pstmt.executeUpdate();
			System.out.println(hiredate);
		} catch (Exception e) {
			System.out.println("Insert :" + e.getMessage());
		} finally {
			SingletonHelper.close(pstmt);
			conn.close();
		}

		return resultrow;
	}

	// 사원 삭제
	public int deleteEmp(String empno) throws SQLException {
		conn = ds.getConnection();
		int resultrow = 0;
		try {
			String sql = "delete from emp where empno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empno);

			resultrow = pstmt.executeUpdate();
		} catch (Exception e) {

		} finally {
			SingletonHelper.close(pstmt);
			conn.close();
		}
		return resultrow;
	}
	
	//사원 수정
	public int editEmp(emp emp) throws SQLException {
		PreparedStatement pstmt = null;

		int rowcount = 0;
//		      System.out.println( "getDeptno"+emp.getDeptno());

		try {
			conn = ds.getConnection();
			String sql = "update emp set deptno=?, ename=?,job=?,mgr=?,sal=?,empno=?,file_path=? where empno=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, emp.getDeptno());
			pstmt.setString(2, emp.getEname());
			pstmt.setString(3, emp.getJob());
			pstmt.setInt(4, emp.getMgr());
			pstmt.setInt(5, emp.getSal());
			pstmt.setInt(6, emp.getEmpno());
			pstmt.setString(7, emp.getFile_path());
			pstmt.setInt(8, emp.getEmpno());
			rowcount = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			SingletonHelper.close(pstmt);
			conn.close();
		}
		return rowcount;
	}
	
	public emp getEmplistByEmpno(int empno) throws SQLException {
		conn = ds.getConnection();
		emp emp = new emp();
		try {
			String sql = "select empno,ename, job, mgr, hiredate, sal, nvl(comm, 0) comm, deptno from Emp where empno=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, empno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				emp.setEmpno(rs.getInt("empno"));
				emp.setEname(rs.getString("ename"));
				emp.setJob(rs.getString("job"));
				emp.setMgr(rs.getInt("mgr"));
				emp.setHiredate("" + rs.getDate("hiredate"));
				emp.setSal(rs.getInt("sal"));
				emp.setComm(rs.getInt("comm"));
				emp.setDeptno(rs.getInt("deptno"));
			}
		} catch (Exception e) {

		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
			conn.close();
		}
		return emp;
	}
	
	public List<emp> getChart() throws SQLException {
		String sql = "select ename, sal from Emp";
		// POOL 연결 객체 얻어오기
		Connection conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		List emplist = new ArrayList();
		// []
		while (rs.next()) {
			emp emp = new emp();
			String ename =rs.getString("ename");
			int sal =rs.getInt("sal");
			emplist.add(ename);
			emplist.add(sal);			
		}

		SingletonHelper.close(rs);
		SingletonHelper.close(pstmt);
		conn.close();
		return emplist;
	}
}
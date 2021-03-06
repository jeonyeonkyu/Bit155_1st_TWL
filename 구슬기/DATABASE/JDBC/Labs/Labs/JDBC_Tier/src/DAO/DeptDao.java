package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DTO.Dept;
import Utils.SingletonHelper;

//DAO 
//1. DB연결
//2. CRUD 함수
//3. 하나의 테이블을 대상으로 () >> Dept 테이블 대상으로 함수를 몇개 만들어야 할까요?? 
//(select(전체조회) 
//, select(1건..조건(PK)) where  (조건조회)
//, insert 
//, update 
//, delete)    이렇게 다섯개


public class DeptDao {
	
	//1. 전체조회 >> select 결과 >> return Multi row
	public List<Dept> getDeptAllList(){
		//DB 연결 >> 명령 >> 명령실행 >> 처리 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Dept> deptlist = new ArrayList<Dept>();
		
		
		try {
			conn = SingletonHelper.getConnection("oracle");
			String sql = "select deptno , dname, loc from dept";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();  
			
			while(rs.next()) {
				Dept dept = new Dept();
				dept.setDeptno(rs.getInt("deptno"));
				dept.setDname(rs.getString("dname"));
				dept.setLoc(rs.getString("loc"));
				deptlist.add(dept);   //[dept][dept]
			}
		} catch (Exception e) {
		System.out.println("예외 : " + e.getMessage());
		}finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
		}
		return deptlist;
	}
	
	//2. 조건조회 >> select ....where deptno =? >> parameter 설정되어 받아야함 >> return Single row 가 나옴.
	public Dept getDeptListByDeptno(int deptno) {
		//DB 연결 >> 명령 >> 명령실행 >> 처리
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Dept dept = new Dept();
		try {
			conn = SingletonHelper.getConnection("oracle");
			String sql = "select deptno , dname, loc from dept where deptno =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			rs = pstmt.executeQuery();    //파라메터만가지고 오라클서버로가서 물음표채운후 실행시킴
			//executeUpdate 는 DML 에서 쓴다. 
			
			if(rs.next()) {  //최소 한건의 데이터는 있다.
				do {  //한건이면 do 한번 하고 while 문에서 rs.next()만나서 탈출하거나 또 돈다.  그래서 아예 데이터 없는경우, 한개인경우, 여러개인 경우 다 가능하다. 
					
					dept.setDeptno(rs.getInt("deptno"));
					dept.setDname(rs.getString("dname"));
					dept.setLoc(rs.getString("loc"));
					//System.out.println(rs.getInt("deptno") + "/"+ rs.getString("dname")+ "/"+ rs.getString("loc"));
				} while (rs.next());  // 1건 이상인 경우에 돈다. 
				
			}else {  // 데이터가 없다.
				System.out.println("조회된 데이터가 없습니다.");
			}
		
		} catch (Exception e) {
		System.out.println("예외 : " + e.getMessage());
		}finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
		}
		return dept;
	}
	
	//3. 데이터 삽입
	//public int insertDept(int deptno, String dname, String loc) {}   이것도 좋지만 Dept 타입의 dept 주소를 받는다.(객체로 주고받자!)
	public int insertDept(Dept dept) {
		//DB 연결 >> 명령 >> 명령실행 >> 처리
				Connection conn = null;
				PreparedStatement pstmt = null;
				
				try {
					conn = SingletonHelper.getConnection("oracle");
					String sql = "insert into dept(deptno,dname,loc) values(?,?,?)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1,dept.getDeptno());
					pstmt.setString(2,dept.getDname());
					pstmt.setString(3,dept.getLoc());
					int row = pstmt.executeUpdate();
					if(row > 0) {
						System.out.println("insert row count : " + row );    
					}else {
						System.out.println("row count : " + row);   
					}
				
				} catch (Exception e) {
				System.out.println("예외 : " + e.getMessage());
				}finally {
					
					SingletonHelper.close(pstmt);
				}
				
		return dept.getDeptno();
	}
	
	//4. 데이터 수정(수정할 컬럼 결정) ex)..이름만.. 다..
	//update dept set dname =? , loc=? where deptno=?
	public int updateDept(Dept dept) {
		//DB 연결 >> 명령 >> 명령실행 >> 처리
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = SingletonHelper.getConnection("oracle");
			String sql = "update dept set deptno=? , dname=?   where loc =?";
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setInt(1,dept.getDeptno());
			pstmt.setString(2, dept.getDname());
			pstmt.setString(3, dept.getLoc());
			
			int row = pstmt.executeUpdate();
			
			if(row > 0) {
				System.out.println("insert row count : " + row );    
			}else {
				System.out.println("row count : " + row);   
			}
		
		} catch (Exception e) {
		System.out.println("예외 : " + e.getMessage());
		}finally {
			
			SingletonHelper.close(pstmt);
		}
		return 0;
	}
	
	//5. 데이터 삭제(1건씩)
	public int deleteDept(int deptno) {
		//DB 연결 >> 명령 >> 명령실행 >> 처리
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = SingletonHelper.getConnection("oracle");
			String sql = "delete from dept where deptno= ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,deptno);
			
			int row = pstmt.executeUpdate();
			
			if(row > 0) {
				System.out.println("insert row count : " + row );    
			}else {
				System.out.println("row count : " + row);   
			}
		
		} catch (Exception e) {
		System.out.println("예외 : " + e.getMessage());
		}finally {
			
			SingletonHelper.close(pstmt);
		}
		
				return deptno;
	}
		
	

}

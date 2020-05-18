package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MemberDAO() {
		try {
			Context initContext = new InitialContext();
			Context envContext  = 
					(Context)initContext.lookup("java:/comp/env");
			DataSource ds = 
					(DataSource)envContext.lookup("jdbc/myoracle");
			conn = ds.getConnection();
			System.out.println("DBCP 연결 성공");
		} catch (Exception e) {
			System.out.println("DBCP 연결 오류");
			e.printStackTrace();
		}
	}
	
	public int join(Member member) {
		String sql = "INSERT INTO MEMBER VALUES(?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMemID());
			pstmt.setString(2, member.getMemPW());
			pstmt.setString(3, member.getMemName());
			pstmt.setString(4, member.getMemGender());
			pstmt.setString(5, member.getMemEmail());
			pstmt.executeUpdate();
			return 1; //회원가입 성공
		} catch (Exception e) {
			System.out.println("join sql error");
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public int login(String memID, String memPW) {
		String sql = "SELECT MEMPW FROM MEMBER WHERE MEMID = '"+memID+"' and MEMPW = '"+memPW+"'";
		System.out.println("login sql : "+sql);
		
		try {
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				return 1; //로그인 성공
			}else {
				return 0; //로그인 실패
			}
		} catch (Exception e) {
			System.out.println("login sql error");
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
	
	//이름, 성별, 이메일
	public Member selectOne(String memID) {
		String sql = "SELECT MEMNAME, MEMGENDER, MEMEMAIL FROM MEMBER WHERE MEMID = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memID);
			rs = pstmt.executeQuery();
			
			//rs의 커서가 0번지에 있음.
			//rs.next() 함수 호출 커서가 1씩 증가
			//return boolean(true, false)
			while(rs.next()) { //데이터가 1행 이상이라면 while사용
				Member m = new Member();
				m.setMemName(rs.getString("memName"));
				m.setMemGender(rs.getString("memGender"));
				m.setMemEmail(rs.getString("memEmail"));
				return m;
			}
		} catch (Exception e) {
			System.out.println("selectOne sql error");
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

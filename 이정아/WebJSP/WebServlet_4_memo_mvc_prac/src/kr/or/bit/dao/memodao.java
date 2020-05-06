package kr.or.bit.dao;
/*
 DB작업
 CRUD 함수 생성
 
 memo table CRUD 작업
 전체조회 : select id, email, content from memo;
 조건조회 : select id, email, content from memo where id = ?;
 삽입 : insert into memo(id, email, content) values (?,?,?);
 수정 : update memo set email =? , content =? where id =?
 삭제 : delete from memo where id = ?
  
  
 기본 5개 + 기타(필요하면 더 만들기) 
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.bit.dto.memo;
import kr.or.bit.utils.Singleton_Helper;

public class memodao {
	Connection conn = null;
	public memodao() {
		conn = Singleton_Helper.getConnection("oracle");
	}
	//전체 데이터 조회 (조건절(where) X)
	public List<memo> getMemoList() throws SQLException{
		PreparedStatement pstmt = null;
		String sql = "select id, email, content from memo";
		
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		List<memo> memolist = new ArrayList<memo>();
		
		while(rs.next()) {
			memo m = new memo(); //DTO객체에 DB에서 가져온 정보를 저장
			m.setId(rs.getString("id"));
			m.setEmail(rs.getString("email"));
			m.setContent(rs.getString("content"));
			memolist.add(m);
		}
		Singleton_Helper.close(rs);
		Singleton_Helper.close(pstmt);
		
		return memolist;
	}
	//조건 데이터 조회(where 사용되는 컬럼은 : unique, primary key)
	public memo getMemoListById(String id) {
		return null;
	}
	
	//INSERT
	//권장사항은 : public int insertMemo(memo m){}
	public int insertMemo(String id, String email, String content) {
		int resultrow = 0;
		
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into memo(id, email, content) values (?,?,?)";
			pstmt = conn.prepareStatement(sql); //컴파일 시키기
			
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			pstmt.setString(3, content);
			
			resultrow = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			Singleton_Helper.close(pstmt);
		}
		return resultrow;
	}
	
	//UPDATE
	public int updateMemo(memo m) {
		return 0;
	}
	
	public int deleteMemo(String id) {
		return 0;
	}
	
	//추가함수 구현....
	//id 중복확인 함수
	public String isCheckById(String id) {
		return null;
	}
	
	//전체 글의 개수를 리턴하는 메소드
	public int getAllCount() {
		int count = 0;
		PreparedStatement pstmt = null;
		
		try {
			//쿼리 준비
			String sql = "select count(*) from memo";
			pstmt = conn.prepareStatement(sql);
			//쿼리 실행 후 결과 리턴
			ResultSet rs = pstmt.executeQuery();
			//행이 단일행이므로, while문을 돌릴 필요가 없다.
			
			if(rs.next()) { //데이터가 있다면
				count = rs.getInt(1);
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	//모든(화면에 보여질) 데이터를 10개씩 추출해서 리턴하는 메소드
	public List<memo> getAllBoard(int startRow, int endRow){
		List<memo> m = new ArrayList<>();
		PreparedStatement pstmt = null;
		
		try {
			//쿼리 날리기
			String sql = "select * from (select A.*, Rownum Rnum from (select * from board order by ref desc, re_step asc)A)"+
		"where Rnum >= ? and Rnum <= ?";
			//쿼리 실행할 객체 선언
			pstmt = conn.prepareStatement(sql);
			//?에 값을 대입
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			//쿼리 실행
			ResultSet rs = pstmt.executeQuery();
			
			//10개의 결과가 나올 것이므로 while문 돌리기
			while (rs.next()) {
				
				//데이터를 패키징 해준다. (가방인 memo클래스를 이용)
				memo memo = new memo();
				
				memo.setId(rs.getString(1));
				memo.setEmail(rs.getString(2));
				memo.setContent(rs.getString(3));
				//패키징한 데이터를 list에 저장	
				m.add(memo);
			}
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return m;
		
	}
	
}



















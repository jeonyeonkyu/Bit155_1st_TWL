package kr.or.bit.dao;
/*
 * 
 * DB 작업
 * CRUD 함수를 생성
 * 
 * memo table CRUD 작업
 * 전체조회 : select id, email, content from memo;
 * 조건조회 : select id, email, content from memo where id=?
 * 삽입       : insert into memo(id,email,content) values(?,?,?);
 * 수정       : update from memo set email=? , content=? where id=? 
 * 삭제       : delete from memo where id=?
 * 
 * 보통은 이렇게 기본 5 개 이고 필요에 따라 추가함
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
	
	//전체 데이터 조회(where 절이 없어용)
	public List<memo> getMemoList() throws SQLException{
		PreparedStatement pstmt = null;
		String sql = "select id, email, content from memo";
		
		pstmt =  conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		List<memo> memolist = new ArrayList<memo>();
		
		while(rs.next()) {
			memo m = new memo();
			m.setId(rs.getString("id"));
			m.setEmail(rs.getString("email"));
			m.setContent(rs.getString("content"));
			memolist.add(m);//새롭게 객체가 만들어지고 그 안에 값이 담긴후 리스트에 추가됨 
		}
		
		Singleton_Helper.close(rs);
		Singleton_Helper.close(pstmt);
		
		return memolist;
	}
	
	//조건 데이터 조회(where 사용되는 컬럼은 : unique, primary key)
	public memo getMemoListById(String id) {
		return null;
	}
	
	//Insert
	//권장사항 : public int insertMemo(memo m){} 이렇게 객체로 받는게 좋아요!
	public int insertMemo(String id, String email, String content) {
		int resultrow = 0;
		
		PreparedStatement pstmt =null;
		try {
			String sql ="insert into memo(id,email,content) values(?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,email);
			pstmt.setString(3,content);
			
			resultrow = pstmt.executeUpdate();
			
					
		}catch(Exception e) {
			System.out.println("Insert: "+e.getMessage());
		}finally {
			Singleton_Helper.close(pstmt);
		}
		return resultrow;
	}
	//Update
	public int updateMemo(memo m) {
		return 0;
	}
	//Delete
	public int deleteMemo(String id) {
		return 0;
	}
	
	//추가함수 구현...해보기
	//id 존재 유무 판단 함수
	public String isCheckById(String id) {
		return null;
	}
	
}

































































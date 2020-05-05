package kr.or.bit.dao;
/*
DB�۾�
CRUD �Լ��� ����

memo table CRUD �۾�
��ü��ȸ : select id, email, content from memo;
������ȸ : select id, email, content from memo where id=?;
���� : insert into memo(id,email,content) values(?,?,?);
���� : update memo set email=? , content=? where id=?
���� : delete from memo where id=?;

�⺻ 5��   + ���� (�ʿ��ϴٸ� ....)
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
	
	//��ü ������ ��ȸ (where ���� �����)
	public List<memo> getMemoList() throws SQLException{
		PreparedStatement pstmt = null;
		String sql = "select id, email ,content from memo";
		
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		List<memo> memolist = new ArrayList<memo>();
		
		while(rs.next()) {
			memo m = new memo();
			m.setId(rs.getString("id"));
			m.setEmail(rs.getString("email"));
			m.setContent(rs.getString("content"));
			memolist.add(m);
		}
		
		Singleton_Helper.close(rs);
		Singleton_Helper.close(pstmt);
		
		return memolist;
	}
	
	//���� ������ ��ȸ(where ���Ǵ� �÷��� : unique, primary key)
	public memo getMemoListById(String id) {
		return null;
	}
	
	//INSERT
	//������� : public  int insertMemo(memo m){}
	public int insertMemo(String id, String email, String content) {
		int resultrow=0;
		
		PreparedStatement pstmt=null;
		try {
				String sql="insert into memo(id,email,content) values(?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, email);
				pstmt.setString(3, content);
				
				resultrow = pstmt.executeUpdate();
				
		}catch (Exception e) {
			System.out.println("Insert : " + e.getMessage());
		}finally {
			Singleton_Helper.close(pstmt);
		}
		return resultrow;
	}
	
	//UPDATE
	public int updateMemo(memo m) {
		return 0;
	}
	//DELETE
	public int deleteMemo(String id) {
		return 0;
	}
	
	//�߰��Լ� ���� ....
	//id ���� ���� �Ǵ� �Լ�
	public String isCheckById(String id) {
		return null;
	}
	
}











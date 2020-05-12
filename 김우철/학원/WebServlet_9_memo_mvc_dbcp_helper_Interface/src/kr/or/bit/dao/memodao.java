package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import kr.or.bit.dto.memo;
import kr.or.bit.utils.ConnectionHelper;
import kr.or.bit.utils.DB_Close;


/*
DB�۾�
CRUD �۾��� �ϱ����� �Լ��� �����ϴ� ��

memo table �� ������ �� ���ؼ�
������ȸ : select id, email ,content from memo
������ȸ : select id, email ,content from memo where id=?
���� : update memo set email=? , content=? where id=?
���� : delete from memo where id=?
���� : insert into memo(id,email,content) values(?,?,?)

default 5��
�ʿ��Ͻø� �Լ��� �߰� .....^^
*/
public class memodao {
	/*
	���� ���
	Connection conn = null;
	public memodao() {
		conn = Singleton_Helper.getConnection("oracle");
	}
	*/
	/*
	 * DataSource ds = null; public memodao(){ try { Context context = new
	 * InitialContext(); //���� ������Ʈ�� �̸���� �˻� ds =
	 * (DataSource)context.lookup("java:comp/env/jdbc/oracle");//java:comp/env/ +
	 * name //������ �Լ� �ȿ��� ��� ��ȯ�ϰ� .... } catch (Exception e) {
	 * System.out.println(e.getMessage()); }
	 * 
	 * }
	 */
	
	//1���� ������ read (where �������� ���Ǵ� �÷��� �ݵ�� unique , primary key)
	public memo getMemoListById(String id) {
		/*
		  select id, email ,content from memo where id=?
		  memo m = new memo();
		  m.setId(rs.getInt(1)) ...
		  return m
		*/
		return null;
	}
	
	//��ü ������ read (where �������� �����)
	public ArrayList<memo> getMemoList() throws SQLException{
		
		Connection conn = ConnectionHelper.getConnection("oracle"); //��ü ���
		
		PreparedStatement pstmt = null;
		String sql="select id, email , content from memo";
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<memo> memolist = new ArrayList<>();
		while(rs.next()) {
			memo m = new memo();
			m.setId(rs.getString("id"));
			m.setEmail(rs.getString("email"));
			m.setContent(rs.getString("content"));
			memolist.add(m);
		}
		
		
		DB_Close.close(rs);
		DB_Close.close(pstmt);
		conn.close(); //��ȯ�ϱ�
		
		return memolist;
	}
	
	//Insert
	//Parameter (id,ename,cotent)
	//����: public int insertMemo(memo m){} >> FrameWork �ڵ�ȭ..
	public int insertMemo(String id, String email , String content) {
		Connection conn =null;//�߰�
		int resultrow=0;
		PreparedStatement pstmt = null;
		
		try {
				conn= ConnectionHelper.getConnection("oracle");//�߰�
				
				String sql = "insert into memo(id,email,content) values(?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, email);
				pstmt.setString(3, content);
				
				resultrow = pstmt.executeUpdate();
				
		}catch(Exception e) {
			System.out.println("Insert : " + e.getMessage());
		}finally {
			DB_Close.close(pstmt);
			try {
				conn.close(); //��ȯ�ϱ�
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return resultrow;
	}
	
	//Update
	public int updateMemo(memo m) {
		//update memo set email=? , content=? where id=?
		//m.getId()
		return 0;
	}
	
	//Delete
	public int deleteMemo(String id) {
		//delete from memo where id=?
		return 0;
	}

	//�߰��Լ� (ID ���� ���� �Ǵ� �Լ�)
	public String isCheckById(String id) {
		Connection conn =null;//�߰�
		String ismemoid= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
				conn= ConnectionHelper.getConnection("oracle");//�߰�
				String sql = "select id from memo where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					//do {
						//String id = rs.getString("id")
						ismemoid = "false";
						
					//}while(rs.next());
				}else {
						ismemoid = "true";
				}
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close();//��ȯ�ϱ�
			} catch (SQLException e) {
				
				e.printStackTrace();
			} 
		}
		//System.out.println("ismemoid : " + ismemoid);
		return ismemoid;
	}
}








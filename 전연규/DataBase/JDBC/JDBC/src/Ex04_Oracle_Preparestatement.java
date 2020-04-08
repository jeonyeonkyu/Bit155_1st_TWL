import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import kr.or.bit.utils.SingletonHelper;

/*
 * PreparedStatement (�غ�� Statement )
  (1) ���� 
     �̸� SQL���� ���õ� Statement �� DB�� ���۵Ǿ�����   �����ϵǾ�����, SQL���� ?�� ���߿� �߰� �����ؼ� ���� 
    �� �Ǿ����� �غ�� Statement 
  (2) ���� 
     <1> Statement �� ���ؼ� �ݺ����� SQL���� ����� ��쿡  �� ������. ( Ư��, �˻��� )
  <2> DB�÷�Ÿ�԰� ������� ?�ϳ��� ǥ���ϸ� �ǹǷ�   �����ڰ� ����� �ʰ� ����. ( Ư��, INSERT�� )
       (����: ?�� ������ SQL���� DB���� �̸� �����ϵǾ����� ���)

  (3) ���� 
     SQL������ PreparedStatement ��ü�� ���� �����ؾ� �ϹǷ� ����Ұ�
     (but, Statement ��ü�� SQL���� �޶������� �� ���� �����ؼ�  ������ �����ϴ�. )

  (4) Ư¡ 
     <1> Statement stmt = con.createStatement(); //����       stmt.execute(sql);//����
  <2> PreparedStatement pstmt = con.prepareStatement(sql); //����      pstmt.execute(); //����

  (5) ���� 
     DB ��ü��(table, ..)�� ����(   ���̺�� or �÷��� or �������� ���� ��ü�� �Ӽ���)�� 
      ?�� ǥ���� �� ����. 
     ��, data �ڸ����� ?�� ǥ���� �� �ִ�.
     cf) �׷���, DDL�������� PreparedStatement�� ������� �ʴ´�.
     
   ���� : ����, �̸� ������ ������ >> ���� parameter �� ���� ó��(����)
   ���� : ������ ����(PreparedStatement pstmt = con.prepareStatement(sql); �����)
*/
public class Ex04_Oracle_Preparestatement {

	public static void main(String[] args) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = SingletonHelper.getConnection("oracle");
			String sql = "select empno, ename from emp where deptno = ?";
			//where id = 100 and name = 'ȫ�浿' and job = 'IT';
			//where id =  ?  and name =    ?    and job =  ?;
			
//			Statement stmt = conn.createStatement();
			//stmt.execute(sql)
			pstmt = conn.prepareStatement(sql); //����Ŭ ���� �̸� ���� ������ ... ���
			
			//���Ŀ��� parameter ������ �����ؼ� ����
			//? �ڸ�... ����
			pstmt.setInt(1, 30); //where deptno = 30
			rs= pstmt.executeQuery();
			//���İ��� ����
			//whlie ������ : ������ ���� ��� ... ǥ�� �ȵǿ�
			while(rs.next()) {
				System.out.println(rs.getInt(1) + "/" + rs.getString(2));
			}
			
			if(rs.next()) {
				//�ּ� �Ѱ��� �����ʹ� �ִ�
				do {
					System.out.println(rs.getInt(1) + "/" + rs.getString(2));

				}while(rs.next());
			}else {
				System.out.println("��ȸ�� �����Ͱ� �����ϴ�");
			}
			
		} catch (Exception e) {
			
		}finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
			//���� ��� ���� ..... APP ����ִ� ��
		}
		
	}

}

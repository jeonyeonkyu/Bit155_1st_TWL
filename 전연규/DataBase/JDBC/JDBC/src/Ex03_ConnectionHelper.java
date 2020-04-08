import java.sql.Connection;
import java.sql.SQLException;

import kr.or.bit.utils.ConnectionHelper;
import kr.or.bit.utils.SingletonHelper;

public class Ex03_ConnectionHelper {

	public static void main(String[] args) throws SQLException {
		Connection conn = null;
		conn = ConnectionHelper.getConnection("oracle");
		System.out.println(conn.toString());
		System.out.println(conn.getMetaData().getDatabaseProductName());
		System.out.println(conn.getMetaData().getDatabaseProductVersion());
		System.out.println("���Ῡ�� : " + conn.isClosed()); //false
		ConnectionHelper.close(conn);
		System.out.println("���Ῡ�� : " + conn.isClosed()); //false
		
		
		Connection conn1 = ConnectionHelper.getConnection("oracle");
		System.out.println(conn1.toString());
		
		Connection conn2 = ConnectionHelper.getConnection("oracle");
		System.out.println(conn2.toString());
		//conn1 ������ �ּҰ���   conn2 ������ �ּҰ��� ���� ���
		
		//ConnectionHelper.getConnection ȣ���Ҷ� ���� ���ο��� (new �۾� ���ᰴü ����)
		//oracle.jdbc.driver.T4CConnection@131276c2
		//oracle.jdbc.driver.T4CConnection@26aa12dd
		//�ϳ���  APP ���ᰴü �ϳ��� ��� 
		//�ϳ��� ���� ���� (����) >> singleton
		
		Connection conn3 = ConnectionHelper.getConnection("oracle", "hr","1004");
		System.out.println(conn3.toString());
		
		////////////////////////////////////////////////////////////////
		
		
		
		Connection sconn = SingletonHelper.getConnection("oracle");
		System.out.println(sconn.toString());
		//oracle.jdbc.driver.T4CConnection@711f39f9
		sconn = SingletonHelper.getConnection("oracle");
		System.out.println(sconn.toString());
		//oracle.jdbc.driver.T4CConnection@711f39f9
		sconn = SingletonHelper.getConnection("oracle");
		System.out.println(sconn.toString());
		//oracle.jdbc.driver.T4CConnection@711f39f9
		//sconn.close();
		//�ٸ� DB�����ϴ��� 
		//Connecton >> null �ƴϱ� ������ ... ���� ��ü �ּ� ����
		SingletonHelper.dbClose();
		sconn = SingletonHelper.getConnection("mysql");
		System.out.println(sconn.toString());
		//mysql�� ��ġ���� �ʾұ� ������ �����ߴ°� ����
		
		
		
	}

}
















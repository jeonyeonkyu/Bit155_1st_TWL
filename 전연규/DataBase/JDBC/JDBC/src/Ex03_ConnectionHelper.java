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
		System.out.println("연결여부 : " + conn.isClosed()); //false
		ConnectionHelper.close(conn);
		System.out.println("연결여부 : " + conn.isClosed()); //false
		
		
		Connection conn1 = ConnectionHelper.getConnection("oracle");
		System.out.println(conn1.toString());
		
		Connection conn2 = ConnectionHelper.getConnection("oracle");
		System.out.println(conn2.toString());
		//conn1 가지는 주소값과   conn2 가지는 주소값을 같을 까요
		
		//ConnectionHelper.getConnection 호출할때 마다 내부에서 (new 작업 연결객체 생성)
		//oracle.jdbc.driver.T4CConnection@131276c2
		//oracle.jdbc.driver.T4CConnection@26aa12dd
		//하나의  APP 연결객체 하나만 사용 
		//하나를 만들어서 재사용 (공유) >> singleton
		
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
		//다른 DB연결하더라도 
		//Connecton >> null 아니기 때문에 ... 기존 객체 주소 리턴
		SingletonHelper.dbClose();
		sconn = SingletonHelper.getConnection("mysql");
		System.out.println(sconn.toString());
		//mysql을 설치하지 않았기 때문에 에러뜨는게 맞음
		
		
		
	}

}
















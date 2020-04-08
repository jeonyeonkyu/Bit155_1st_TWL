import java.sql.Connection;
import java.sql.SQLException;

import kr.or.bit.utils.ConnectionHelper;
import kr.or.bit.utils.SingletonHelper;

public class Ex03_ConnectionHelper {

	public static void main(String[] args) throws SQLException {
		Connection conn = null;
		conn = ConnectionHelper.getConnection("oracle");
		System.out.println(conn.toString());
		System.out.println(conn.getMetaData().getDatabaseProductName()); //Oracle
		System.out.println(conn.getMetaData().getDatabaseProductVersion());  //Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production
		
		System.out.println("연결여부 : " + conn.isClosed()); //false 나와야 함
		
		ConnectionHelper.close(conn);  //원하는 객체의 주소만 던지면 됨
		System.out.println("연결여부 : " + conn.isClosed());  //false
		
		
		
		Connection conn1 = ConnectionHelper.getConnection("oracle");
		System.out.println(conn1.toString());
		
		Connection conn2 = ConnectionHelper.getConnection("oracle");
		System.out.println(conn2.toString());
		/*//conn1,conn2 라고 하는 참조변수가 갖고있는 주소값은 같을까 다를까?  다르다.
		//ConnectionHelper.getConnection 호출할때 마다 내부에서 (new 작업 연결객체 생성)
		//oracle.jdbc.driver.T4CConnection@7bd4937b
		//oracle.jdbc.driver.T4CConnection@21e360a
		//하나의 APP 연결객체 하나만 사용 하면 되지 않나?
		// 하나를 만들어서 재사용(공유) 
		// 그래서 나오는게 Singleton pattern
		*/
		
		Connection conn3 = ConnectionHelper.getConnection("oracle","hr","1004");
		System.out.println(conn3.toString()); //oracle.jdbc.driver.T4CConnection@5ba3f27a
		
		////////////////////////////////////////////////////////////////////////////////////////////
		/*여기서 부터는 싱글톤  SingletonHelper*/  
		
		Connection sconn = SingletonHelper.getConnection("oracle");
		System.out.println(sconn.toString());
		//oracle.jdbc.driver.T4CConnection@74751b3
		Connection sconn2 = SingletonHelper.getConnection("oracle");
		System.out.println(sconn2.toString());
		//oracle.jdbc.driver.T4CConnection@74751b3
		Connection sconn3 = SingletonHelper.getConnection("oracle");
		System.out.println(sconn3.toString());
		//oracle.jdbc.driver.T4CConnection@74751b3
		
		
		//공유자원의 문제 : sconn.close() 를 한 후에 연결을 다시 해보면?
		
		//sconn.close();
		//다른 DB로 변경하더라도 맨처음 만들었던 객체의 주소를 계속 반환한다. 
		//Connection 객체가 null 이 아니기 때문에...
		
		SingletonHelper.dbClose();// 이 함수로 close()  하고 null 값을 만든다. 
		sconn = SingletonHelper.getConnection("mysql");   //Communications link failure    mysql 이 없어서  에러난다. 
		System.out.println(sconn.toString());

	}

}

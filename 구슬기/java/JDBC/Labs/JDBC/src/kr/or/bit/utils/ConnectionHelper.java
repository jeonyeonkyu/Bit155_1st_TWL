package kr.or.bit.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/*
 ��ü ������Ʈ ( ȸ�� : ��ü��ȸ, ������ȸ, ����, ���� ���......���� ���� ������ ���� ���� )
 ������ ����...
 ������ �������� ���������� �ʿ��� ���.... 
 (�ݺ����� �ڵ�)�� ���� 
 
 1. ����̹� �ε�
 2. ����, ��ü����, �ڿ����� ���� Ex02_Oracle_DML���� �����Ҷ����� ��� �ݺ���.
 3. �ݺ����� �ڵ�� ��������!
 4. Oracle �� ���ٰ� Mysql �� ����ص� �״�� ���� �ְ�. 
 5. ���뼳�赵�� ������.
 6. ConnectionHelper Ŭ���� >> ���(method) ����  >> static >>overloadig >> �������� ������Ѻ���?
 7. ���� �� �Ẽ��? >> �ϳ��� ��ü�� �����غ���? >> singleton �� �غ���!
   
  
  
*/


public class ConnectionHelper {
	//oracle , mysql �ϳ��� �Լ� ... dsn > oracle, mysql
	/*
	//�̱������� �ٲ㺸��
	
	private static Connection conn = null;
	private ConnectionHelper() {}
	
	public static Connection getConnection(String dsn) {
		
		
		try {
			
			if(dsn.equals("oracle")) {  //oracle
				if(conn == null) {
				Class.forName("oracle.jdbc.OracleDriver");
				conn = conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bit","1004");
				
				}else {
					return conn;}
			}else if(dsn.equals("mysql")) {  //mysql
				if(conn == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sampledb?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=true","bit","1004");
				}else {
					return conn;
				}
				}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	//�̱������� �ٲ㺸�� ��
	*/
	
	public static Connection getConnection(String dsn) {
		Connection conn = null;
		
		try {
			
			if(dsn.equals("oracle")) {  //oracle
				Class.forName("oracle.jdbc.OracleDriver");
				conn = conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bit","1004");
				
			}else if(dsn.equals("mysql")) {  //mysql
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sampledb?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=true","bit","1004");
			}
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	
	
	
	public static Connection getConnection(String dsn,String id ,String pwd) {  //Overloading
		Connection conn = null;
		
		try {
			if(dsn.equals("oracle")) {  //oracle
				Class.forName("oracle.jdbc.OracleDriver");
				conn = conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE",id,pwd);
				
			}else if(dsn.equals("mysql")) {  //mysql
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sampledb?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=true",id,pwd);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	//��������   �����ε���.
	
	public static void close(Connection conn) {  //Connection Ÿ���� �ּҸ� ����
		if(conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		
	}
	public static void close(ResultSet rs) {  //Connection Ÿ���� �ּҸ� ����
		if(rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
	public static void close(Statement stmt) {  //Connection Ÿ���� �ּҸ� ����
		if(stmt != null) {
			try {
				stmt.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
	public static void close(PreparedStatement pstmt) {  //Connection Ÿ���� �ּҸ� ����
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
	
	
	
	
	
}
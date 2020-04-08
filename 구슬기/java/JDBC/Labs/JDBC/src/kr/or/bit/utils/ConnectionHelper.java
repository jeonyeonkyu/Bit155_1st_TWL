package kr.or.bit.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/*
 전체 프로젝트 ( 회원 : 전체조회, 조건조회, 삭제, 수정 등등......들을 각각 페이지 별도 구현 )
 개선의 여지...
 각각의 페이지에 공통적으로 필요한 요소.... 
 (반복적인 코드)가 있음 
 
 1. 드라이버 로딩
 2. 연결, 객체생성, 자원해제 등은 Ex02_Oracle_DML에서 연습할때마다 계속 반복됨.
 3. 반복적인 코드는 제거하자!
 4. Oracle 을 쓰다가 Mysql 을 사용해도 그대로 쓸수 있게. 
 5. 공통설계도를 만들자.
 6. ConnectionHelper 클래스 >> 기능(method) 자주  >> static >>overloadig >> 다형성을 접목시켜볼까?
 7. 패턴 을 써볼까? >> 하나의 객체를 공유해볼까? >> singleton 을 해보자!
   
  
  
*/


public class ConnectionHelper {
	//oracle , mysql 하나의 함수 ... dsn > oracle, mysql
	/*
	//싱글톤으로 바꿔보기
	
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
	
	//싱글톤으로 바꿔보기 끝
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
	
	//연결해제   오버로딩함.
	
	public static void close(Connection conn) {  //Connection 타입의 주소를 받음
		if(conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		
	}
	public static void close(ResultSet rs) {  //Connection 타입의 주소를 받음
		if(rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
	public static void close(Statement stmt) {  //Connection 타입의 주소를 받음
		if(stmt != null) {
			try {
				stmt.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
	public static void close(PreparedStatement pstmt) {  //Connection 타입의 주소를 받음
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
	
	
	
	
	
}
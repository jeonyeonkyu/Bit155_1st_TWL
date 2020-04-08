import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
JDBC (자바언어를 통해서 DB 다루겠다)
1. java 언어(App)를 통해서 Oracle(소프트웨어) 연결하고 CRUD 작업
2. java App 의사결정(어떤 RDBMS 사용) : Oracle, Mysql, MSsql
2.1 어떤 제품을 쓰냐에 따라서 ...드라이버 준비 작업
프린터 구매 >> 컴퓨터 >> 프린터를 연결
CASE1 : 정상 동작 (프린터의 드라이버 컴퓨터 내장된 경우)
CASE2 : 인식 안되요 >> 드라이버 설치 >>제조 회사 >>드라이버 다운로드 >> 통합(제품) >> 설치
2.2 my-sql : https://dev.mysql.com/downloads/connector/j/ 다운로드
    >>mysql-connector-java-8.0.19
2.3 Oracle : C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib
             https://www.oracle.com/database/technologies/jdbcdriver-ucp-downloads.html
    >>ojdbc6.jar	
    
3. 드라이버 참조 (작업하는 프로젝트에서 참조)  
3.1 java 프로젝트 > 속성 > build path >> add external jar >> 추가
3.2 드라이버 사용할 준비 완료 >> 메모리에 Load 에서 사용  (new ...)
3.3 class.forName("클래스 이름") >> new 동일한 효과

4. JAVA CODE( JDBC API) : 만들어진 class 제공 받아서 사용
4.1 import java.sql.* >> interface , class >> DB작업
4.2 개발자는 interface 를 통해서 작업 (다형성)
POINT : interface 만들어서 각 재조사 배포 ... >>
import java.sql.Connection
import java.sql.ResultSet
import java.sql.Statement
 
5. 작업순서
5.1 DB연결 -> 명령 -> 실행 -> 처리 -> 연결해제
명령 (CRUD) insert, select, update, delete 
실행 : 구문을 DB서버에 전달 ....  		
처리 : 실행된 결과를 바탕으로 화면출력, 다른 곳 전달 ... 업무 처리
연결 : 자원 명시적으로 해제  		
*/
public class Ex01_Oracle_Connection {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// DB연결 Class.forName("oracle.jdbc.OracleDriver") 생략 가능
		Class.forName("oracle.jdbc.OracleDriver");
		System.out.println("오라클 드라이버 로딩");

		// DB연결하기
		// Oracle 서버와의 연결 주소값(연결 객체의 주속값) 을 리턴
		// OracleConnection conn = ......getConnection 가 내부적으로 new OracleConnection
		// MysqlConnection conn = ......getConnection 가 내부적으로 new MysqlConnection
		// OracleConnnection implement Connection
		// MysqlConnection implement Connection
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "bit", "1004");
		System.out.println(conn.isClosed()); // false (정상연결)

		// 명령 객체 얻어오기
		Statement stmt = conn.createStatement();
		String sql = "select empno , ename, sal from emp";

		ResultSet rs = stmt.executeQuery(sql); // 명령실행

		// 처리(화면 출력)
		while (rs.next()) {
			System.out.println(rs.getInt("empno") + "/" + rs.getString("ename") + "/" + rs.getInt("sal"));
		}
		stmt.close();
		rs.close();
		conn.close();
		System.out.println("DB연결 : " + conn.isClosed()); // true

	}

}

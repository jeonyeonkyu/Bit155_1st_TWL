import java.security.interfaces.RSAKey;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

// java 에서  Mysql 이랑  Oracle 에 접근하려면 각각에 맞는 드라이버가 필요하다.
// 그 드라이버의 역할 : 드라이버를 통해서 내 DB를 컨트롤한다.    드라이버는 쓰려고 하는 컴퓨터 회사에서 제공한다.
		
/*
 
 JDBC (자바언어를 통해서 DB 다루겠다)
 
 1. java 언어 (App)를 통해서 Oracle(소프트웨어) 연결하고 CRUD 작업
 2. java App 의사결정(어떤 RDBMS 사용) : Oracle, Mysql, MSsql
 
     2.1  어떤 제품을 쓰냐에 따라서 사용하는 드라이버가 달라진다.  그래서 드라이버를 준비하는 작업이 필요하다...
     ex)
               프린터 구매 >> 컴퓨터 >> 프린터를 연결
         CASE1 : 정상 동작 ( 프린터의 드라이버 컴퓨터 내장된 경우 )
         CASE2 : 인식 안되넹?   >>  별도의 드라이버 설치 >> 제조회사 >> 드라이버 다운로드 >> 통합(제품)  
      
     2.2  https://dev.mysql.com/downloads/  여기가면 각 언어에 맞는 드라이버가 있다. 
  
     2.3  C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib  자바언어를 사용하는 오라클 드라이브가 있따.  
  
     D:\bit155\DATABASE 여기에 다 모아 놓았다. 
      
 3. 드라이버 참조 (작업하는 프로젝트에 참조)
     
     3.1  java프로젝트 > 속성 > build path >> add external jar >> 추가
     3.2  여기까지 하면 드라이버 사용할 준비 완료 된거임 >> 이제 메모리에 load 에서 사용 (new...)
     3.3  class.forName("클래스 이름") >> new 동일한 효과
     
 4. JAVA CODE(   JDBC API) : 만들어진 class 제공 받아서 사용
     
     4.1 import java.sql.* >> interface , class >> DB작업
     4.2 개발자는 interface 를 통해서 작업(다형성) 
     
     POINT : interface 만들어서 각 제조사한테 배포함.. >> 
     import java.sql.Connection
     import java.sql.ResultSet
     import java.sql.Statement
 
 5.  작업 순서
     5.1 DB연결 -> 명령 -> 실행 -> 처리 -> 연결해제
                     명령(CRUD) : insert, select , update, delete
                     실행 : 내가 만든 구문을 DB 서버에 전달 하는 것          
                     처리 : 실행 된 결과를 바탕으로 화면출력, 다른 곳 전달 한다던가.. 업무처리하는것.
                     연결해제 : 자원 명시적으로 해제    
 
 */
public class Ex01_Oracle_Connection {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		//DB 연결 확인   
		Class.forName("oracle.jdbc.OracleDriver"); //생략가능한데  예전꺼는 생략 불가능
		System.out.println("오라클 드라이버 로딩");     //이거 뜨면 잘 된거다.
		
		//0. getConnection 함수를 사용해서 DB 연결하기. 
		//Oracle 서버와의 연결 주소값( 연결 객체의 주소값) 을 리턴
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bit","1004"); //이것저것, 계정, 비밀번호
		//각각의 클래스들이 인터페이스를 구현하고 있어서 표준화된 작업을 할 수 있다.
		//getConnection 이 객체를 만들어서(new) conn에 주소를 넘긴다 
		
		/*
		//OracleConnection conn = .......getConnection 가 내부적으로 new OracleConnection 하고 앞에 넘겨주는데.
		//MysqlConnection conn = ......getConnection 가 내부적으로 new MysqlConnection 이렇게 앞에를 바꿔주어야해서      
		//OracleConnection implement Connection
		//MysqlConnection implement Conncetion   이니까 그냥 Connection 으로 넘긴다.
		
		//Oracle  --->>>   Mysql   
		//만약 Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bit","1004"); 이거를  
		//Mysql 으로 바꾸고 싶다면 괄호안의 주소만 바꾸면 됨. (재활용성~!)
		*/
		
		
		
		System.out.println(conn.isClosed());  //너 다리가 정상적으로 연결되지않았니?      //false 가 나와야 정상적으로 연결 된거임.
		
		//명령 만들기
		// 1. 명령 객체 얻어오기   (conn으로 부터 명령 객체를 얻어오기)     :내가 가진 구문을 오라클 서버에 보내서 실행하는 역할을 함
		Statement stmt = conn.createStatement();
		String sql = "select empno , ename, sal from emp";
		
		
		// 2. 명령실행 
		// 3. 명령실행 담을수 있는 객체를 만듦
		ResultSet rs = stmt.executeQuery(sql);                                             /*
		// Q.실행되었을때 실행 된 결과는 어디에 만들어 질까??
		//   A. ResulSet 은 오라클 서버 DB에 접근하는 인터페이스 이다.  데이터는 오라클에 있다. 
		//      컬럼에 접근하는 방법이 rs.getString 이런식으로 한줄씩 가져와서 next() 로 다음꺼에 간다.  ***반복
		//      next() 해서 다음 읽을 데이터가 없으면 false 반환해서 while문 탈출한다.  
		//      
		//      ********DB********        
		//      는 마지막 덮어쓰는 사람이 이긴다. 라스트위너. 
		//      장점 . 계속 해서 바로 업데이트 가 되니까. 충돌이 날 일이없다. 바로 수정하니까.  
		//      단점 . 연결이 끊기면 끝난다.DB 에서 바꾸면 라인단위로 읽어와서 느리다.
		// 
		//
		//      
		//      
		 *      ********Memory********
		 *       
		 *      데이터를 메모리에 가져오고 DB와의 연결을 끊으면 DB가 없어도 된다.
		 *      장단점이있음.
		 * 장점
		 * 
		 *    성능이 좋고 자유롭다. 
		 * 단점
		 * 
		 *    데이터 최종본을 저장해야 할때
		 *    DB 에 덮어쓰려고 하면 충돌이 생김(자원이 다르기때문에)   누구는 업데이트해서 14건 누군10건........
		 *    전략이 필요함.... 마지막 사람걸 덮어버리자..
		 *    깃도 전략이 필요함... 덮을거냐. 무시할거냐 . 한사람씩 머지할거냐... 등등.
		 *    
		//
		*/
		
		//처리(화면출력)
		while(rs.next()) { 
			System.out.println(rs.getInt("empno") + "/" + rs.getString("ename") + "/" + rs.getInt("sal"));
		}//getInt 하는 이유 empno 는 숫자니까. 그리고 컬럼명(empno)를 모르면 배열처럼 (1)로 해도되는데 (0) 이아니라 (1)부터 시작한다. 
		
		//썻던 자원 해제 해줘야함
		
		stmt.close();
		rs.close();
		conn.close();  //꼭 close() 해주어야함 서버 다운 될 수도 있따. 
		
		System.out.println("DB연결 : " + conn.isClosed());   //true가 나와야 끊긴거임
		
		
		
		

	}

}

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

/*
DML(insert , update , delete)
JDBC API 통해서
1. 결과 집합이 없다   < > select (결과 집합)
2. 반열 결과 row return 
java 코드
update emp set sal=0 >> 14건  변경  >> return 14
update emp set sal=0 where empno=11111 >> return 0  >>11111 사원이 없어요

java 코드 : 성공 ... 실패  로직 여러분 마음

KEY POINT
1. Oracle 에서 DML 작업 (Tool , cmd ) 하면 반드시 commit or rollback 강제
2. JDBC API 에서는 자바 코드를 >> DML >> default >> Autocommit
3. java code : delete from emp >> 실행 >> 자동 commmit >> 실반영
4. 필요에 따라서 commit() , rollback() java 코드에 제어 가능 

시작
   A 계좌 인출 (update)
   ..
   B 계좌  입금(update)
끝 (commit)
>> 하나의 논리적인 단위(transaction)
>> autocommit 옵션 >> false
>> java 코드에서 명시적으로 commit(), rollback() 강제 호출

실습용 테이블 만들기
CREATE TABLE dmlemp
AS
   SELECT * FROM emp;
  
SELECT * FROM dmlemp;

ALTER TABLE DMLEMP 
ADD CONSTRAINT pk_dmlemp_empno PRIMARY key(empno);
SELECT * FROM sys.USER_CONSTRAINTS  WHERE table_name='DMLEMP';

*/
public class Ex02_Oracle_DML {
	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;

		try {
			// Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "bit", "1004");
			stmt = conn.createStatement();

			// INSERT
			/*
			 * int empno=0; String ename=""; int deptno=0;
			 * 
			 * Scanner sc = new Scanner(System.in); System.out.println("사번입력:"); empno =
			 * Integer.parseInt(sc.nextLine());
			 * 
			 * System.out.println("이름입력:"); ename = sc.nextLine();
			 * 
			 * System.out.println("부서번호입력:"); deptno = Integer.parseInt(sc.nextLine());
			 * 
			 * //insert into dmlemp(empno,ename,deptno) values(100,'홍길동',10);
			 * 
			 * //무식한 코드 String sql="insert into dmlemp(empno,ename,deptno) "; sql+=
			 * "values(" + empno + ",'" + ename+"'," + deptno+")";
			 * 
			 * //실제) parameter 사용 //values(?,?,?);
			 * 
			 * //executeUpdate() >> insert , update , delete int resultrowcount =
			 * stmt.executeUpdate(sql); //default commit if(resultrowcount > 0) {
			 * System.out.println("반영된 행의 수 : " + resultrowcount); }else { //0또는 작은 경우 ...
			 * System.out.println("실패 : " + resultrowcount); } //insert 실패 경우 :
			 * stmt.executeUpdate(sql) 실행 시 발생 예외 //resultrowcount 값을 반환 받기 전에 발생 //1. PK 위반
			 * //2. 컬럼의 길이 //3. 타입 설정
			 * 
			 */

			// UPDATE
			// update dmlemp set sal=0 where deptno=?
			/*
			 * int deptno=0; Scanner sc = new Scanner(System.in);
			 * System.out.println("부서번호입력:"); deptno = Integer.parseInt(sc.nextLine());
			 * 
			 * String sql="update dmlemp set sal=0 where deptno=" + deptno;
			 * 
			 * int resultrowcount = stmt.executeUpdate(sql);
			 * 
			 * if(resultrowcount > 0) { System.out.println("반영된 행의 수 : " + resultrowcount);
			 * }else { //0또는 작은 경우 ... System.out.println("실패 : " + resultrowcount); }
			 */

			// DELETE
			// delete from dmlemp where deptno=?
			int deptno = 0;
			Scanner sc = new Scanner(System.in);
			System.out.println("부서번호입력:");
			deptno = Integer.parseInt(sc.nextLine());

			String sql = "delete from dmlemp where deptno=" + deptno;

			int resultrowcount = stmt.executeUpdate(sql);

			if (resultrowcount > 0) {
				System.out.println("반영된 행의 수 : " + resultrowcount);
			} else {
				// 0또는 작은 경우 ...
				System.out.println("실패 : " + resultrowcount);
			}
		} catch (Exception e) {
			System.out.println("예외발생 :" + e.getMessage());
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}

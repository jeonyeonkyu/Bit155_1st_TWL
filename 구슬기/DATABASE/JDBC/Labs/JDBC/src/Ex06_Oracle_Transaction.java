import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import kr.or.bit.utils.SingletonHelper;

/*
 상황 1.
같은 DB를 놓고 둘이 수정을 할때 너구리가 수정해놓고 의사반영(commit,rollback)을 하지 않으면 
작동하지 않는다.
너구리가 의사반영(commit,rollback) 을 하는 순간, 고양이의 cmd 는 밀려있던 작업들이 진행된다.

  상황 2.
너구리가  보고서 작성했는데  그사이 고양이가 수정한 데이터를 커밋하면 너구리는 팬텀데이터, 고스트데이터? 로  보고서를 작성한게 되어버린다. 


연습용 테이블 두개 Oracle 에서 생성함. 
create table trans_A(
    num number,
    name varchar2(20)
);

create table trans_B(
    num number constraint pk_trans_B_num primary key,
    name varchar2(20)
);

    
JDBC >> default (DML)  >> autocommit

JDBC >> autocommit >> false >> 개발자가 (commit , rollback 강제할수 있다)

    
    
*/
//처음에는 성공
//두번째에는 B table에서 PK 때문에 에러남.


public class Ex06_Oracle_Transaction {
	public static void main(String[] args) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		
		conn = SingletonHelper.getConnection("oracle");
		String sql = "insert into trans_A(num,name) values(100,'A')";
		String sql2 = "insert into trans_B(num,name) values(100,'B')";
		try {
			conn.setAutoCommit(false);  //default true  에서  false 로 바꾸는거.... 이제부터 commit, rollback 할수있다.
			
			//begin tran
			//둘다 성공, 둘다 실패
			pstmt = conn.prepareStatement(sql);
			pstmt.executeQuery();
			
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.executeQuery();
			
			//여기까지 온다는건 두개 다 성공했다는 뜻.
			conn.commit(); //   두개 다 성공한 지금 실 반영!!!!!!!
			System.out.println("commit 성공~~~~~~!!!!");
			
			
			//end tran
		} catch (Exception e) {
			
			//예외처리
		    System.out.println("실패하면...." + e.getMessage());
		    try {
				conn.rollback();  //이거 중요.
				System.out.println("rollback 했어용~~~~~~~!!!"); //
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		
		}finally {
			SingletonHelper.close(pstmt);
			SingletonHelper.close(pstmt2);
		}
		

	}

}

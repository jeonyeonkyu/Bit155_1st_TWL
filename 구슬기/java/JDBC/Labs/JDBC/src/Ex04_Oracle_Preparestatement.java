import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.or.bit.utils.SingletonHelper;

/*
 PreparedStatement (준비된 Statement )        
 ? == (parameter)
  (1) 설명 
     미리 SQL문이 셋팅된 Statement 가 DB가 전송되어져서   컴파일되어지고, 
     SQL문의 ?(parameter)만 나중에 추가 셋팅해서 실행 ... 준비된 Statement 
  
  (2) 장점 
     <1> Statement 에 비해서 반복적인 SQL문을 사용할 경우에  더 빠르다. ( 특히, 검색문 )
  <2> DB컬럼타입과 상관없이 ?(parameter) 하나로 표시하면 되므로   개발자가 헷깔리지 않고 쉽다. ( 특히, INSERT문 )
       (이유: ?(parameter)를 제외한 SQL문이 DB에서 미리 컴파일되어져서 대기)

  
  (3) 단점 
     SQL문마다 PreparedStatement 객체를 각각 생성해야 하므로 재사용불가
     (but, Statement 객체는 SQL문이 달라지더라도 한 개만 생성해서  재사용이 가능하다. )

  (4) 특징 
     <1> Statement stmt = con.createStatement(); //생성        생성해놓고 실행구문에 () 만 갈아끼우면 된다. 
        stmt.execute(sql);//실행
     <2> PreparedStatement pstmt = con.prepareStatement(sql); //생성           생성부터 다시해야 갈아끼울수 있다. 
        pstmt.execute(); //실행

  (5) 주의 
     DB 객체들(table, ..)의 뼈대(   테이블명 or 컬럼명 or 시퀀스명 등의 객체나 속성명)은 
      ?로 표시할 수 없다. 
     즉, data 자리에만 ?로 표시할 수 있다.
     cf) 그래서, DDL문에서는 PreparedStatement를 사용하지 않는다.
     
     
     장점 : 보안, 미리 쿼리문 컴파일>> 추후 parameter 값 변경 처리 (성능)
     단점 : 쿼리문 재사용 (  PreparedStatement pstmt = con.prepareStatement(sql); 재생성 해야함.
     
     단점 보다는 장점이 크다.. 요즘 프로그램은 보안을 많이 중요시한다. 얘를 쓰는게 좋음.
 */
public class Ex04_Oracle_Preparestatement {

	public static void main(String[] args) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {    //Ex01_ 이랑 비교하면 됨.
			conn = SingletonHelper.getConnection("oracle");
			String sql = "select empno , ename from emp where deptno = ?";    //?==(parameter)
			//where id = 100 and name = '홍길동' and job = 'IT'
			//where id = ? and name = ? and job = ?
			
			//Statement stmt = conn.createStatement();   아까 한 방법
			//stmt.executeQuery(sql);
			
			pstmt = conn.prepareStatement(sql); //오라클 서버 미리 전달 컴파일  후 대기
			
			//  이후에는 parameter 정보만 설정해서 실행
			//  ? 자리에 무엇인가를 설정해야함
			pstmt.setInt(1, 10);    //where deptno = 30  을 의미한다.      1번째 물음표는 30 이다.
			                        //where deptno = 50  조회된 데이터가 없습니다.
			                        //where deptno = 10 데이터 3건 나옴. 
			
			rs = pstmt.executeQuery();
			
			
			//공식같은 로직 
			
			//while(rs.next()) {  //rs.next()  는 Boolean 타입이다.   데이터 있니? true 면 while문 들어감. 
			//	System.out.println(rs.getInt(1) + "/"+ rs.getString(2));
			//}
			
			//데이터가 1건, 데이터가 1건 이상, 데이터가 없는 경우.  이렇게 세가지인데
			//while 을 쓰면 이런 조건에 체크를 못한다. 
			//if 를쓰면  세가지 경우를 if블럭 하나가 다 처리할 수 있다. 
			
			if(rs.next()) {  //최소 한건의 데이터는 있다.
				do {  //한건이면 do 한번 하고 while 문에서 rs.next()만나서 탈출하거나 또 돈다.  그래서 아예 데이터 없는경우, 한개인경우, 여러개인 경우 다 가능하다. 
					System.out.println(rs.getInt(1) + "/"+ rs.getString(2));
				} while (rs.next());  // 1건 이상인 경우에 돈다. 
				
			}else {  // 데이터가 없다.
				System.out.println("조회된 데이터가 없습니다.");
			}
			
					
			
			
		} catch (Exception e) {
			
		}finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
			//연결 계속 지속.....APP 살아있는한 계속... Singleton 이니까. 
			
		}

	}

}

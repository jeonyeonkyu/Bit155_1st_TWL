import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/*
create table t_table(
  tdate date,
  tdate2 TIMESTAMP
)
insert into t_table values(sysdate,sysdate);
commit;
select * from t_table;
16/03/03    16/03/03 11:40:32.000000000
*/
public class program {
    
	public static void main(String[] args) {
		    Connection conn =null;
	        PreparedStatement pstmt =null;
	        ResultSet rs = null;
	        
	        try{
	            conn = Singleton_Helper.getConnection("oracle");
	            String sql="select tdate,tdate2 from t_table";
	            pstmt = conn.prepareStatement(sql); //미리 컴파일
	            
	            rs = pstmt.executeQuery();
	            if(rs.next()){
	                do{
	                    
	                    //public java.sql.Date t_date;
	                    //public java.sql.Timestamp t_date2;
	                    //public java.util.Date t_date3;
	                    //public java.sql.Date t_date4;
	                	
	                    Tdate tdate = new Tdate();
	                    tdate.t_date = rs.getDate(1);
	                    tdate.t_date2 = rs.getTimestamp(2);
	                    tdate.t_date3 = rs.getTimestamp(1);
	                    tdate.t_date4 = rs.getDate(1);
	                    System.out.println(tdate.t_date);
	                    System.out.println(tdate.t_date2);
	                    System.out.println(tdate.t_date3);
	                    System.out.println(tdate.t_date4);
	                    //원칙
	                    //Oracle Date      > Java: Java.sql.Date  (년월일)
	                    //Oracle Timestamp > java: java.sql.Timestamp(년월일시분초)
	                    //날짜 > 문자로 전환해서 (필요한 값만 추출)
	                    /*
	                     select sysdate , 
	                               to_char(tdate2,'YYYY') || '년' as "yyyy" ,
	                               to_char(tdate2,'YEAR'),
	                               to_char(tdate2,'MM'),
	                               to_char(tdate2,'DD'),
	                               to_char(tdate2,'DAY'),
	                            to_char(tdate2,'HH')
	                     from t_table; 
	                      
	                     */
	                    
	                }while(rs.next());
	            }else{
	                System.out.println("데이터 없어요");
	            }
	        }catch(Exception e){
	            System.out.println(e.getMessage());
	        }finally{
	        	Singleton_Helper.close(pstmt);
	        	Singleton_Helper.close(rs);
	        	Singleton_Helper.close(conn);
	        }
	                
	 
	    }
	 

	}



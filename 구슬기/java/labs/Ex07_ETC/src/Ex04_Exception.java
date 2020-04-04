import java.io.IOException;

import kr.or.bit.ExceptionClass;

public class Ex04_Exception {

	public static void main(String[] args) {
		
		ExceptionClass ex =null; //블럭변수가 되지 않게 밖으로 빼준다.로컬이니까 초기화 해줘야함.  블럭 <로컬<인스턴스<스테틱 변수, 변수의 크기
		try {
			 ex = new ExceptionClass("world");//ExceptionClass 에서 예외로 강제해놧기때문에 trycatch 를 써야함.
		    ex.call();
//		    System.out.println("call 함수 start");
//			int i= 0/0; 
//			System.out.println("call 함수 end");
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		try {
			ex.call();
		} catch (Exception e) {
			
		}
	    
	}

}

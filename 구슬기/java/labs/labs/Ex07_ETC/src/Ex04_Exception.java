import java.io.IOException;

import kr.or.bit.ExceptionClass;

public class Ex04_Exception {

	public static void main(String[] args) {
		
		ExceptionClass ex =null; //�������� ���� �ʰ� ������ ���ش�.�����̴ϱ� �ʱ�ȭ �������.  �� <����<�ν��Ͻ�<����ƽ ����, ������ ũ��
		try {
			 ex = new ExceptionClass("world");//ExceptionClass ���� ���ܷ� �����؇J�⶧���� trycatch �� �����.
		    ex.call();
//		    System.out.println("call �Լ� start");
//			int i= 0/0; 
//			System.out.println("call �Լ� end");
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		try {
			ex.call();
		} catch (Exception e) {
			
		}
	    
	}

}

package kr.or.bit;

import java.io.IOException;

/*
 ���赵 (class)���� �� ..�������� �ڵ尡 �ִµ� ������ ����Ű���..
 �� ���赵�� ����ϴ� �����ڰ� ���ܸ� ó���� �־����� ���ڴµ�..[������]
 
 
���赵�� ���鶧 �� ���赵�� ���»���� ����ó���ϵ��� �����Ҽ� �ִ�!!!!
throws �߻��ɼ��ִ� ���ܵ��� ���ָ�...
 
 ������ �ڿ� throws IoException, NullPointerException �� �������� ���ϼ� �־.
 �Լ� �ڿ� 
 */
public class ExceptionClass {
	public ExceptionClass(String path) throws IOException, NullPointerException{
		
	}
	
	public void call() throws ArithmeticException, IndexOutOfBoundsException{
		System.out.println("call �Լ� start");
		int i= 0/0; 
		System.out.println("call �Լ� end");
	}

}

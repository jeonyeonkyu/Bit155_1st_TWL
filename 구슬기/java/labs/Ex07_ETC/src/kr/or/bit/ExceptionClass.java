package kr.or.bit;

import java.io.IOException;

/*
 설계도 (class)만들 때 ..여러가지 코드가 있는데 문제가 생길거같아..
 내 설계도를 사용하는 개발자가 예외를 처리해 주었으면 좋겠는데..[강제로]
 
 
설계도를 만들때 내 설계도를 쓰는사람이 예외처리하도록 강제할수 있다!!!!
throws 발생될수있는 예외들을 써주면...
 
 생성자 뒤에 throws IoException, NullPointerException 등 여러개를 붙일수 있어서.
 함수 뒤에 
 */
public class ExceptionClass {
	public ExceptionClass(String path) throws IOException, NullPointerException{
		
	}
	
	public void call() throws ArithmeticException, IndexOutOfBoundsException{
		System.out.println("call 함수 start");
		int i= 0/0; 
		System.out.println("call 함수 end");
	}

}

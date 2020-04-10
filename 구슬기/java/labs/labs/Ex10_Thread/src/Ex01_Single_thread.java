/*
 프로그램 >> 프로세스 >>쓰레드(최소 동작 단위)
 지금까지
 싱글프로세스 : 싱글쓰레드(main함수)로 프로그램을 짜왔다.
 JVM : call Stack >> 함수 동작....
 현재 프로세스가 stack을 하나만 갖고 있기 때문에 
 함수가 10개라도 한번에 하나의 함수만 동작한다...
 [순차적 실행]
 
 
 */

public class Ex01_Single_thread {
	public static void main(String[] args) {
		System.out.println("나 main 일꾼이야");
		worker();
		worker2();
		System.out.println("main 일꾼 종료");

	}
	static void worker() {
		System.out.println("나 1번 일꾼이야");
	}
	static void worker2() {
		System.out.println("나 2번 일꾼이야");
	}

}

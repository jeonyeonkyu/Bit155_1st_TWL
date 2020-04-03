package Ex10_Thread;

/*
Thread : 프로세스에서 하나의 최소 실행단위(method)
>> Stack >> Multi >> Stack 여러개 ...

Thread 생성하는 방법
1. Thread 클래스를 상속 -> class Test extends Thread > 새로운 stack 올라가서 놀 준비
     반드시 Thread 가지는 run()  구현
  >> Thread 일반 클래스 >> 스스로 객체 생성이 가능
2. class Test extends Car implements Runnable 
  >> 일반 클래스 Thread 말고 다른 클래스를 상속할 경우 .....

*/
class Thread_1 extends Thread{
	@Override
	public void run() { //run() 함수  main 함수와 동일한 역할  //새로운 stack 처음 올라가는 함수
		for(int i = 0 ; i < 1000 ; i++) {
			System.out.println("Thread_1 : " + i + this.getName());
		}
		System.out.println("Thread_1 run() END");
	}

}

class Thread_2  implements Runnable{  
	//Thread_2 다른 클래스를 이미 상속해서 ... 
	//class Thread_2 extends Object
	@Override
	public void run() {
		for(int i = 0 ; i < 1000 ; i++) {
			System.out.println("Thread_2 : " + i );
		}
		System.out.println("Thread_2 run() END");
		
	}
	
}
public class Ex02_Multi_Thread {
	public static void main(String[] args) {  //main 도 하나의 Thread
		//1번
		Thread_1 th = new Thread_1();
		th.start(); //POINT >> call stack 새로 생성하고 그 stack에 run() 함수 올려놓기


		//2번
		Thread_2 th2 = new Thread_2(); // Thread 일까요 .. (x)  인터페이스만 구현한 클래스
		Thread thread = new Thread(th2);
		thread.start(); //POINT >> call stack 새로 생성하고 그 stack에 run() 함수 올려놓기

		for(int i = 0 ; i < 1000 ; i++) {
			System.out.println("main : " + i );
		}
		System.out.println("Main END");
	}

}








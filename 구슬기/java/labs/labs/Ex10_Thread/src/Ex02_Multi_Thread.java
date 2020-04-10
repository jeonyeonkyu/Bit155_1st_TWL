/*
 
 Thread : 프로세스에서 하나의 최소 실행 단위(method)
 >> stack 으로 봐도 된다. 논리적으로 맞진 않지만..    multi >>stack 여러개로 이해하기...
 
 Thread 생성하는 방법 
 1. Thread 클래스를 상속-> class Test extends Thread  이렇게 하면 새로운 스택에 올라가서 놀준비를 하는거당
    반드시 Thread 가지는 run() 함수를 구현해야한다. 
    >> Thread 일반클래스다 >> 스스로 객체생성이 가능하다.
    
 2. class Test extends Car implements Runnable  인터페이스를 구현한다. 
    >> 일반 클래스 Thread 말고 다른 클래스를 상속하고 있는 경우......
 

 */
class Thread_1 extends Thread{ //Thread 가 추상클래스가 아님에도  run() 을재정의 해야한다.

	@Override
	public void run() { //run() 함수 는 main 함수와 동일한 역할을 한다. == 새로운 stack 에 처음 올라가는 함수다. 
		for(int i = 0;i<1000;i++) {
			System.out.println("Thread_1: "+ i + this.getName());//getName 은 쓰레드가 갖고있는 자원
		}
		System.out.println("Thread_1 run() END");
	}
	
}

class Thread_2 implements Runnable{ //얘는 사실 쓰레드는 아니다... 쓰레드가 될수 있는 요건을 갖춘것임...
	//Thread_2가 다른 클래스를 이미 상속해서..
	//class Thread_2 extends Object

	@Override
	public void run() {
		for(int i = 0;i<1000;i++) {
			System.out.println("Thread_2: "+ i );
		}
		System.out.println("Thread_2 run() END");
		
	}
	
}
public class Ex02_Multi_Thread {
	public static void main(String[] args) { //메인도 하나의 쓰레드다.
		//1번 
		Thread_1 th = new Thread_1();
		th.start();// POINT!!!!!   >>  call stack 을 새로 생성하고 그 stack에  run() 함수를 올려놓기까지 를 start() 한다. 
		
		//2번
		//왜 굳이 이렇게 인터페이스 만들고...이런식으로 할까? 
		//만약 Thread_2가 다른 클래스를 이미 상속해서 갖고 있다면 ..다중상속이 안되기때문에..  다중상속때문에 생긴 방법이다.
		Thread_2 th2 = new Thread_2(); //얘는 Thread 일까요? 아니에요! 쓰레드를 구현해야 쓰레드다.. 얘는 그냥 인터페이스만 구현한 클래스 이다. 
		Thread thread = new Thread(th2); //Thread 객체생성후 th2 를 넣어준다. 이렇게 하면 쓰레드로 인정해주자! 
		thread.start();// POINT!!!!!   >>  call stack 을 새로 생성하고 그 stack에  run() 함수를 올려놓기까지 를 start() 한다.
		
		
		//main
		for(int i = 0;i<1000;i++) {
			System.out.println("main: "+ i );
		}
		System.out.println("Main END"); //쓰레드는 순서를 보장받지 못한다...  누가 먼저 끝날지 알수 없다. 전문용어로..Runnable .. 다섯마리말이 왔따갔다...
		//여러개의 함수가 동시에 실행될수있게 하는건데..사실 동시라는 말이 없다.. cpu를 점유하는것..
		//시작을 먼저했다고 먼저끝나는 것도 아님. 
		//그래서 쓰레드로 경마게임을 만든다. 여섯개의 스택에 포문을 돌려놓고...누군가는 먼저 끝난다...그게 1등 말..
		
		
		//현재 쓰레드 3개를 갖고 놀고 있는 거임.  세개 다 왔다갔다 동시에 실행된다. 

	}

}

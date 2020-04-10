//데몬: Thread(보조)
//Main Thread 와 생명을 같이 하겠다.
//한글 >> 작업>> 3초간격으로 작업내용 저장하겠다.   ..저장버틀을 누리지 않아도.
//한글 작업 종료>> 3초간격으로 작업내용 저장하는 것도 종료..

public class Ex08_Damon_Thread implements Runnable{
	static boolean autosave = false;

	public static void main(String[] args) {
		Thread th = new Thread(new Ex08_Damon_Thread());
		//th 라는 쓰레드는 main 스레드의 보조 쓰레드로 만들거임(Damon 이라고 함)
		//main 이 하나의 쓰레드..(non-damon) 이라고 함. 
		//main 함수의 스레드와 운명을 같이 하겠다! (보조 : th) 
		th.setDaemon(true); //얘를 주석처리하고 실행할 경우 Main Thread 의 숫자 세는 것이 끝나도 저장은 계속된다. 
		th.start();
		
		for(int i =0; i<= 30;i++) {
			try {
				Thread.sleep(1000);//1초
			} catch (Exception e) {
				System.out.println(e.getMessage());

			}
			System.out.println("Main Thread 동작: "+i);
			if(i==5) { //i값이 5가 되는 시점부터
				System.out.println("i: "+i);
				autosave = true;
			}
		}
		

	}
	public void autoSave() {
		System.out.println("문자가 3초 간격으로 자동 저장 되었습니다.");
	}

	@Override
	public void run() {
		while(true) {
			try {
				Thread.sleep(3000); //3초 간격으로 재운다.
				
			}catch (Exception e) {
				
			}
			if(autosave) { //static boolean autosave   가 true 값이라면... 
				autoSave(); //이 함수를 호출합니다.
			}
		}
		
	}

}

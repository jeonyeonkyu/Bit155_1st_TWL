//데몬 : Thread (보조)
//Main Thread 와 생명을 같이 하겠다
//한글 >> 작업 >> 3초간격으로 작업내용 저장 
//한글 작업 종료 >> 3초간격으로 작업 같이 종료 
public class Ex08_Damon_Thread implements Runnable {
	static boolean autosave = false;
	public static void main(String[] args) {
		Thread th = new Thread(new Ex08_Damon_Thread()); 
		//th 라는  스레드는   main 스레드의 보조 (Damon)
		//main 하나의  스레드 (non-damon)
		//main 함수의 스레드와 운명을 같이 하겠다 (보조 : th)
		th.setDaemon(true);
		th.start();
		
		for(int i = 0 ; i <= 30 ; i++) {
			try {
				Thread.sleep(1000); //1초
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			System.out.println("Main Thread 동작 : " + i);
			if(i == 5) { //i값이 5가 시점부터
				System.out.println("i : " + i);
				autosave = true;
			}
		}

	}
    public void autoSave() {
    	System.out.println("문자가 3초 간격으로 자동 저장 되었습니다");
    }
	
	@Override
	public void run() {
		while(true) {
			try {
				Thread.sleep(3000); //3초 간격
			}catch (Exception e) {
				
			}
			if(autosave) {  //static boolean autosave   true 값이라면 ...
				autoSave();
			}
		}
		
	}

}






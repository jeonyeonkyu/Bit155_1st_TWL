import javax.swing.JOptionPane;
//완성시켜보기.


/*
 
 main함수 제외한 Thread 2개 생성
1.시간(time) 제어하는 Thread 
2.
 
 */
class WordTime2 extends Thread{

	@Override
	public void run() {
		for(int i = 10; i>0;i--) {
			try {
				System.out.println("남은시간: "+i);
				sleep(1000); //1초간 휴게실에 가있다가 나와라.. 약간의 딜레이가 생기게 해둔다.
			} catch (Exception e) {
				System.out.println(e.getMessage());

			}
		}
	}
	
}
class Input extends Thread{
	static String inputdata;

	@Override
	public void run() {
		
		
		 inputdata = JOptionPane.showInputDialog("값을 입력하세요");
		System.out.println("입력값: "+ inputdata);

	}
	
}
public class Ex05_WordGame {

	public static void main(String[] args) {
//		WordTime2 timer = new WordTime2();
//		timer.start(); //stack 만들어서 run올려두는 것 가지
//		
//		Input w = new Input();
//		w.start();
//		
		while(true){
			WordTime2 timer = new WordTime2();
			timer.start(); //stack 만들어서 run올려두는 것 가지
			
			Input w = new Input();
			w.start();
			if(!w.equals(null)) {
//				;
			}
		}


	}
	
}

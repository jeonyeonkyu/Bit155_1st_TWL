import javax.swing.JOptionPane;

//시간을 처리하는 함수를 별도의 쓰레드로 만들예쩡
class WordTime extends Thread{

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

public class Ex04_Multi_Thread_Word_Game {
	public static void main(String[] args) {
		WordTime timer = new WordTime();
		timer.start(); //stack 만들어서 run올려두는 것 가지
		
		String inputdata = JOptionPane.showInputDialog("값을 입력하세요");
		System.out.println("입력값: "+ inputdata);

	}

}

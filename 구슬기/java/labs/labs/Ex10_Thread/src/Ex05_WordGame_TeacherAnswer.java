import javax.swing.JOptionPane;

/*
문제
main 함수 제외한 Thread 2개 생성
1. 시간(time) 제어하는 Thread
2. 단어 입력을 처리하는 Thread

main 함수 2개 실행

단 단어를 하나라도 입력해서 확인 버튼을 누르면 시간을 멈추게 하세요
hint) 공유자원 (static)

Thread : 자기들만의 상태정보를 가지고 있더라....ppt 보면 state 어쩌구 하고 나옴. 
join() 다른 쓰레드의 종료를 기다리는것. (휴게실에서)
다양한 계산 작업....ex)각 행성 별 거리를 구해서.. 그 합산한 결과를 보기...
10 개  중 1개의 쓰레드는 그 결과를 합산해야함.  그 1개는 나머지 9개가 끝날때까지 기다리는것 그게 join().....


main 스레드에게 join 걸어서  기달려.. WordInputProcess,


구구단 게임.. 스테틱.. 조인.. 다써라.

*/
class WordInputProcess extends Thread{
	@Override
	public void run() {
		String dan="2";
		String inputdata = JOptionPane.showInputDialog("dan" + "단 값을 입력");
		if(inputdata != null && !inputdata.equals("")) {
			Ex05_WordGame_TeacherAnswer.inputcheck = true; //값을 변경
		}
		System.out.println("입력한 값은: " + inputdata);
	}
}


class WordTimeOut extends Thread{
	@Override
	public void run() {
		for(int i=10; i > 0 ; i--) {
			
			if(Ex05_WordGame_TeacherAnswer.inputcheck)return; //run함수 탈출
			
			System.out.println("남은 시간: " + i);
			try {
				 Thread.sleep(1000); //대기실에서 1초간 쉬었다 ....
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
public class Ex05_WordGame_TeacherAnswer {
	static boolean inputcheck= false;
	public static void main(String[] args) {
		WordInputProcess word = new WordInputProcess();
		WordTimeOut time = new WordTimeOut();
			
		word.start();
		time.start();
		
		try {
			word.join(); //main에게 word가 끝날때까지 기다려...
			time.join(); //main에게 time이 끝날때까지 기다려...
			//하나의 쓰레드가 다른쓰레드의 완료시점에 끝난다. 
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		System.out.println("Main END");

	}

}

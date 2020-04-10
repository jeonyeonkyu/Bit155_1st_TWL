import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

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
class WordInputProcess2 extends Thread{
	
	
	@Override
	public void run() {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("고양이", "야옹");
		map.put("강아지", "멍멍");
		map.put("늑대", "아우");
		map.put("소", "음메");
		map.put("양","메에");
		
		String dan=" ";
		Set<String> set= map.keySet(); 
		String[] ss = new String[5];
		Iterator a = set.iterator();
		String aa = null;
		while(a.hasNext()) {
			 aa = (String) a.next();
			 for(int i=0;i<ss.length;i++) {
				 ss[i] =aa;
			 }
		}
		
	    String inputdata = JOptionPane.showInputDialog(map.get(aa)+ "우는 소리 입력");
	    
		
		
	    Collection vlist = map.values(); //value만을 담는 집합
		
		if(inputdata != null && !inputdata.equals(vlist)) {
			Ex05_gugudan.inputcheck = true; //값을 변경
		}
		System.out.println("입력한 값은: " + inputdata);
	}
}


class WordTimeOut2 extends Thread{
	@Override
	public void run() {
		for(int i=10; i > 0 ; i--) {
			
			if(Ex05_gugudan.inputcheck)return; //run함수 탈출
			
			System.out.println("남은 시간: " + i);
			try {
				 Thread.sleep(1000); //대기실에서 1초간 쉬었다 ....
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
public class Ex05_gugudan {
	static boolean inputcheck= false;
	public static void main(String[] args) {
		WordInputProcess2 word = new WordInputProcess2();
		WordTimeOut2 time = new WordTimeOut2();
		
			
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

//여러개의 스레드 우선부여 .... 점유율(cpu)
//Min 1  ~  Max 10  >> default 5

class Pth extends Thread {
	@Override
	public void run() {
		for(int i = 0 ; i < 1000 ; i++) {
			System.out.println("----------------");
		}
	}
}
class Pth2 extends Thread {
	@Override
	public void run() {
		for(int i = 0 ; i < 1000 ; i++) {
			System.out.println("||||||||||||||||");
		}
	}
}
class Pth3 extends Thread {
	@Override
	public void run() {
		for(int i = 0 ; i < 1000 ; i++) {
			System.out.println("***************");
		}
	}
}
public class Ex07_priority {
	public static void main(String[] args) {
		Pth pth = new Pth();
		Pth2 pth2 = new Pth2();
		Pth3 pth3 = new Pth3();
		
		System.out.println(pth.getPriority());
		System.out.println(pth2.getPriority());
		System.out.println(pth3.getPriority());
		
		//pth.setPriority(10);  //먼저 END  ....   --------------
		//pth3.setPriority(1);  //나중에 ....      ************** 
		
		pth.start();
		pth2.start();
		pth3.start();

	}

}









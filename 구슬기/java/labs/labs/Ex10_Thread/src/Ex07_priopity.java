//여러개의 스레드 우선부여..점유율(cpu)
//Min 1 ~  Max 10 의 상대적수치를 갖고 있다. >> default 5

class Pth extends Thread{
	@Override
	public void run() {
		for(int i = 0; i< 1000;i++) {
			System.out.println("--------------");
		}
	}
}
class Pth2 extends Thread{
	@Override
	public void run() {
		for(int i = 0; i< 1000;i++) {
			System.out.println("|||||||||||||||");
		}
	}
}
class Pth3 extends Thread{
	@Override
	public void run() {
		for(int i = 0; i< 1000;i++) {
			System.out.println("***************");
		}
	}
}
public class Ex07_priopity {
	public static void main(String[] args) {
		Pth pth = new Pth();
		Pth2 pth2 = new Pth2();
		Pth3 pth3 = new Pth3();
		
		System.out.println(pth.getPriority());//얘네가 갖고 있는 우선순위값을 갖고오기   //현재는 다 5가 나온다.
		System.out.println(pth2.getPriority());
		System.out.println(pth3.getPriority());
		
		pth.setPriority(10);   //먼저  END.....    //절대적인건 아니고 상대적으로 먼저 끝낼 확률을 높여줌    -------------
		pth3.setPriority(1);  //나중에..                                               **************
		//약간의 조작을 할수 있는 것. 
		
		pth.start();
		pth2.start();
		pth3.start();
		

	}

}

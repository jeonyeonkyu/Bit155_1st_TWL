//�������� ������ �켱�ο�..������(cpu)
//Min 1 ~  Max 10 �� �������ġ�� ���� �ִ�. >> default 5

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
		
		System.out.println(pth.getPriority());//��װ� ���� �ִ� �켱�������� �������   //����� �� 5�� ���´�.
		System.out.println(pth2.getPriority());
		System.out.println(pth3.getPriority());
		
		pth.setPriority(10);   //����  END.....    //�������ΰ� �ƴϰ� ��������� ���� ���� Ȯ���� ������    -------------
		pth3.setPriority(1);  //���߿�..                                               **************
		//�ణ�� ������ �Ҽ� �ִ� ��. 
		
		pth.start();
		pth2.start();
		pth3.start();
		

	}

}

/*
   ����ȭ 
   �Ѱ� ������� ȭ���(�����ڿ�) : �������� �����尡 ���ÿ� ���� ������ �ڿ� 
   ȭ��� 1�� , ��� 10�� (Thread 10��)
   
   �ݴ� 
   �Ѱ� ����� ���� : �������� ��� 

 ��ü  : LOCK
 �Լ�  : LOCK synchronized
*/
class Wroom{
	synchronized void openDoor(String name){
		System.out.println(name + "�� ȭ��� ���� ^^");
		for(int i = 0 ; i < 100 ; i++) {
			System.out.println(name + "��� : " + i);
			if(i == 10) {
				System.out.println(name + "�� �� ~~");
			}
		}
		System.out.println("�ÿ��ϴ� ^^!");
	}
}

class User extends Thread{
	Wroom wr;
	String who;
	
	User(String name, Wroom w){
		this.who = name;
		this.wr = w;
	}
	
	@Override
	public void run() {
		wr.openDoor(this.who);
	}
}

public class Ex10_Sync_Thread {
	public static void main(String[] args) {
		//�Ѱ� ��ġ
		Wroom w = new Wroom();
		
		//�����
		User kim = new User("�达", w);
		User park = new User("�ھ�", w);
		User lee = new User("�̾�", w);
		
		//����� �谡���ۿ�
		
		kim.start();
		park.start();
		lee.start();

	}

}






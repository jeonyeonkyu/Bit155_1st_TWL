package ��ü��������;
import java.util.Scanner;

public class Ex3 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		boolean flag = true;
	
		User user1 = new User("�ڸ��",16);
		User user2 = new User(44,"���缮");
		User user3 = new User("������");
		User user4 = new User(82);
		int a;
		
		
		System.out.println("������ȣ	�̸�	����");
		System.out.println("===================");
		System.out.print("1");
		user1.print();
		System.out.print("2");
		user2.print();
		System.out.print("3");
		user3.print();
		System.out.print("4");
		user4.print();
		while(flag){
			System.out.println("������ ���� ��ȣ �Է� (���� : 0) :");
			a= sc.nextInt();
			switch(a){
				case 0: 
					flag=false;
					break;
				case 1:
					user1.using();
					break;
				case 2:
					user2.using();
					break;
				case 3:
					user3.using();
					break;
				case 4:
					user4.using();
					break;
				default:
					System.out.println("�߸��Է��ϼ̽��ϴ�. �ٽ� �Է����ּ���.");
			}
		}
		
		
		System.out.println("������ȣ	�̸�	����");
		System.out.println("===================");
		System.out.print("1");
		user1.print();
		System.out.print("2");
		user2.print();
		System.out.print("3");
		user3.print();
		System.out.print("4");
		user4.print();
	}

}



class User{
	private String name = "";
	private int age = 0;
	Scanner sc = new Scanner(System.in);
	
	//������ �����ε�
	User(String name, int age){
		this.name=name;
		this.age=age;
	}
	User(int Age, String name){
		this.name=name;
		this.age=Age;
	}
	User(String name){
		this.name=name;
	}
	User(int age){
		this.age=age;
	}
	//�޼ҵ� �����ε�
	private void set(String name){
		this.name=name;
	}
	private void set(int age){
		this.age=age;
	}
	//���� ���
	public void print(){
		System.out.print("	"+name+"	"+age+"\n");
	}
	//����
	private void sett(){
		System.out.println("�̸�: ");
		set(sc.nextLine());
		System.out.println("����: ");
		set(sc.nextInt());
	}
	public void using(){
		sett();
	}
}
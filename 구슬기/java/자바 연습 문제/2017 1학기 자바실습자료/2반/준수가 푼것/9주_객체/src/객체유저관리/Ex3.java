package 객체유저관리;
import java.util.Scanner;

public class Ex3 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		boolean flag = true;
	
		User user1 = new User("박명수",16);
		User user2 = new User(44,"유재석");
		User user3 = new User("정형돈");
		User user4 = new User(82);
		int a;
		
		
		System.out.println("유저번호	이름	나이");
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
			System.out.println("수정할 유저 번호 입력 (종료 : 0) :");
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
					System.out.println("잘못입력하셨습니다. 다시 입력해주세요.");
			}
		}
		
		
		System.out.println("유저번호	이름	나이");
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
	
	//생성자 오버로딩
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
	//메소드 오버로딩
	private void set(String name){
		this.name=name;
	}
	private void set(int age){
		this.age=age;
	}
	//상태 출력
	public void print(){
		System.out.print("	"+name+"	"+age+"\n");
	}
	//셋팅
	private void sett(){
		System.out.println("이름: ");
		set(sc.nextLine());
		System.out.println("나이: ");
		set(sc.nextInt());
	}
	public void using(){
		sett();
	}
}
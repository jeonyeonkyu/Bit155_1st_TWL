package �������̽�_�߻�Ŭ����_����;
import java.util.Scanner;
public class �߻�Ŭ�������� {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		Stack stk = new Stack();
		boolean flag = true;
		System.out.println("�޴�");
		System.out.println("1. Push, 2. Pop, 3. ����");
		while(flag){
			int i = sc.nextInt();
			switch(i){
				case 1 :
					System.out.println("���� �Է�");
					int number = sc.nextInt();
					stk.push(number);
					stk.printCurrentStack();
					break;
				case 2 :
					stk.pop();
					stk.printCurrentStack();
					break;
				case 3 :
					flag=false;
					break;
				default :
					System.out.println("�߸� �Է��ϼ̽��ϴ�.");
			}
		}
	}

}
abstract class StackManager{
	abstract void push(int value);
	abstract void pop();
	abstract void printCurrentStack();
}

class Stack extends StackManager{
	static int[] stack = new int[1000];
	private int index=0;
	void pop(){
		if(index>0){
			index--;
			stack[index]=0;
		}
	}
	void push(int value){
		stack[index]=value;
		index++;
	}
	void printCurrentStack(){
		System.out.println("���� ������ ũ��� " + (index) +" �Դϴ�.");
		System.out.println("-----------");
		for(int i=index-1;0<=i;i--){
			System.out.println(stack[i]);
		}
		System.out.println("-----------");
	}
}
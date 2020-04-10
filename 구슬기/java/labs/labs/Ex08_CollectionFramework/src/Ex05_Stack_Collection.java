import java.util.Stack;

import kr.or.bit.Coin;
import kr.or.bit.MyStack2;

public class Ex05_Stack_Collection {

	public static void main(String[] args) {
		//Java�� ���� ......stack  Ŭ����(LIFO)
		Stack stack = new Stack();
		stack.push("A");   //push  ���ÿ� �ִ� �Լ�
		stack.push("B");
		System.out.println(stack.pop());    //B  ���ñ����ϱ�!
		System.out.println(stack.pop());    //A
		//System.out.println(stack.pop());  ���ܹ߻�
		System.out.println(stack.isEmpty());   //true   �� ����ִ�? �ϰ� ����°Ŵ�.
		//��ź�ý��۰����� ���鶧 , �ƴ� �̰� ���پ��� �����ڴ� ������ ����ȴ�.
		
		
		//MyStack2 �����Բ�
		MyStack2 my = new MyStack2(5);
		System.out.println(my.full());
		my.push(10);
		my.push(20);
		my.push(30);
		System.out.println(my.full());
		System.out.println(my.pop());
		System.out.println(my.pop());
		System.out.println(my.pop());
		System.out.println(my.pop());
		System.out.println(my.isEmpty());
		
		
		//���� �ڽ�   //�ϻ��Ȱ�� ������� �ݿ��� �� ����� �����ϴ°� �ڷᱸ����.
		Stack<Coin> coinbox = new Stack<Coin>(); //���ÿ� �����Ŵ�!
		coinbox.push(new Coin(100));
		coinbox.push(new Coin(50));
		coinbox.push(new Coin(500));
		coinbox.push(new Coin(10));
		
		while(!coinbox.isEmpty()) {
			Coin coin = coinbox.pop();
			System.out.println("�������� :"+ coin.getValue() + "��");
		}
		
		
		

	}

}

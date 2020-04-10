import java.util.Stack;

import kr.or.bit.Coin;
import kr.or.bit.MyStack2;

public class Ex05_Stack_Collection {

	public static void main(String[] args) {
		//Java가 제공 ......stack  클래스(LIFO)
		Stack stack = new Stack();
		stack.push("A");   //push  스택에 넣는 함수
		stack.push("B");
		System.out.println(stack.pop());    //B  스택구조니까!
		System.out.println(stack.pop());    //A
		//System.out.println(stack.pop());  예외발생
		System.out.println(stack.isEmpty());   //true   너 비어있니? 하고 물어보는거다.
		//연탄시스템같은거 만들때 , 아님 이거 갖다쓰면 괜찮겠다 싶을때 쓰면된다.
		
		
		//MyStack2 선생님꺼
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
		
		
		//동전 박스   //일상생활에 어떤식으로 반영할 수 있을까를 생각하는게 자료구조다.
		Stack<Coin> coinbox = new Stack<Coin>(); //스택에 넣은거다!
		coinbox.push(new Coin(100));
		coinbox.push(new Coin(50));
		coinbox.push(new Coin(500));
		coinbox.push(new Coin(10));
		
		while(!coinbox.isEmpty()) {
			Coin coin = coinbox.pop();
			System.out.println("꺼낸동전 :"+ coin.getValue() + "원");
		}
		
		
		

	}

}

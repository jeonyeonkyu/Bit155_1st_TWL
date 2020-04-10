package kr.or.bit;


//선생님이 만드신거


//내가 직접 만드는 자료구조 (스텍)
//저장공간 : 기본적으로 Array  : Object[] stackarr
//저장소 값이 있는 위치 정보(index)
//기능 : push  , pop , empty (비어있는지 확인) , full(꽉 채워졌는지 확인)

public class MyStack2 {
	private Object[] stackarr; //저장소 
	private int maxsize; //최대크기
	private int top; //배열의 index 값 .... 위치 정보 
	
	public MyStack2(int maxsize) {
		this.maxsize = maxsize;
		stackarr = new Object[maxsize];
		top = -1;
	}
	public boolean isEmpty() {
		//구현
		return (top == -1);
	}
	public boolean full() {
		//구현
		return (top == maxsize -1);
	}
	public void push(Object i) {
		//full 검증 하시고 구현
		if(full()) {
			System.out.println("stack full");
		}else {
			stackarr[++top] = i; //처음 top== -1 >> [0]
		}
	}
	
	public Object pop() {
		//isEmpty 검증하고 구현
		Object value=null;
		if(isEmpty()) {
			System.out.println("stack empty");
			
		}else {
			value = stackarr[top];
			top--;
		}
		return value;
	}
	
}







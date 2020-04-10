package kr.or.bit;
//내가 직접 만드는 자료구조 (스택! Stack)
//저장공간 : 기본적으로 배열Array 를 사용 ....Object[] stackarr
//배열을 쓸건데 마지막에 넣은것이 먼저 빠지는 것을 구현해내야 한다.    
//저장소 값이 있는 위치정보(index) 
//기능 : push , pop  , empty (비어있는지 확인하는거), full(꽉찼는지 확인하는거)


public class MyStack {
	private Object[] stackarr;   //저장소
	private int maxsize; //최대크기
	private int top; //배열의 index 값.....위치 정보를파악
	
	public MyStack(int maxsize) {
		this.maxsize = maxsize;
		stackarr = new Object[maxsize];
		top = -1; //값이 없다는걸 -1로 많이 표현한다.
	}
	public boolean isEmpty() {
		if(maxsize ==0) {
		return true;
		}else {
		return false;}
		
	}
	
	public boolean full() {
		
		return true;
	}
	
	public void push(Object i) {
		//full 검증 하시고 구현 
	}
	
	
	public Object pop() {
		if(isEmpty()) {
			for(int i =0; i <stackarr.length;i++) {
				stackarr[i]= pop();
			}
		}else {
			System.out.println("꽉찼음");
		}
		return stackarr[top--];
		
	}

}

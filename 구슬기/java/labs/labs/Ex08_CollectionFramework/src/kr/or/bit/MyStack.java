package kr.or.bit;
//���� ���� ����� �ڷᱸ�� (����! Stack)
//������� : �⺻������ �迭Array �� ��� ....Object[] stackarr
//�迭�� ���ǵ� �������� �������� ���� ������ ���� �����س��� �Ѵ�.    
//����� ���� �ִ� ��ġ����(index) 
//��� : push , pop  , empty (����ִ��� Ȯ���ϴ°�), full(��á���� Ȯ���ϴ°�)


public class MyStack {
	private Object[] stackarr;   //�����
	private int maxsize; //�ִ�ũ��
	private int top; //�迭�� index ��.....��ġ �������ľ�
	
	public MyStack(int maxsize) {
		this.maxsize = maxsize;
		stackarr = new Object[maxsize];
		top = -1; //���� ���ٴ°� -1�� ���� ǥ���Ѵ�.
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
		//full ���� �Ͻð� ���� 
	}
	
	
	public Object pop() {
		if(isEmpty()) {
			for(int i =0; i <stackarr.length;i++) {
				stackarr[i]= pop();
			}
		}else {
			System.out.println("��á��");
		}
		return stackarr[top--];
		
	}

}

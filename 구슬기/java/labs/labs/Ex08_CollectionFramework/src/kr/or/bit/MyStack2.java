package kr.or.bit;


//�������� ����Ű�


//���� ���� ����� �ڷᱸ�� (����)
//������� : �⺻������ Array  : Object[] stackarr
//����� ���� �ִ� ��ġ ����(index)
//��� : push  , pop , empty (����ִ��� Ȯ��) , full(�� ä�������� Ȯ��)

public class MyStack2 {
	private Object[] stackarr; //����� 
	private int maxsize; //�ִ�ũ��
	private int top; //�迭�� index �� .... ��ġ ���� 
	
	public MyStack2(int maxsize) {
		this.maxsize = maxsize;
		stackarr = new Object[maxsize];
		top = -1;
	}
	public boolean isEmpty() {
		//����
		return (top == -1);
	}
	public boolean full() {
		//����
		return (top == maxsize -1);
	}
	public void push(Object i) {
		//full ���� �Ͻð� ����
		if(full()) {
			System.out.println("stack full");
		}else {
			stackarr[++top] = i; //ó�� top== -1 >> [0]
		}
	}
	
	public Object pop() {
		//isEmpty �����ϰ� ����
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







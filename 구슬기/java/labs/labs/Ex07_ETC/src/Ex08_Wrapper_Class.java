import java.util.ArrayList;

/*
 8���� �⺻Ÿ��(��Ÿ��) : JAVA API �� ����
 
 8���� �⺻Ÿ�Կ� ���ؼ� ��ü ���·� ��밡�� �ϵ��� �����( wra[[er class)
 
 �⺻Ÿ�� ���δ� ��ü ���·� �ٷ�� ����...
 1.�Ű������� ��ü�� �䱸�ɶ�
 2.�⺻�� ���� �ƴ� ��ü�� ���� �Ǿ�� �Ҷ�
 3. ��ü�� ���񱳰� �ʿ��Ҷ�.
 4. Ÿ�� ��ȯ�� ó��
 
 
 */
public class Ex08_Wrapper_Class {
	public static void main(String[] args) {
		int i= 100;
		Integer n = new Integer(500);  
		
		System.out.println("n : "+ n); //n : 500   //�������̵� �Ǿ ��ü�ϱ� �ּҰ��̳����°� ������ ,,,,�װԾƴ� ���� ���´�  �������̵� �Ǿ.. toString() ���� 
		System.out.println(n.MAX_VALUE); //2147483647
		System.out.println(n.MIN_VALUE); //-2147483648
		
		
		//Point Ȱ��
		//parameter Ȱ��
		//generic
		ArrayList<Integer> li = new ArrayList<Integer>();
		li.add(100);
		li.add(200);
		for(int value : li) {
			System.out.println(value);
		}
		
		Integer i2 = new Integer(100); 
		Integer i3 = new Integer(100);
		System.out.println(i2 == i3); //�ּҰ� �� false
		System.out.println(i2.equals(i3)); //�̰� ���� �� �� true
		
		int i4 = 100;
		int i5 = 100;
		System.out.println(i4 == i5); //true
		
		Integer t = new Integer(500); //xx
		intMethod(t); //t ��� ���������� ������ ���� �ѱ� //500
		integerMethod(t); //t ��� ���������� �ּҰ��� �ѱ� // xx -> 500
		

	}
	static void integerMethod(Integer i) {//�Ķ���͸� ���δ� ����Ÿ������ ������ �ִ�....
		System.out.println("integer param : "+ i);  //���̳��´� ��? �������̵�  //toString() ������ �� ���
		//System.out.println(i.MAX_VALUE);
		
	}
	static void intMethod(int i) {  //��� ��Ÿ���̶� . �� ������ �ߴ°� ����
		System.out.println("int param : "+ i);
		
	}
	

}

package kr.or.bit;
//Class ==���赵==Type
//���赵 ��üȭ(�޸� �÷���)�� ���ؼ� ��ü�� �����Ǿ�� �Ѵ�.
//��üȭ�Ȱ� >> ��ü , �ν��Ͻ�,������Ʈ �� �θ�

//���赵 �⺻���� �������(�ʵ� +�Լ� )+������ �� �־�� �̰� ���赵�� ��� ��

//class Car{} >>default class Car {} >> ���� ����(��Ű��) ������ ��밡���ϴ�
//public class Car{ public String color; int door} >>��� �ٸ��������� ��밡���ϴ�. ������ int door �� default int door�� ���ٺҰ�


public class Person { 
	                    // String �� default ����Ÿ��(Class >>null) �ձ��� �빮�ڴ� Ŭ���� ��!
	public String name; // member field >> instance variable 
                        // �ʱ�ȭ�� ���� �ʾƵ� �ȴ�(�ʱ�ȭ : ������ ���� �Ҵ��ϴ� ��)
	                    // �� ������? �����Ǵ� ��ü(���) ���� �ٸ� �̸��� ���� ������ .. ex)�ϳ��� ���赵��, ����, ��������Ʈ �� ������ְ�
	                    // Person p = new Person(); p.name="ȫ�浿" �̷��� �ٸ��� ���� ���ֱ� ���ؼ�
	                    // Person p2 = new person(); p2.name="������"
	                    // default ���� ������.(�ʱ�ȭ�� ���Ұ�� default 0���� ������.)
	                    // public int age; //default > 0
	                    // public boolean power //default > negative �� ���α׷��̶� false���� �⺻�� ��.
	public int age;
	public boolean power;
	//��� (����) >> method       //void :�����ִ� ���� ���� ��� �� 
	public void print() { //�������� ����ϴ� ���
		System.out.println("name : "+ name + "/" + "age : "+ age);
		
		
	}
}

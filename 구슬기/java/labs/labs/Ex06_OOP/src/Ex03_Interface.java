/*
�߻� Ŭ���� : �������̽� (�ϻ󼼰迡 �����ϴ� ǥ��, ���, ��Ģ, �Ծ� �� ����� ����)

 
 ISO����ǥ��..�̶�°� �ֵ�. ����ó���� ���, ���� ũ��..����ü..�����缭 ������ ������ ���.. ISO�� ����Ű�� ���ΰ� ������ ���ʽ��� �ش�.  
 �̰� �������� ���ΰ� ��� ������ ����? �������忡�� �˻��ϱⰡ ����������. 
 ������Ʈ�Ҷ� �������̽� �� �������̴� ������ ũ��. ex �������� �� 
 
 ���Ǽ����� �������̽� ����? �̰� �������̽� ������? �̷���.. ǥ��ȭ�� �������̽�..��ȣ ������ 1~9 ���� �Ǿ��ִٰų�..
 �츮�� ��������������̽��� ����Ұ���. ��� ���������� ����غ���.  ������ ������ ������!
 
 
 ----������----
1. ������ ��ü ���� �Ұ���( new ������ ��� �Ұ���)
�߻�Ŭ���� (�̿ϼ�), �������̽�(������ �߻��ڿ�:��Ӹ� �ְ� ����� ���������� �ʴ´�.)

2.���(extends), ����(implements)�� ���ؼ��� [��밡�� ==(heap�޸𸮿� ���簡��)]

3. [�����Ǹ� ���� ������ ������ ����]�̴�.  �߻��� �Ϻδ� �������ְ� �Ϻθ� �ϼ��ϴ°�����, �������̽��� ����.

 ----�ٸ���----
1. �������̽��� ���� ���� ���� �ϴ�. (���(ǥ��) �ִ��� �۰� ������, ������� Ƽ����� ū������� �����. �׷��ٺ��� �����̵ȴ�)   //����� ������ �빰�������� �����ϰ� �������̽��� ���߱����� �����ϴ�.  
    class Test extends Object implements Ia, Ib, Ic   <<--�̰� �ٷ� ����� ��Ƹ�Ƽ� ũ���Ѵ�. 

2. �߻�Ŭ������ ���� ��� ��Ģ(��Ģ��� ������ ����� ���ؼ� ������ �ޱⰡ��)    

3. �߻�Ŭ���� �ϼ��� �ڵ� + �̿ϼ��ڵ�

4. �������̽��� ����� ������ �������� ��� �̿ϼ�(�߻�) JDK version8 (Default ��, Static ����)�� �Ǵµ� ��Ģ������ �� �����ڵ��� �߻��ڿ��� 100%���� �������̽��� �����.


 
 
 �������̽� : ����Ʈ���� ���� �ֻ��� �ܰ�
 � ������Ʈ�� ����....
 ���θ� ���� ... 
 
 **������(�ʱ�) **
 1. �������̽��� [������]�������� ����(�������̽� �θ�Ÿ��)
 2. ���� �������� ���� Ŭ������ �ϳ��� �����ִ� ����� �ϴ� ���鿡�� �ٶ���. (�θ� �����ϰ� ������)
 3. �������̽��� ������ �ʾƵ� JAVA API �� ���� �����ϰ� �ִ�... �ڹٰ� �̹� ���������� ��븸�ص� ����� ������ �����ϴ�.
 4. �������̽��� (~able) : �� �� �ִ�, ���� �� �� �ִ�(����)
 5. ��ü���� ���� �� (��ü ���� ����)
 
 
 ����Ʈ���� ����
 1. ���ߴܰ��� �ֻ��� >> �䱸���� >> ����(��� �������̽�)
 2. ���� ǥ�� >> ���� ����(����)...>> ������
 
 Interface
 1.���� �����ΰ� ����. : ������� ���� : ���(�ý��ۿ��� �̵�: move, ��ǥ�� ����...)
                                  void move(int x, int y); �߻� �޼���
 JavaAPI  (���߿� �ʿ��� �� ���� �������̽��� ����: �������̽��� ������� ������ Ŭ����...)
 >>Collection (�����迭)  >>Vector, ArrayList, HastSet , HashMap
 >>�������� interface ����..
 
                                  
 �������(������ ������ �ֵ��̶� public)
 1. ���  (final) : public static final int VERSION =1; >> [public static final]�̰� �����ϰ� >> int VERSION =1;  ����Ʈ �����ڷ� �����ϸ�ȵȴ�!!!!!!
 2. �Լ�(method) : public abstract void run(); >> [public abstract]�굵 �̰� ���� >> void run();
 3.             : String move(int x , int y); �̷������� ����!
 
 interface Ia{
 int VERSION=1; //public static final ����
 void run();
 String move(int x, int y);
 }
 
 interface Ia{void run();} //��� ������ ���� �����ʾƵ��ȴ�. �θ�μ� ���� ������.
interface Ib{};
interface Ic{}
//class Test extends object implements Ia, Ib , Ic{}  �̰� Ǯ� ����. 
class Test implements Ia , Ib , Ic{ //�����ϰ� �������̽��� �̷��� ���߻�ӵ� �����ϴ�. 

	@Override
	public void run() {
		// TODO Auto-generated method stub
		
	}
	
}
 */
interface Ia{
	int AGE =100; //public static final �� �����Ǿ�����
	String GENDER="��";
	
	String print(); //public abstract ����
	void message(String str);  //public abstract
	
}
interface Ib{
	int AGE=10;  //public static final
	void info();  //public abstract
	String val(String s);  //public abstract
}

class Test2 extends Object implements Ia,Ib{

	@Override
	public String print() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void message(String str) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void info() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String val(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	
}

public class Ex03_Interface {
	

	public static void main(String[] args) {
		Test2 t = new Test2();
		
		
		Ia ia = t; //������   �������̽��� �θ�Ÿ��..
		System.out.println(ia.AGE);  //100
		
		Ib ib = t;
		System.out.println(ib.AGE);  //10

		
	}

}
